<template>
	<div>
		<div class="register-container">
			<el-form v-if="pageFlag=='register'" ref="ruleForm" class="rgs-form animate__animated animate__fadeInDown" :model="ruleForm" :rules="rules">
				<div class="rgs-form2">
					<div class="title">基于Python+Django的大学生请假管理系统</div>
					<el-form-item class="list-item" v-if="tableName=='xuesheng'">
						<div class="lable" :class="changeRules('xuehao')?'required':''">学号：</div>
						<el-input  v-model="ruleForm.xuehao"  autocomplete="off" placeholder="学号"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='xuesheng'">
						<div class="lable" :class="changeRules('mima')?'required':''">密码：</div>
						<el-input  v-model="ruleForm.mima"  autocomplete="off" placeholder="密码"  type="password"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='xuesheng'">
						<div class="lable" :class="changeRules('mima')?'required':''">确认密码：</div>
						<el-input  v-model="ruleForm.mima2" autocomplete="off" placeholder="确认密码" type="password" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='xuesheng'">
						<div class="lable" :class="changeRules('xingming')?'required':''">姓名：</div>
						<el-input  v-model="ruleForm.xingming"  autocomplete="off" placeholder="姓名"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='xuesheng'">
						<div class="lable" :class="changeRules('xingbie')?'required':''">性别：</div>
						<el-select v-model="ruleForm.xingbie" placeholder="请选择性别" >
							<el-option
								v-for="(item,index) in xueshengxingbieOptions"
								v-bind:key="index"
								:label="item"
								:value="item">
							</el-option>
						</el-select>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='xuesheng'">
						<div class="lable" :class="changeRules('shouji')?'required':''">手机：</div>
						<el-input  v-model="ruleForm.shouji"  autocomplete="off" placeholder="手机"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='xuesheng'">
						<div class="lable" :class="changeRules('banji')?'required':''">班级：</div>
						<el-select v-model="ruleForm.banji" placeholder="请选择班级" >
							<el-option
								v-for="(item,index) in xueshengbanjiOptions"
								v-bind:key="index"
								:label="item"
								:value="item">
							</el-option>
						</el-select>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='xuesheng'">
						<div class="lable" :class="changeRules('touxiang')?'required':''">头像：</div>
						<file-upload
							tip="点击上传头像"
							action="file/upload"
							:limit="3"
							:multiple="true"
							:fileUrls="ruleForm.touxiang?ruleForm.touxiang:''"
							@change="xueshengtouxiangUploadChange"
						></file-upload>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='fudaoyuan'">
						<div class="lable" :class="changeRules('fudaogonghao')?'required':''">辅导工号：</div>
						<el-input  v-model="ruleForm.fudaogonghao"  autocomplete="off" placeholder="辅导工号"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='fudaoyuan'">
						<div class="lable" :class="changeRules('mima')?'required':''">密码：</div>
						<el-input  v-model="ruleForm.mima"  autocomplete="off" placeholder="密码"  type="password"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='fudaoyuan'">
						<div class="lable" :class="changeRules('mima')?'required':''">确认密码：</div>
						<el-input  v-model="ruleForm.mima2" autocomplete="off" placeholder="确认密码" type="password" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='fudaoyuan'">
						<div class="lable" :class="changeRules('fudaoxingming')?'required':''">辅导姓名：</div>
						<el-input  v-model="ruleForm.fudaoxingming"  autocomplete="off" placeholder="辅导姓名"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='fudaoyuan'">
						<div class="lable" :class="changeRules('xingbie')?'required':''">性别：</div>
						<el-select v-model="ruleForm.xingbie" placeholder="请选择性别" >
							<el-option
								v-for="(item,index) in fudaoyuanxingbieOptions"
								v-bind:key="index"
								:label="item"
								:value="item">
							</el-option>
						</el-select>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='fudaoyuan'">
						<div class="lable" :class="changeRules('banji')?'required':''">班级：</div>
						<el-select v-model="ruleForm.banji" placeholder="请选择班级" >
							<el-option
								v-for="(item,index) in fudaoyuanbanjiOptions"
								v-bind:key="index"
								:label="item"
								:value="item">
							</el-option>
						</el-select>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='fudaoyuan'">
						<div class="lable" :class="changeRules('lianxidianhua')?'required':''">联系电话：</div>
						<el-input  v-model="ruleForm.lianxidianhua"  autocomplete="off" placeholder="联系电话"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='fudaoyuan'">
						<div class="lable" :class="changeRules('touxiang')?'required':''">头像：</div>
						<file-upload
							tip="点击上传头像"
							action="file/upload"
							:limit="3"
							:multiple="true"
							:fileUrls="ruleForm.touxiang?ruleForm.touxiang:''"
							@change="fudaoyuantouxiangUploadChange"
						></file-upload>
					</el-form-item>
					<div class="register-btn">
						<div class="register-btn1">
							<button type="button" class="r-btn" @click="login()">注册</button>
						</div>
						<div class="register-btn2">
							<div class="r-login" @click="close()">已有账号，直接登录</div>
						</div>
					</div>
				</div>
			</el-form>
		</div>
	</div>
