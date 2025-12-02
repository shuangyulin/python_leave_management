import configparser
import re
import json
import os
import mysql.connector
from django.http import JsonResponse
from hdfs import InsecureClient
from pyhive import hive
import csv
from util.configread import config_read
from util.CustomJSONEncoder import CustomJsonEncoder
from util.codes import normal_code, system_error_code
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, date_format
import shutil
# 获取当前文件路径的根目录
parent_directory = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

m_username = "Administrator"
hadoop_client = InsecureClient('http://localhost:9870')

dbtype, host, port, user, passwd, dbName, charset,hasHadoop = config_read(os.path.join(parent_directory,"config.ini"))

#将mysql里的相关表转成hive库里的表
def migrate_to_hive():

    mysql_conn = mysql.connector.connect(
        host=host,
        port=port,
        user=user,
        password=passwd,
        database=dbName
    )
    cursor = mysql_conn.cursor()

    hive_conn = hive.Connection(
        host='localhost',
        port=10000,
        username=m_username,
    )
    hive_cursor = hive_conn.cursor()
    #创建Hive数据库（如果不存在）
    hive_cursor.execute(f"CREATE DATABASE IF NOT EXISTS {dbName}")
    hive_cursor.execute(f"USE {dbName}")

    xuesheng_table_path=f'/user/hive/warehouse/{dbName}.db/xuesheng'
    #删除已有的hive表
    if hadoop_client.status(xuesheng_table_path,strict=False):
        hadoop_client.delete(xuesheng_table_path, recursive=True)
    # 在Hive中删除表
    xuesheng_drop_table_query = f"""DROP TABLE xuesheng"""
    hive_cursor.execute(xuesheng_drop_table_query)
    cursor.execute("SELECT * FROM xuesheng")
    xuesheng_column_info = cursor.fetchall()
    #将数据写入 CSV 文件
    xuesheng_path = os.path.join(parent_directory, "xuesheng.csv")
    with open(xuesheng_path, 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)
        # 写入数据行
        for row in xuesheng_column_info:
            writer.writerow(row)
    xuesheng_spakr_clear(xuesheng_path)
    cursor.execute("DESCRIBE xuesheng")
    xuesheng_column_info = cursor.fetchall()
    create_table_query = "CREATE TABLE IF NOT EXISTS xuesheng ("
    for column, data_type, _, _, _, _ in xuesheng_column_info:
        match = re.match(r'(\w+)(\(\d+\))?', data_type)
        mysql_type = match.group(1)
        hive_data_type = get_hive_type(mysql_type)
        create_table_query += f"{column} {hive_data_type}, "
    xuesheng_create_table_query = create_table_query[:-2] + ") row format delimited fields terminated by ','"
    hive_cursor.execute(xuesheng_create_table_query)
    # 上传映射文件
    xuesheng_hdfs_csv_path = f'/user/hive/warehouse/{dbName}.db/xuesheng'
    hadoop_client.upload(xuesheng_hdfs_csv_path, xuesheng_path)
    fudaoyuan_table_path=f'/user/hive/warehouse/{dbName}.db/fudaoyuan'
    #删除已有的hive表
    if hadoop_client.status(fudaoyuan_table_path,strict=False):
        hadoop_client.delete(fudaoyuan_table_path, recursive=True)
    # 在Hive中删除表
    fudaoyuan_drop_table_query = f"""DROP TABLE fudaoyuan"""
    hive_cursor.execute(fudaoyuan_drop_table_query)
    cursor.execute("SELECT * FROM fudaoyuan")
    fudaoyuan_column_info = cursor.fetchall()
    #将数据写入 CSV 文件
    fudaoyuan_path = os.path.join(parent_directory, "fudaoyuan.csv")
    with open(fudaoyuan_path, 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)
        # 写入数据行
        for row in fudaoyuan_column_info:
            writer.writerow(row)
    fudaoyuan_spakr_clear(fudaoyuan_path)
    cursor.execute("DESCRIBE fudaoyuan")
    fudaoyuan_column_info = cursor.fetchall()
    create_table_query = "CREATE TABLE IF NOT EXISTS fudaoyuan ("
    for column, data_type, _, _, _, _ in fudaoyuan_column_info:
        match = re.match(r'(\w+)(\(\d+\))?', data_type)
        mysql_type = match.group(1)
        hive_data_type = get_hive_type(mysql_type)
        create_table_query += f"{column} {hive_data_type}, "
    fudaoyuan_create_table_query = create_table_query[:-2] + ") row format delimited fields terminated by ','"
    hive_cursor.execute(fudaoyuan_create_table_query)
    # 上传映射文件
    fudaoyuan_hdfs_csv_path = f'/user/hive/warehouse/{dbName}.db/fudaoyuan'
    hadoop_client.upload(fudaoyuan_hdfs_csv_path, fudaoyuan_path)
    xueshengqingjia_table_path=f'/user/hive/warehouse/{dbName}.db/xueshengqingjia'
    #删除已有的hive表
    if hadoop_client.status(xueshengqingjia_table_path,strict=False):
        hadoop_client.delete(xueshengqingjia_table_path, recursive=True)
    # 在Hive中删除表
    xueshengqingjia_drop_table_query = f"""DROP TABLE xueshengqingjia"""
    hive_cursor.execute(xueshengqingjia_drop_table_query)
    cursor.execute("SELECT * FROM xueshengqingjia")
    xueshengqingjia_column_info = cursor.fetchall()
    #将数据写入 CSV 文件
    xueshengqingjia_path = os.path.join(parent_directory, "xueshengqingjia.csv")
    with open(xueshengqingjia_path, 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)
        # 写入数据行
        for row in xueshengqingjia_column_info:
            writer.writerow(row)
    xueshengqingjia_spakr_clear(xueshengqingjia_path)
    cursor.execute("DESCRIBE xueshengqingjia")
    xueshengqingjia_column_info = cursor.fetchall()
    create_table_query = "CREATE TABLE IF NOT EXISTS xueshengqingjia ("
    for column, data_type, _, _, _, _ in xueshengqingjia_column_info:
        match = re.match(r'(\w+)(\(\d+\))?', data_type)
        mysql_type = match.group(1)
        hive_data_type = get_hive_type(mysql_type)
        create_table_query += f"{column} {hive_data_type}, "
    xueshengqingjia_create_table_query = create_table_query[:-2] + ") row format delimited fields terminated by ','"
    hive_cursor.execute(xueshengqingjia_create_table_query)
    # 上传映射文件
    xueshengqingjia_hdfs_csv_path = f'/user/hive/warehouse/{dbName}.db/xueshengqingjia'
    hadoop_client.upload(xueshengqingjia_hdfs_csv_path, xueshengqingjia_path)
    leavedataforecast_table_path=f'/user/hive/warehouse/{dbName}.db/leavedataforecast'
    #删除已有的hive表
    if hadoop_client.status(leavedataforecast_table_path,strict=False):
        hadoop_client.delete(leavedataforecast_table_path, recursive=True)
    # 在Hive中删除表
    leavedataforecast_drop_table_query = f"""DROP TABLE leavedataforecast"""
    hive_cursor.execute(leavedataforecast_drop_table_query)
    cursor.execute("SELECT * FROM leavedataforecast")
    leavedataforecast_column_info = cursor.fetchall()
    #将数据写入 CSV 文件
    leavedataforecast_path = os.path.join(parent_directory, "leavedataforecast.csv")
    with open(leavedataforecast_path, 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)
        # 写入数据行
        for row in leavedataforecast_column_info:
            writer.writerow(row)
    leavedataforecast_spakr_clear(leavedataforecast_path)
    cursor.execute("DESCRIBE leavedataforecast")
    leavedataforecast_column_info = cursor.fetchall()
    create_table_query = "CREATE TABLE IF NOT EXISTS leavedataforecast ("
    for column, data_type, _, _, _, _ in leavedataforecast_column_info:
        match = re.match(r'(\w+)(\(\d+\))?', data_type)
        mysql_type = match.group(1)
        hive_data_type = get_hive_type(mysql_type)
        create_table_query += f"{column} {hive_data_type}, "
    leavedataforecast_create_table_query = create_table_query[:-2] + ") row format delimited fields terminated by ','"
    hive_cursor.execute(leavedataforecast_create_table_query)
    # 上传映射文件
    leavedataforecast_hdfs_csv_path = f'/user/hive/warehouse/{dbName}.db/leavedataforecast'
    hadoop_client.upload(leavedataforecast_hdfs_csv_path, leavedataforecast_path)
    cursor.close()
    mysql_conn.close()
    hive_cursor.close()
    hive_conn.close()

