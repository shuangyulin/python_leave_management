<template>
	<div class="navbar">
		<div class="title">
			<span class="title-name">{{this.$project.projectName}}</span>
		</div>
		<div class="dropdown-box">
			<div class="el-dropdown-link">
				<el-image v-if="user" :src="avatar?this.$base.url + avatar : require('@/assets/img/avator.png')" fit="cover"></el-image>
				<span class="label">欢迎，</span>
				<span class="nickname">{{this.$storage.get('adminName')}}</span>
			</div>
			<div class="top-el-dropdown-menu-2">
				<div class="item1" @click="handleCommand('')">首页</div>
				<div class="item2" @click="handleCommand('center')">个人中心</div>
				<div class="item3" v-if="isAuth('hasBoard','查看')" @click="handleCommand('board')">看板</div>
				<div class="item3" v-if="this.$storage.get('role')=='管理员'" @click="handleCommand('analyze')">数据分析</div>
				<div class="item4" @click="handleCommand('logout')">退出登录</div>
			</div>
		</div>
	</div>
</template>

<script>
	import {
		Loading
	} from 'element-ui';
	import axios from 'axios';
	export default {
		data() {
			return {
				dialogVisible: false,
				ruleForm: {},
				user: null,
			};
		},
		created() {
			// 获取天气
			this.getWeather()
		},
		computed: {
			avatar(){
				return this.$storage.get('headportrait')?this.$storage.get('headportrait'):''
			},
		},
		mounted() {
			let sessionTable = this.$storage.get("sessionTable")
			this.$http({
				url: sessionTable + '/session',
				method: "get"
			}).then(({
				data
			}) => {
				if (data && data.code === 0) {
					if(sessionTable == 'xuesheng') {
						this.$storage.set('headportrait',data.data.touxiang)
					}
					if(sessionTable == 'fudaoyuan') {
						this.$storage.set('headportrait',data.data.touxiang)
					}
					if(sessionTable == 'users') {
						this.$storage.set('headportrait',data.data.image)
					}
					this.$storage.set('userForm',JSON.stringify(data.data))
					this.user = data.data;
					this.$storage.set('userid',data.data.id);
				} else {
					let message = this.$message
					message.error(data.msg);
				}
			});
		},
		methods: {
			// 获取当前城市天气
			getWeather(){
				axios({
					method: 'get',
					url: 'http://gfeljm.tianqiapi.com/free/v2031?appid=69475998&appsecret=rldbX1Zl'
				}).then(res => {
					let d = new Date()
					let times = d.getFullYear() + '-' + ((d.getMonth() + 1)<10?('0' + (d.getMonth() + 1)):(d.getMonth() + 1)) + '-' + (d.getDate()<10?('0' + d.getDate()):d.getDate()) + ' ' + (d.getHours()<10?('0' + d.getHours()):d.getHours()) + ':' + (d.getMinutes()<10?('0' + d.getMinutes()):d.getMinutes()) + ':' + (d.getSeconds()<10?('0' + d.getSeconds()):d.getSeconds())
					this.$storage.set('nowLocation',res.data.city)
					this.$storage.set('nowTime',times)
				})
			},
			handleCommand(name) {
				if (name == 'logout') {
					this.onLogout()
				} 
				else if (name == 'board'){
					this.toBoard()
				}
				else if (name == 'analyze'){
					this.analyzeClick()
				}
				else {
					let router = this.$router
					name = '/'+name
					router.push(name)
				}
			},
			onLogout() {
				let storage = this.$storage
				let router = this.$router
				let location = storage.get('nowLocation')
				let times = storage.get('nowTime')
				storage.clear()
				this.$store.dispatch('tagsView/delAllViews')
				this.$storage.set('nowLocation',location)
				this.$storage.set('nowTime',times)
				router.replace({
					name: "login"
				});
			},
			onIndexTap(){
				window.location.href = `${this.$base.indexUrl}`
			},
			toBoard(){
				let routeData = this.$router.resolve({ path: '/board'});
				window.open(routeData.href, '_blank');
			},
			analyzeClick() {
				this.$confirm('是否进行大数据分析?', '数据分析提示', {
					confirmButtonText: '是',
					cancelButtonText: '否',
					type: 'warning'
				}).then(() => {
					let loading = null;
					loading = Loading.service({
						target: this.$refs['roleMenuBox'],
						fullscreen: false,
						text: '数据分析中，请稍等...'
					})
					this.$http({
						url: '/shive/analyze',
						method: "get"
					}).then(({
						data
					}) => {
						if(loading) loading.close()
						if(data.code==0){
							this.$message({
								message: '数据分析完成',
								type: 'success',
								duration: 1500,
							});
						}
					},err=>{
						if(loading) loading.close()
					});
				});
			},
		}
	};
</script>


<style lang="scss" scoped>
	.navbar {
		.title {
			left: 25%;
			display: block;
			width: 50%;
			position: absolute;
			height: 70px;
			.title-name {
				padding: 0px;
				color: #fff;
				width: 100%;
				font-size: 24px;
				line-height: 70px;
				float: left;
				text-align: center;
			}
		}
		.dropdown-box {
			color: #fff;
			display: flex;
			font-size: inherit;
			right: 20px;
			float: right;
			height: 70px;
			.el-dropdown-link {
				margin: 0 10px 0 0;
				display: flex;
				align-items: center;
				.el-image {
					border-radius: 100%;
					margin: 0 10px;
					object-fit: cover;
					display: inline-block;
					width: 32px;
					height: 32px;
				}
				.label {
					color: #fff;
					font-size: inherit;
					line-height: 32px;
				}
				.nickname {
					color: #fff;
					font-size: inherit;
					line-height: 32px;
				}
			}
			.top-el-dropdown-menu-2 {
				display: flex;
				justify-content: center;
				align-items: center;
				div.item1 {
					padding: 0 10px;
					color: #fff;
					display: none;
					font-size: inherit;
					line-height: 32px;
				}
				div.item1:hover {
					cursor: pointer;
					color: #ff0;
				}
				div.item2 {
					padding: 0 10px;
					color: #fff;
					display: none;
					font-size: inherit;
					line-height: 32px;
				}
				div.item2:hover {
					cursor: pointer;
					color: #ff0;
				}
				div.item3 {
					padding: 0 10px;
					color: #fff;
					font-size: inherit;
					line-height: 32px;
				}
				div.item3:hover {
					cursor: pointer;
					color: #ff0;
				}
				div.item4 {
					padding: 0 10px;
					color: #fff;
					font-size: inherit;
					line-height: 32px;
				}
				div.item4:hover {
					cursor: pointer;
					color: #ff0;
				}
			}
		}
	}
</style>