</template>

<script>
	import 'animate.css'
export default {
	data() {
		return {
			ruleForm: {
			},
			forgetForm: {},
            pageFlag : '',
			tableName:"",
			rules: {},
            xueshengxingbieOptions: [],
            xueshengbanjiOptions: [],
            xueshengfudaogonghaoOptions: [],
            fudaoyuanxingbieOptions: [],
            fudaoyuanbanjiOptions: [],
		};
	},
	mounted(){
		this.pageFlag = this.$route.query.pageFlag
		if(this.$route.query.pageFlag=='register'){
			
			let table = this.$storage.get("loginTable");
			this.tableName = table;
			if(this.tableName=='xuesheng'){
				this.ruleForm = {
					xuehao: '',
					mima: '',
					xingming: '',
					xingbie: '',
					shouji: '',
					banji: '',
					fudaogonghao: '',
					fudaoxingming: '',
					touxiang: '',
				}
			}
			if(this.tableName=='fudaoyuan'){
				this.ruleForm = {
					fudaogonghao: '',
					mima: '',
					fudaoxingming: '',
					xingbie: '',
					banji: '',
					lianxidianhua: '',
					touxiang: '',
				}
			}
			if ('xuesheng' == this.tableName) {
				this.rules.xuehao = [{ required: true, message: '请输入学号', trigger: 'blur' }]
			}
			if ('xuesheng' == this.tableName) {
				this.rules.mima = [{ required: true, message: '请输入密码', trigger: 'blur' }]
			}
			if ('xuesheng' == this.tableName) {
				this.rules.xingming = [{ required: true, message: '请输入姓名', trigger: 'blur' }]
			}
			if ('fudaoyuan' == this.tableName) {
				this.rules.fudaogonghao = [{ required: true, message: '请输入辅导工号', trigger: 'blur' }]
			}
			if ('fudaoyuan' == this.tableName) {
				this.rules.mima = [{ required: true, message: '请输入密码', trigger: 'blur' }]
			}
			if ('fudaoyuan' == this.tableName) {
				this.rules.fudaoxingming = [{ required: true, message: '请输入辅导姓名', trigger: 'blur' }]
			}
			this.xueshengxingbieOptions = "男,女".split(',')
			this.$http({
				url: `option/banjixinxi/banji`,
				method: "get"
			}).then(({ data }) => {
				if (data && data.code === 0) {
					this.xueshengbanjiOptions = data.data;
				} else {
					this.$message.error(data.msg);
				}
			});
			this.$http({
				url: `option/fudaoyuan/fudaogonghao`,
				method: "get"
			}).then(({ data }) => {
				if (data && data.code === 0) {
					this.xueshengfudaogonghaoOptions = data.data;
				} else {
					this.$message.error(data.msg);
				}
			});
			this.fudaoyuanxingbieOptions = "男,女".split(',')
			this.$http({
				url: `option/banjixinxi/banji`,
				method: "get"
			}).then(({ data }) => {
				if (data && data.code === 0) {
					this.fudaoyuanbanjiOptions = data.data;
				} else {
					this.$message.error(data.msg);
				}
			});
		}
	},
	created() {
	},
	destroyed() {
		  	},
	methods: {
		changeRules(name){
			if(this.rules[name]){
				return true
			}
			return false
		},
		// 获取uuid
		getUUID () {
			return new Date().getTime();
		},
		close(){
			this.$router.push({ path: "/login" });
		},
        // 下二随
        xueshengfudaogonghaoChange () {
            this.$http({
                url: `follow/fudaoyuan/fudaogonghao?columnValue=`+ this.ruleForm.fudaogonghao,
                method: "get"
            }).then(({ data }) => {
                if (data && data.code === 0) {
                    if(data.data.fudaoxingming){
                        this.ruleForm.fudaoxingming = data.data.fudaoxingming
                    }
                } else {
                    this.$message.error(data.msg);
                }
            });
        },
        xueshengtouxiangUploadChange(fileUrls) {
            this.ruleForm.touxiang = fileUrls;
        },
        fudaoyuantouxiangUploadChange(fileUrls) {
            this.ruleForm.touxiang = fileUrls;
        },

        // 多级联动参数


		// 注册
		login() {
			var url=this.tableName+"/register";
			if((!this.ruleForm.xuehao) && `xuesheng` == this.tableName){
				this.$message.error(`学号不能为空`);
				return
			}
			if((!this.ruleForm.mima) && `xuesheng` == this.tableName){
				this.$message.error(`密码不能为空`);
				return
			}
			if((this.ruleForm.mima!=this.ruleForm.mima2) && `xuesheng` == this.tableName){
				this.$message.error(`两次密码输入不一致`);
				return
			}
			if((!this.ruleForm.xingming) && `xuesheng` == this.tableName){
				this.$message.error(`姓名不能为空`);
				return
			}
			if(`xuesheng` == this.tableName && this.ruleForm.shouji &&(!this.$validate.isMobile(this.ruleForm.shouji))){
				this.$message.error(`手机应输入手机格式`);
				return
			}
            if(this.ruleForm.touxiang!=null) {
                this.ruleForm.touxiang = this.ruleForm.touxiang.replace(new RegExp(this.$base.url,"g"),"");
            }
			if((!this.ruleForm.fudaogonghao) && `fudaoyuan` == this.tableName){
				this.$message.error(`辅导工号不能为空`);
				return
			}
			if((!this.ruleForm.mima) && `fudaoyuan` == this.tableName){
				this.$message.error(`密码不能为空`);
				return
			}
			if((this.ruleForm.mima!=this.ruleForm.mima2) && `fudaoyuan` == this.tableName){
				this.$message.error(`两次密码输入不一致`);
				return
			}
			if((!this.ruleForm.fudaoxingming) && `fudaoyuan` == this.tableName){
				this.$message.error(`辅导姓名不能为空`);
				return
			}
			if(`fudaoyuan` == this.tableName && this.ruleForm.lianxidianhua &&(!this.$validate.isMobile(this.ruleForm.lianxidianhua))){
				this.$message.error(`联系电话应输入手机格式`);
				return
			}
            if(this.ruleForm.touxiang!=null) {
                this.ruleForm.touxiang = this.ruleForm.touxiang.replace(new RegExp(this.$base.url,"g"),"");
            }
			this.$http({
				url: url,
				method: "post",
				data:this.ruleForm
			}).then(({ data }) => {
				if (data && data.code === 0) {
					this.$message({
						message: "注册成功",
						type: "success",
						duration: 1500,
						onClose: () => {
							this.$router.replace({ path: "/login" });
						}
					});
				} else {
					this.$message.error(data.msg);
				}
			});
		}
	}
};
</script>