#转换成hive的类型
def get_hive_type(mysql_type):
    type_mapping = {
        'INT': 'INT',
        'BIGINT': 'BIGINT',
        'FLOAT': 'FLOAT',
        'DOUBLE': 'DOUBLE',
        'DECIMAL': 'DECIMAL',
        'VARCHAR': 'STRING',
        'TEXT': 'STRING',
    }
    if isinstance(mysql_type, str):
        mysql_type = mysql_type.upper()
    return type_mapping.get(str(mysql_type), 'STRING')

#执行hive查询
def hive_query():
    # 连接到Hive服务器
    conn = hive.Connection(host='localhost', port=10000, username=m_username,database=dbName)
    # 创建一个游标对象
    cursor = conn.cursor()
    try:

        #定义Hive查询语句
        xingbie_query = "SELECT COUNT(*) AS total, xingbie FROM xuesheng GROUP BY xingbie"
        # 执行Hive查询语句
        cursor.execute(xingbie_query)
        # 获取查询结果
        xingbie_results = cursor.fetchall()
        xingbie_json_list=[]
        for row in xingbie_results:
            xingbie_json_list.append({"xingbie":row[1],"total":row[0]})
        #将JSON数据写入文件
        with open(os.path.join(parent_directory, "xuesheng_groupxingbie.json"), 'w', encoding='utf-8') as f:
            json.dump(xingbie_json_list, f, ensure_ascii=False, indent=4)


        #定义Hive查询语句
        xingbie_query = "SELECT COUNT(*) AS total, xingbie FROM fudaoyuan GROUP BY xingbie"
        # 执行Hive查询语句
        cursor.execute(xingbie_query)
        # 获取查询结果
        xingbie_results = cursor.fetchall()
        xingbie_json_list=[]
        for row in xingbie_results:
            xingbie_json_list.append({"xingbie":row[1],"total":row[0]})
        #将JSON数据写入文件
        with open(os.path.join(parent_directory, "fudaoyuan_groupxingbie.json"), 'w', encoding='utf-8') as f:
            json.dump(xingbie_json_list, f, ensure_ascii=False, indent=4)


        #定义Hive查询语句
        qingjialeixing_query = "SELECT COUNT(*) AS total, qingjialeixing FROM xueshengqingjia GROUP BY qingjialeixing"
        # 执行Hive查询语句
        cursor.execute(qingjialeixing_query)
        # 获取查询结果
        qingjialeixing_results = cursor.fetchall()
        qingjialeixing_json_list=[]
        for row in qingjialeixing_results:
            qingjialeixing_json_list.append({"qingjialeixing":row[1],"total":row[0]})
        #将JSON数据写入文件
        with open(os.path.join(parent_directory, "xueshengqingjia_groupqingjialeixing.json"), 'w', encoding='utf-8') as f:
            json.dump(qingjialeixing_json_list, f, ensure_ascii=False, indent=4)


        #定义Hive查询语句
        xingming_query = "SELECT COUNT(*) AS total, xingming FROM xueshengqingjia GROUP BY xingming"
        # 执行Hive查询语句
        cursor.execute(xingming_query)
        # 获取查询结果
        xingming_results = cursor.fetchall()
        xingming_json_list=[]
        for row in xingming_results:
            xingming_json_list.append({"xingming":row[1],"total":row[0]})
        #将JSON数据写入文件
        with open(os.path.join(parent_directory, "xueshengqingjia_groupxingming.json"), 'w', encoding='utf-8') as f:
            json.dump(xingming_json_list, f, ensure_ascii=False, indent=4)


        #定义Hive查询语句
        banji_query = "SELECT COUNT(*) AS total, banji FROM xueshengqingjia GROUP BY banji"
        # 执行Hive查询语句
        cursor.execute(banji_query)
        # 获取查询结果
        banji_results = cursor.fetchall()
        banji_json_list=[]
        for row in banji_results:
            banji_json_list.append({"banji":row[1],"total":row[0]})
        #将JSON数据写入文件
        with open(os.path.join(parent_directory, "xueshengqingjia_groupbanji.json"), 'w', encoding='utf-8') as f:
            json.dump(banji_json_list, f, ensure_ascii=False, indent=4)

        where = ' WHERE 1 = 1 '
        studentid_query = f'''SELECT `studentid`, ROUND(SUM(`numberofleaverequests`), 2) AS `total`
            FROM leavedataforecast {where} GROUP BY `studentid`'''
        #执行Hive查询语句
        cursor.execute(studentid_query)
        # 获取查询结果
        studentid_results = cursor.fetchall()
        studentid_json_list=[]
        for row in studentid_results:
            studentid_json_list.append({"studentid":row[0],"total":row[1]})
        #将JSON数据写入文件
        with open(os.path.join(parent_directory, "leavedataforecast_valuestudentidnumberofleaverequests.json"), 'w', encoding='utf-8') as f:
            json.dump(studentid_json_list, f, ensure_ascii=False, indent=4)
        pass
    except Exception as e:
         print(f"An error occurred: {e}")
    finally:
        # 关闭游标和连接
        cursor.close()
        conn.close()

