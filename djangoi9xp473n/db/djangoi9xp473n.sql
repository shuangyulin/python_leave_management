-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: djangoi9xp473n
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `djangoi9xp473n`
--

/*!40000 DROP DATABASE IF EXISTS `djangoi9xp473n`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `djangoi9xp473n` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `djangoi9xp473n`;

--
-- Table structure for table `banjixinxi`
--

DROP TABLE IF EXISTS `banjixinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banjixinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `banji` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '班级',
  PRIMARY KEY (`id`),
  UNIQUE KEY `banji` (`banji`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='班级信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banjixinxi`
--

LOCK TABLES `banjixinxi` WRITE;
/*!40000 ALTER TABLE `banjixinxi` DISABLE KEYS */;
INSERT INTO `banjixinxi` VALUES (1,'2025-03-04 04:07:22','班级1'),(2,'2025-03-04 04:07:22','班级2'),(3,'2025-03-04 04:07:22','班级3'),(4,'2025-03-04 04:07:22','班级4'),(5,'2025-03-04 04:07:22','班级5'),(6,'2025-03-04 04:07:22','班级6'),(7,'2025-03-04 04:07:22','班级7'),(8,'2025-03-04 04:07:22','班级8');
/*!40000 ALTER TABLE `banjixinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  `url` varchar(500) DEFAULT NULL COMMENT 'url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','upload/picture1.jpg',NULL),(2,'picture2','upload/picture2.jpg',NULL),(3,'picture3','upload/picture3.jpg',NULL);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fudaoyuan`
--

DROP TABLE IF EXISTS `fudaoyuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fudaoyuan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `fudaogonghao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '辅导工号',
  `mima` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `fudaoxingming` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '辅导姓名',
  `xingbie` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `banji` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '班级',
  `lianxidianhua` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `touxiang` longtext COLLATE utf8mb4_unicode_ci COMMENT '头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fudaogonghao` (`fudaogonghao`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='辅导员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudaoyuan`
--

LOCK TABLES `fudaoyuan` WRITE;
/*!40000 ALTER TABLE `fudaoyuan` DISABLE KEYS */;
INSERT INTO `fudaoyuan` VALUES (21,'2025-03-04 04:07:22','辅导工号1','123456','辅导姓名1','男','班级1','13823888881','upload/fudaoyuan_touxiang1.jpg'),(22,'2025-03-04 04:07:22','辅导工号2','123456','辅导姓名2','男','班级2','13823888882','upload/fudaoyuan_touxiang2.jpg'),(23,'2025-03-04 04:07:22','辅导工号3','123456','辅导姓名3','男','班级3','13823888883','upload/fudaoyuan_touxiang3.jpg'),(24,'2025-03-04 04:07:22','辅导工号4','123456','辅导姓名4','男','班级4','13823888884','upload/fudaoyuan_touxiang4.jpg'),(25,'2025-03-04 04:07:22','辅导工号5','123456','辅导姓名5','男','班级5','13823888885','upload/fudaoyuan_touxiang5.jpg'),(26,'2025-03-04 04:07:22','辅导工号6','123456','辅导姓名6','男','班级6','13823888886','upload/fudaoyuan_touxiang6.jpg'),(27,'2025-03-04 04:07:22','辅导工号7','123456','辅导姓名7','男','班级7','13823888887','upload/fudaoyuan_touxiang7.jpg'),(28,'2025-03-04 04:07:22','辅导工号8','123456','辅导姓名8','男','班级8','13823888888','upload/fudaoyuan_touxiang8.jpg');
/*!40000 ALTER TABLE `fudaoyuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leavedata`
--

DROP TABLE IF EXISTS `leavedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leavedata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `semester` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学期',
  `studentid` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `banji` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '班级',
  `numberofleaverequests` int(11) DEFAULT NULL COMMENT '请假次数',
  `registrationdate` date DEFAULT NULL COMMENT '登记日期',
  `fudaogonghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '辅导工号',
  `fudaoxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '辅导姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='请假数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leavedata`
--

LOCK TABLES `leavedata` WRITE;
/*!40000 ALTER TABLE `leavedata` DISABLE KEYS */;
INSERT INTO `leavedata` VALUES (1,'2025-03-04 04:07:22','上学期','学号1','姓名1','班级1',1,'2025-03-04','辅导工号1','辅导姓名1'),(2,'2025-03-04 04:07:22','上学期','学号2','姓名2','班级2',2,'2025-03-04','辅导工号2','辅导姓名2'),(3,'2025-03-04 04:07:22','上学期','学号3','姓名3','班级3',3,'2025-03-04','辅导工号3','辅导姓名3'),(4,'2025-03-04 04:07:22','上学期','学号4','姓名4','班级4',4,'2025-03-04','辅导工号4','辅导姓名4'),(5,'2025-03-04 04:07:22','上学期','学号5','姓名5','班级5',5,'2025-03-04','辅导工号5','辅导姓名5'),(6,'2025-03-04 04:07:22','上学期','学号6','姓名6','班级6',6,'2025-03-04','辅导工号6','辅导姓名6'),(7,'2025-03-04 04:07:22','上学期','学号7','姓名7','班级7',7,'2025-03-04','辅导工号7','辅导姓名7'),(8,'2025-03-04 04:07:22','上学期','学号8','姓名8','班级8',8,'2025-03-04','辅导工号8','辅导姓名8');
/*!40000 ALTER TABLE `leavedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leavedataforecast`
--

DROP TABLE IF EXISTS `leavedataforecast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leavedataforecast` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `semester` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学期',
  `studentid` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学号',
  `numberofleaverequests` int(11) DEFAULT NULL COMMENT '请假次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='请假次数预测';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leavedataforecast`
--

LOCK TABLES `leavedataforecast` WRITE;
/*!40000 ALTER TABLE `leavedataforecast` DISABLE KEYS */;
INSERT INTO `leavedataforecast` VALUES (1,'2025-03-04 04:07:22','上学期','学号1',1),(2,'2025-03-04 04:07:22','上学期','学号2',2),(3,'2025-03-04 04:07:22','上学期','学号3',3),(4,'2025-03-04 04:07:22','上学期','学号4',4),(5,'2025-03-04 04:07:22','上学期','学号5',5),(6,'2025-03-04 04:07:22','上学期','学号6',6),(7,'2025-03-04 04:07:22','上学期','学号7',7),(8,'2025-03-04 04:07:22','上学期','学号8',8);
/*!40000 ALTER TABLE `leavedataforecast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `image` varchar(200) DEFAULT NULL COMMENT '头像',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','upload/image1.jpg','管理员','2025-03-04 04:07:22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xuesheng`
--

DROP TABLE IF EXISTS `xuesheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xuesheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '学号',
  `mima` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `xingming` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `shouji` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机',
  `banji` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '班级',
  `fudaogonghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '辅导工号',
  `fudaoxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '辅导姓名',
  `touxiang` longtext COLLATE utf8mb4_unicode_ci COMMENT '头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xuehao` (`xuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xuesheng`
--

LOCK TABLES `xuesheng` WRITE;
/*!40000 ALTER TABLE `xuesheng` DISABLE KEYS */;
INSERT INTO `xuesheng` VALUES (11,'2025-03-04 04:07:22','学号1','123456','姓名1','男','13823888881','班级1','辅导工号1','辅导姓名1','upload/xuesheng_touxiang1.jpg'),(12,'2025-03-04 04:07:22','学号2','123456','姓名2','男','13823888882','班级2','辅导工号2','辅导姓名2','upload/xuesheng_touxiang2.jpg'),(13,'2025-03-04 04:07:22','学号3','123456','姓名3','男','13823888883','班级3','辅导工号3','辅导姓名3','upload/xuesheng_touxiang3.jpg'),(14,'2025-03-04 04:07:22','学号4','123456','姓名4','男','13823888884','班级4','辅导工号4','辅导姓名4','upload/xuesheng_touxiang4.jpg'),(15,'2025-03-04 04:07:22','学号5','123456','姓名5','男','13823888885','班级5','辅导工号5','辅导姓名5','upload/xuesheng_touxiang5.jpg'),(16,'2025-03-04 04:07:22','学号6','123456','姓名6','男','13823888886','班级6','辅导工号6','辅导姓名6','upload/xuesheng_touxiang6.jpg'),(17,'2025-03-04 04:07:22','学号7','123456','姓名7','男','13823888887','班级7','辅导工号7','辅导姓名7','upload/xuesheng_touxiang7.jpg'),(18,'2025-03-04 04:07:22','学号8','123456','姓名8','男','13823888888','班级8','辅导工号8','辅导姓名8','upload/xuesheng_touxiang8.jpg');
/*!40000 ALTER TABLE `xuesheng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xueshengqingjia`
--

DROP TABLE IF EXISTS `xueshengqingjia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xueshengqingjia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `qingjiabianhao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请假编号',
  `qingjialeixing` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请假类型',
  `xuehao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `banji` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '班级',
  `qishishijian` datetime DEFAULT NULL COMMENT '起始时间',
  `jieshushijian` datetime DEFAULT NULL COMMENT '结束时间',
  `qingjiatianshu` int(11) DEFAULT NULL COMMENT '请假天数',
  `qingjiashiyou` longtext COLLATE utf8mb4_unicode_ci COMMENT '请假事由',
  `fudaogonghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '辅导工号',
  `fudaoxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '辅导姓名',
  `sfsh` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '待审核' COMMENT '是否审核',
  `shhf` longtext COLLATE utf8mb4_unicode_ci COMMENT '审核回复',
  PRIMARY KEY (`id`),
  UNIQUE KEY `qingjiabianhao` (`qingjiabianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学生请假';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xueshengqingjia`
--

LOCK TABLES `xueshengqingjia` WRITE;
/*!40000 ALTER TABLE `xueshengqingjia` DISABLE KEYS */;
INSERT INTO `xueshengqingjia` VALUES (1,'2025-03-04 04:07:22','1111111111','病假','学号1','姓名1','班级1','2025-03-04 12:07:22','2025-03-04 12:07:22',1,'请假事由1','辅导工号1','辅导姓名1','是',''),(2,'2025-03-04 04:07:22','2222222222','病假','学号2','姓名2','班级2','2025-03-04 12:07:22','2025-03-04 12:07:22',2,'请假事由2','辅导工号2','辅导姓名2','是',''),(3,'2025-03-04 04:07:22','3333333333','病假','学号3','姓名3','班级3','2025-03-04 12:07:22','2025-03-04 12:07:22',3,'请假事由3','辅导工号3','辅导姓名3','是',''),(4,'2025-03-04 04:07:22','4444444444','病假','学号4','姓名4','班级4','2025-03-04 12:07:22','2025-03-04 12:07:22',4,'请假事由4','辅导工号4','辅导姓名4','是',''),(5,'2025-03-04 04:07:22','5555555555','病假','学号5','姓名5','班级5','2025-03-04 12:07:22','2025-03-04 12:07:22',5,'请假事由5','辅导工号5','辅导姓名5','是',''),(6,'2025-03-04 04:07:22','6666666666','病假','学号6','姓名6','班级6','2025-03-04 12:07:22','2025-03-04 12:07:22',6,'请假事由6','辅导工号6','辅导姓名6','是',''),(7,'2025-03-04 04:07:22','7777777777','病假','学号7','姓名7','班级7','2025-03-04 12:07:22','2025-03-04 12:07:22',7,'请假事由7','辅导工号7','辅导姓名7','是',''),(8,'2025-03-04 04:07:22','8888888888','病假','学号8','姓名8','班级8','2025-03-04 12:07:22','2025-03-04 12:07:22',8,'请假事由8','辅导工号8','辅导姓名8','是','');
/*!40000 ALTER TABLE `xueshengqingjia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-07 16:45:36