<style lang="scss" scoped>
.register-container {
	position: relative;
	background: url(http://codegen.caihongy.cn/20240808/4690bab5e91648408e9ba44aedb3ccb2.jpg);
	background-repeat: no-repeat;
	background-size: cover;
	background: url(http://codegen.caihongy.cn/20240808/4690bab5e91648408e9ba44aedb3ccb2.jpg);
	display: flex;
	width: 100%;
	min-height: 100vh;
	justify-content: flex-end;
	align-items: center;
	background-position: center center;
	.rgs-form {
		.rgs-form2 {
		border-radius: 10px;
		padding: 30px 20px 20px;
		box-shadow: -10px 0px 13px -7px #000000, 10px 0px 13px -7px #000000, 5px 5px 15px 5px rgba(0,0,0,0);
		margin: 20px 20% 20px 0;
		background: #4dc57b;
		width: 550px;
		}
		border-radius: 0;
		padding: 0;
		margin: 0;
		background: none;
		display: flex;
		width: 100%;
		min-height: 100vh;
		justify-content: flex-end;
		align-items: center;
		position: relative;
		height: auto;
		.title {
			padding: 0 8% 0 15%;
			margin: 20px  20px 0;
			color: #000;
			top: 0;
			left: 0;
			background: none;
			font-weight: 600;
			width: calc(78% - 500px);
			font-size: 28px;
			line-height: 50px;
			position: absolute;
			text-align: left;
		}
		.list-item {
			padding: 0 0 0 0px;
			margin: 0 0 10px 120px;
			width: calc(90% - 130px);
			position: relative;
			height: auto;
			/deep/ .el-form-item__content {
				display: block;
			}
			.lable {
				padding: 0 10px 0 0;
				color: #fff;
				left: -130px;
				width: 130px;
				font-size: 16px;
				line-height: 34px;
				position: absolute !important;
				text-align: right;
			}
			.el-input {
				width: 100%;
			}
			.el-input /deep/ .el-input__inner {
				border: 1px solid rgba(255, 255, 255, .5);
				border-radius: 0px;
				padding: 0 10px;
				color: #fff;
				background: none;
				width: 100%;
				font-size: 14px;
				height: 34px;
			}
			.el-input /deep/ .el-input__inner:focus {
				border: 1px solid rgba(0, 0, 0, .5);
				border-radius: 0;
				padding: 0 10px;
				color: #fff;
				background: none;
				width: 100%;
				font-size: 16px;
				height: 34px;
			}
			.el-input-number {
				width: 100%;
			}
			.el-input-number /deep/ .el-input__inner {
				text-align: center;
				border: 1px solid rgba(255, 255, 255, .5);
				border-radius: 0px;
				padding: 0 10px;
				color: #fff;
				background: none;
				width: 100%;
				font-size: 14px;
				height: 34px;
			}
			.el-input-number /deep/ .el-input__inner:focus {
				border: 1px solid rgba(0, 0, 0, .5);
				border-radius: 0;
				padding: 0 10px;
				color: #fff;
				background: none;
				width: 100%;
				font-size: 16px;
				height: 34px;
			}
			.el-input-number /deep/ .el-input-number__decrease {
				display: none;
			}
			.el-input-number /deep/ .el-input-number__increase {
				display: none;
			}
			.el-select {
				width: 100%;
			}
			.el-select /deep/ .el-input__inner {
				border: 1px solid rgba(255, 255, 255, .5);
				border-radius: 0px;
				padding: 0 10px;
				color: #fff;
				background: none;
				width: 100%;
				font-size: 16px;
				height: 34px;
			}
			.el-select /deep/ .el-input__inner:focus {
				border: 1px solid rgba(0, 0, 0, .5);
				border-radius: 0;
				padding: 0 10px;
				color: #fff;
				background: none;
				width: 100%;
				font-size: 16px;
				height: 34px;
			}
			.el-date-editor {
				width: 100%;
			}
			.el-date-editor /deep/ .el-input__inner {
				border: 1px solid rgba(255, 255, 255, .5);
				border-radius: 0px;
				padding: 0 10px 0 30px;
				color: #fff;
				background: none;
				width: 100%;
				font-size: 16px;
				height: 34px;
			}
			.el-date-editor /deep/ .el-input__inner:focus {
				border: 1px solid rgba(0, 0, 0, .5);
				border-radius: 0;
				padding: 0 10px 0 30px;
				color: #fff;
				background: none;
				width: 100%;
				font-size: 16px;
				height: 34px;
			}
			.el-date-editor.el-input {
				width: 100%;
			}
			/deep/ .el-upload--picture-card {
				background: transparent;
				border: 0;
				border-radius: 0;
				width: auto;
				height: auto;
				line-height: initial;
				vertical-align: middle;
			}
			/deep/ .upload .upload-img {
				border: 1px solid rgba(255, 255, 255, .5);
				cursor: pointer;
				border-radius: 0px;
				color: #fff;
				background: none;
				width: 120px;
				font-size: 24px;
				line-height: 60px;
				text-align: center;
				height: 60px;
			}
			/deep/ .el-upload-list .el-upload-list__item {
				border: 1px solid rgba(255, 255, 255, .5);
				cursor: pointer;
				border-radius: 0px;
				color: #fff;
				background: none;
				width: 120px;
				font-size: 24px;
				line-height: 60px;
				text-align: center;
				height: 60px;
			}
			/deep/ .el-upload .el-icon-plus {
				border: 1px solid rgba(255, 255, 255, .5);
				cursor: pointer;
				border-radius: 0px;
				color: #fff;
				background: none;
				width: 120px;
				font-size: 24px;
				line-height: 60px;
				text-align: center;
				height: 60px;
			}
			/deep/ .el-upload__tip {
				color: #fff;
				font-size: 15px;
			}
			/deep/ .el-input__inner::placeholder {
				color: rgba(255, 255, 255, .6);
				font-size: 16px;
			}
			.required {
				position: relative;
			}
			.required::after{
				color: red;
				left: 110px;
				position: absolute;
				content: "*";
			}
			.editor {
				background: #fff;
				width: 100%;
				height: auto;
			}
			.editor>.avatar-uploader {
				line-height: 0;
				height: 0;
			}
		}
		.list-item.email {
			input {
				border: 1px solid rgba(255, 255, 255, .5);
				border-radius: 0px 0 0 0px;
				padding: 0 10px;
				margin: 0;
				color: #fff;
				background: none;
				flex: 1;
				width: 100%;
				font-size: 14px;
				height: 34px;
			}
			input:focus {
				border: 1px solid rgba(0, 0, 0, .5);
				border-radius: 0;
				padding: 0 10px;
				color: #fff;
				background: none;
				width: 100%;
				font-size: 14px;
				height: 34px;
			}
			input::placeholder {
				color: rgba(255, 255, 255, .6);
				font-size: 16px;
			}
			button {
				border: 0;
				cursor: pointer;
				border-radius: 0 0px 0px 0;
				padding: 0;
				margin: 3px 0 0;
				color: #333;
				background: #f5f5f5;
				width: 150px;
				font-size: 15px;
				height: 34px;
			}
			button:hover {
				opacity: 1;
			}
		}
		.register-btn {
			width: 100%;
		}
		.register-btn1 {
			width: 100%;
		}
		.register-btn2 {
			width: 100%;
		}
		.r-btn {
			border: 0px solid rgba(0, 0, 0, 1);
			cursor: pointer;
			border-radius: 4px;
			padding: 0 10px;
			margin: 20px auto 0 120px;
			color: rgba(0, 0, 0, 1);
			background: #fff;
			display: block;
			width: calc(90% - 130px);
			font-size: 16px;
			height: 40px;
		}
		.r-btn:hover {
			border: 0px solid rgba(85, 170, 0, 1.0);
			color: #00ad45;
			opacity: 0.8;
		}
		.r-login {
			cursor: pointer;
			padding: 0 0 0 120px;
			color: #fff;
			display: inline-block;
			text-decoration: underline;
			width: 80%;
			font-size: 16px;
			line-height: 50px;
			text-align: center;
		}
		.r-login:hover {
			color: #333;
			opacity: 0.8;
		}
	}
}
	
	::-webkit-scrollbar {
	  display: none;
	}
</style>