#spark数据清洗和预处理
def xuesheng_spakr_clear(csvpath):
    try:
        #创建Spark会话
        spark = SparkSession.builder.appName("djangoi9xp473n").getOrCreate()
        df = spark.read.csv(csvpath, header=False, inferSchema=True)
        df = df.toDF(
            "id",
            "addtime",
            "xuehao",
            "mima",
            "xingming",
            "xingbie",
            "shouji",
            "banji",
            "fudaogonghao",
            "fudaoxingming",
            "touxiang",
        )
        #显示原始数据
        df.show()
        #1.删除空值
        df_cleaned = df.dropna()
        #2.去除重复行
        df_cleaned = df_cleaned.dropDuplicates()
        df_cleaned = df_cleaned.withColumn("addtime", date_format(col("addtime"), 'yyyy-MM-dd HH:mm:ss'))
        #显示清洗后的数据
        df_cleaned.show()
        #保存清洗后的数据
        print(type(df_cleaned))
        output_path = 'xuesheng_output_dir'  # 输出的目录
        df_cleaned.coalesce(1).write.csv(output_path, header=False, mode="overwrite")
        #手动移动生成的 CSV 文件到目标路径，并重命名
        for filename in os.listdir(output_path):
            if filename.startswith("part-") and filename.endswith(".csv"):
                shutil.move(os.path.join(output_path, filename), csvpath)
        #清理临时目录
        shutil.rmtree(output_path)
        #停止Spark会话
        spark.stop()
    except Exception as e:
        print("e:",e)
