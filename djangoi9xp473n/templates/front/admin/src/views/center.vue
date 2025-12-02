<template>
	<div :style='{"color":"#666","padding":"30px","fontSize":"16px"}'>
		<el-form
			:style='{"padding":"30px 20% 30px 10%","borderColor":"#ddd","borderRadius":"12px","borderStyle":"solid","borderWidth":"1px","background":"rgba(255,255,255,0)"}'
			class="add-update-preview"
			ref="ruleForm"
			:model="ruleForm"
			label-width="180px"
		>
				<el-form-item :style='{"border":"0px solid #eee","width":"100%","padding":"2px 20px","margin":"0 0 20px 0","display":"inline-block"}'   v-if="flag=='xuesheng'"  label="学号" prop="xuehao">
					<el-input v-model="ruleForm.xuehao" readonly						placeholder="学号" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"100%","padding":"2px 20px","margin":"0 0 20px 0","display":"inline-block"}'   v-if="flag=='xuesheng'"  label="姓名" prop="xingming">
					<el-input v-model="ruleForm.xingming" 						placeholder="姓名" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"100%","padding":"2px 20px","margin":"0 0 20px 0","display":"inline-block"}' v-if="flag=='xuesheng'"  label="性别" prop="xingbie">
					<el-select v-model="ruleForm.xingbie"  placeholder="请选择性别">
						<el-option
							v-for="(item,index) in xueshengxingbieOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"100%","padding":"2px 20px","margin":"0 0 20px 0","display":"inline-block"}'   v-if="flag=='xuesheng'"  label="手机" prop="shouji">
					<el-input v-model="ruleForm.shouji" 						placeholder="手机" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"100%","padding":"2px 20px","margin":"0 0 20px 0","display":"inline-block"}' v-if="flag=='xuesheng'"  label="班级" prop="banji">
					<el-select v-model="ruleForm.banji"  placeholder="请选择班级">
						<el-option
							v-for="(item,index) in xueshengbanjiOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"100%","padding":"2px 20px","margin":"0 0 20px 0","display":"inline-block"}' v-if="flag=='xuesheng'" label="辅导工号" prop="fudaogonghao">
					<el-select  @change="xueshengfudaogonghaoChange"  v-model="ruleForm.fudaogonghao" placeholder="请选择辅导工号">
						<el-option
							v-for="(item,index) in xueshengfudaogonghaoOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"100%","padding":"2px 20px","margin":"0 0 20px 0","display":"inline-block"}'   v-if="flag=='xuesheng'"  label="辅导姓名" prop="fudaoxingming">
					<el-input v-model="ruleForm.fudaoxingming" 						placeholder="辅导姓名" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"100%","padding":"2px 20px","margin":"0 0 20px 0","display":"inline-block"}' v-if="flag=='xuesheng'" label="头像" prop="touxiang">
					<file-upload
						tip="点击上传头像"
						action="file/upload"
						:limit="3"
						:multiple="true"
						:fileUrls="ruleForm.touxiang?ruleForm.touxiang:''"
						@change="xueshengtouxiangUploadChange"
					></file-upload>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"100%","padding":"2px 20px","margin":"0 0 20px 0","display":"inline-block"}'   v-if="flag=='fudaoyuan'"  label="辅导工号" prop="fudaogonghao">
					<el-input v-model="ruleForm.fudaogonghao" readonly						placeholder="辅导工号" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"100%","padding":"2px 20px","margin":"0 0 20px 0","display":"inline-block"}'   v-if="flag=='fudaoyuan'"  label="辅导姓名" prop="fudaoxingming">
					<el-input v-model="ruleForm.fudaoxingming" 						placeholder="辅导姓名" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"100%","padding":"2px 20px","margin":"0 0 20px 0","display":"inline-block"}' v-if="flag=='fudaoyuan'"  label="性别" prop="xingbie">
					<el-select v-model="ruleForm.xingbie"  placeholder="请选择性别">
						<el-option
							v-for="(item,index) in fudaoyuanxingbieOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"100%","padding":"2px 20px","margin":"0 0 20px 0","display":"inline-block"}' v-if="flag=='fudaoyuan'"  label="班级" prop="banji">
					<el-select v-model="ruleForm.banji"  placeholder="请选择班级">
						<el-option
							v-for="(item,index) in fudaoyuanbanjiOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"100%","padding":"2px 20px","margin":"0 0 20px 0","display":"inline-block"}'   v-if="flag=='fudaoyuan'"  label="联系电话" prop="lianxidianhua">
					<el-input v-model="ruleForm.lianxidianhua" 						placeholder="联系电话" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"100%","padding":"2px 20px","margin":"0 0 20px 0","display":"inline-block"}' v-if="flag=='fudaoyuan'" label="头像" prop="touxiang">
					<file-upload
						tip="点击上传头像"
						action="file/upload"
						:limit="3"
						:multiple="true"
						:fileUrls="ruleForm.touxiang?ruleForm.touxiang:''"
						@change="fudaoyuantouxiangUploadChange"
					></file-upload>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"100%","padding":"2px 20px","margin":"0 0 20px 0","display":"inline-block"}' v-if="flag=='users'" label="用户名" prop="username">
					<el-input v-model="ruleForm.username" placeholder="用户名"></el-input>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"100%","padding":"2px 20px","margin":"0 0 20px 0","display":"inline-block"}' v-if="flag=='users'" label="头像" prop="image">
					<file-upload
						tip="点击上传头像"
						action="file/upload"
						:limit="1"
						:multiple="false"
						:fileUrls="ruleForm.image?ruleForm.image:''"
						@change="usersimageUploadChange"
					></file-upload>
				</el-form-item>
				<el-form-item :style='{"padding":"0","margin":"20px 0 0"}'>
					<el-button class="btn3" :style='{"border":"0px solid #ccc","cursor":"pointer","padding":"0 10px","margin":"0 10px 0 0","color":"#fff","borderRadius":"4px","background":"#00ad45","width":"auto","fontSize":"16px","minWidth":"110px","height":"40px"}' type="primary" @click="onUpdateHandler">
						<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"14px","color":"#fff","display":"none","height":"40px"}'></span>
						提交
					</el-button>
				</el-form-item>
		</el-form>
	</div>