#spark数据清洗和预处理
def fudaoyuan_spakr_clear(csvpath):
    try:
        #创建Spark会话
        spark = SparkSession.builder.appName("djangoi9xp473n").getOrCreate()
        df = spark.read.csv(csvpath, header=False, inferSchema=True)
        df = df.toDF(
            "id",
            "addtime",
            "fudaogonghao",
            "mima",
            "fudaoxingming",
            "xingbie",
            "banji",
            "lianxidianhua",
            "touxiang",
        )
        #显示原始数据
        df.show()
        #1.删除空值
        df_cleaned = df.dropna()
        #2.去除重复行
        df_cleaned = df_cleaned.dropDuplicates()
        df_cleaned = df_cleaned.withColumn("addtime", date_format(col("addtime"), 'yyyy-MM-dd HH:mm:ss'))
        #显示清洗后的数据
        df_cleaned.show()
        #保存清洗后的数据
        print(type(df_cleaned))
        output_path = 'fudaoyuan_output_dir'  # 输出的目录
        df_cleaned.coalesce(1).write.csv(output_path, header=False, mode="overwrite")
        #手动移动生成的 CSV 文件到目标路径，并重命名
        for filename in os.listdir(output_path):
            if filename.startswith("part-") and filename.endswith(".csv"):
                shutil.move(os.path.join(output_path, filename), csvpath)
        #清理临时目录
        shutil.rmtree(output_path)
        #停止Spark会话
        spark.stop()
    except Exception as e:
        print("e:",e)
#spark数据清洗和预处理
def xueshengqingjia_spakr_clear(csvpath):
    try:
        #创建Spark会话
        spark = SparkSession.builder.appName("djangoi9xp473n").getOrCreate()
        df = spark.read.csv(csvpath, header=False, inferSchema=True)
        df = df.toDF(
            "id",
            "addtime",
            "qingjiabianhao",
            "qingjialeixing",
            "xuehao",
            "xingming",
            "banji",
            "qishishijian",
            "jieshushijian",
            "qingjiatianshu",
            "qingjiashiyou",
            "fudaogonghao",
            "fudaoxingming",
            "sfsh",
            "shhf",
        )
        #显示原始数据
        df.show()
        #1.删除空值
        df_cleaned = df.dropna()
        #2.去除重复行
        df_cleaned = df_cleaned.dropDuplicates()
        df_cleaned = df_cleaned.withColumn("addtime", date_format(col("addtime"), 'yyyy-MM-dd HH:mm:ss'))
        df_cleaned = df_cleaned.withColumn("qishishijian", date_format(col("qishishijian"), 'yyyy-MM-dd HH:mm:ss'))
        df_cleaned = df_cleaned.withColumn("jieshushijian", date_format(col("jieshushijian"), 'yyyy-MM-dd HH:mm:ss'))
        #显示清洗后的数据
        df_cleaned.show()
        #保存清洗后的数据
        print(type(df_cleaned))
        output_path = 'xueshengqingjia_output_dir'  # 输出的目录
        df_cleaned.coalesce(1).write.csv(output_path, header=False, mode="overwrite")
        #手动移动生成的 CSV 文件到目标路径，并重命名
        for filename in os.listdir(output_path):
            if filename.startswith("part-") and filename.endswith(".csv"):
                shutil.move(os.path.join(output_path, filename), csvpath)
        #清理临时目录
        shutil.rmtree(output_path)
        #停止Spark会话
        spark.stop()
    except Exception as e:
        print("e:",e)
#spark数据清洗和预处理
def leavedataforecast_spakr_clear(csvpath):
    try:
        #创建Spark会话
        spark = SparkSession.builder.appName("djangoi9xp473n").getOrCreate()
        df = spark.read.csv(csvpath, header=False, inferSchema=True)
        df = df.toDF(
            "id",
            "addtime",
            "semester",
            "studentid",
            "numberofleaverequests",
        )
        #显示原始数据
        df.show()
        #1.删除空值
        df_cleaned = df.dropna()
        #2.去除重复行
        df_cleaned = df_cleaned.dropDuplicates()
        df_cleaned = df_cleaned.withColumn("addtime", date_format(col("addtime"), 'yyyy-MM-dd HH:mm:ss'))
        #显示清洗后的数据
        df_cleaned.show()
        #保存清洗后的数据
        print(type(df_cleaned))
        output_path = 'leavedataforecast_output_dir'  # 输出的目录
        df_cleaned.coalesce(1).write.csv(output_path, header=False, mode="overwrite")
        #手动移动生成的 CSV 文件到目标路径，并重命名
        for filename in os.listdir(output_path):
            if filename.startswith("part-") and filename.endswith(".csv"):
                shutil.move(os.path.join(output_path, filename), csvpath)
        #清理临时目录
        shutil.rmtree(output_path)
        #停止Spark会话
        spark.stop()
    except Exception as e:
        print("e:",e)
    # hive分析
def shive_analyze(request):
    if request.method in ["POST", "GET"]:
        msg = {"code": normal_code, "msg": "成功", "data": {}}
        try:
            migrate_to_hive()
            hive_query()
            return JsonResponse(msg, encoder=CustomJsonEncoder)
        except Exception as e:
            msg['code'] = system_error_code
            msg['msg'] = f"发生错误：{e}"
            return JsonResponse(msg, encoder=CustomJsonEncoder)