</template>
<script>
// 校验引入
import { 
	isMobile,
} from "@/utils/validate";

export default {
	data() {
		return {
			ruleForm: {},
			flag: '',
			usersFlag: false,
			xueshengxingbieOptions: [],
			xueshengbanjiOptions: [],
			xueshengfudaogonghaoOptions: [],
			fudaoyuanxingbieOptions: [],
			fudaoyuanbanjiOptions: [],
		};
	},
	mounted() {
		var table = this.$storage.get("sessionTable");
		this.flag = table;
		this.$http({
			url: `${this.$storage.get("sessionTable")}/session`,
			method: "get"
		}).then(({ data }) => {
			if (data && data.code === 0) {
				this.ruleForm = data.data;
			} else {
				this.$message.error(data.msg);
			}
		});
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
	},
	methods: {
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
		usersimageUploadChange(fileUrls) {
			this.ruleForm.image = fileUrls;
		},
		onUpdateHandler() {
			if((!this.ruleForm.xuehao)&& 'xuesheng'==this.flag){
				this.$message.error('学号不能为空');
				return
			}


			if((!this.ruleForm.mima)&& 'xuesheng'==this.flag){
				this.$message.error('密码不能为空');
				return
			}

			if((!this.ruleForm.xingming)&& 'xuesheng'==this.flag){
				this.$message.error('姓名不能为空');
				return
			}






			if( 'xuesheng' ==this.flag && this.ruleForm.shouji&&(!isMobile(this.ruleForm.shouji))){
				this.$message.error(`手机应输入手机格式`);
				return
			}








			if(this.ruleForm.touxiang!=null) {
				this.ruleForm.touxiang = this.ruleForm.touxiang.replace(new RegExp(this.$base.url,"g"),"");
			}
			if((!this.ruleForm.fudaogonghao)&& 'fudaoyuan'==this.flag){
				this.$message.error('辅导工号不能为空');
				return
			}


			if((!this.ruleForm.mima)&& 'fudaoyuan'==this.flag){
				this.$message.error('密码不能为空');
				return
			}

			if((!this.ruleForm.fudaoxingming)&& 'fudaoyuan'==this.flag){
				this.$message.error('辅导姓名不能为空');
				return
			}








			if( 'fudaoyuan' ==this.flag && this.ruleForm.lianxidianhua&&(!isMobile(this.ruleForm.lianxidianhua))){
				this.$message.error(`联系电话应输入手机格式`);
				return
			}


			if(this.ruleForm.touxiang!=null) {
				this.ruleForm.touxiang = this.ruleForm.touxiang.replace(new RegExp(this.$base.url,"g"),"");
			}
			if('users'==this.flag && this.ruleForm.username.trim().length<1) {
				this.$message.error(`用户名不能为空`);
				return	
			}
			if(this.flag=='users'){
				this.ruleForm.image = this.ruleForm.image.replace(new RegExp(this.$base.url,"g"),"")
			}
			this.$http({
				url: `${this.$storage.get("sessionTable")}/update`,
				method: "post",
				data: this.ruleForm
			}).then(({ data }) => {
				if (data && data.code === 0) {
					this.$message({
						message: "修改信息成功",
						type: "success",
						duration: 1500,
						onClose: () => {
							if(this.flag=='users'){
								this.$storage.set('headportrait',this.ruleForm.image)
							}
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
	.el-date-editor.el-input {
		width: auto;
	}
	
	.add-update-preview .el-form-item /deep/ .el-form-item__label {
				padding: 0 10px 0 0;
				color: #666;
				font-weight: 500;
				width: 180px;
				font-size: 16px;
				line-height: 40px;
				text-align: right;
			}
	
	.add-update-preview .el-form-item /deep/ .el-form-item__content {
		margin-left: 180px;
	}
	
	.add-update-preview .el-input /deep/ .el-input__inner {
				border: 0px solid #ccc;
				border-radius: 0px;
				padding: 0 12px;
				color: #666;
				width: auto;
				font-size: 16px;
				height: 34px;
			}
	
	.add-update-preview .el-select /deep/ .el-input__inner {
				border: 0px solid #ccc;
				border-radius: 0px;
				padding: 0 10px;
				color: #666;
				width: auto;
				font-size: 16px;
				height: 34px;
			}
	
	.add-update-preview .el-date-editor /deep/ .el-input__inner {
				border: 0px solid #ccc;
				border-radius: 0px;
				padding: 0 10px 0 30px;
				color: #666;
				width: auto;
				font-size: 16px;
				height: 34px;
			}
	
	.add-update-preview /deep/ .el-upload--picture-card {
		background: transparent;
		border: 0;
		border-radius: 0;
		width: auto;
		height: auto;
		line-height: initial;
		vertical-align: middle;
	}
	
	.add-update-preview /deep/ .el-upload-list .el-upload-list__item {
				border: 0px solid #ccc;
				cursor: pointer;
				border-radius: 0px;
				color: #666;
				background: #fff;
				object-fit: cover;
				width: 90px;
				font-size: 24px;
				line-height: 60px;
				text-align: center;
				height: 60px;
			}
	
	.add-update-preview /deep/ .el-upload .el-icon-plus {
				border: 0px solid #ccc;
				cursor: pointer;
				border-radius: 0px;
				color: #666;
				background: #fff;
				object-fit: cover;
				width: 90px;
				font-size: 24px;
				line-height: 60px;
				text-align: center;
				height: 60px;
			}
	
	.add-update-preview .el-textarea /deep/ .el-textarea__inner {
				border: 0px solid #ccc;
				border-radius: 0px;
				padding: 12px;
				color: #666;
				background: #fff;
				width: auto;
				font-size: 16px;
				min-width: 400px;
				height: 120px;
			}
	
	.add-update-preview .btn3 {
				border: 0px solid #ccc;
				cursor: pointer;
				border-radius: 4px;
				padding: 0 10px;
				margin: 0 10px 0 0;
				color: #fff;
				background: #00ad45;
				width: auto;
				font-size: 16px;
				min-width: 110px;
				height: 40px;
			}
	
	.add-update-preview .btn3:hover {
				opacity: 0.8;
			}
	
	.editor>.avatar-uploader {
		line-height: 0;
		height: 0;
	}
</style>
