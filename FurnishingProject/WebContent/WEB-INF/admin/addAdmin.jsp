<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
	<head>
	    <base href="<%=basePath%>" />
		<title>新增操作员</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta name="description"
			content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template." />
		<meta name="author" content="Muhammad Usman" />

		<!-- The styles -->
		<link id="bs-css" href="css/frame/bootstrap-cerulean.css" rel="stylesheet" />
		<link href="css/frame/charisma-app.css" rel="stylesheet" />
		<script type="text/javascript" src="./js/form.js" ></script>
		<style type="text/css">
        body {
	       padding-bottom: 40px;
         }
         .sidebar-nav {
	       padding: 9px 0;
         }
       </style>
		<link rel="shortcut icon" href="images/frame/favicon.ico" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript">
		var p=/已存在/;
		var t=0;
	  
		//校验管理员姓名的唯一性
		function setValidName(input){
			if (input.value!=null&&input.value!="") {
				var adminName=input.value; 
				if(!checkUserName(adminName,5,20,false)){
					alert("用户名长度须在5到20之间，字母、数字、下划线");
					return false;
				}
				var url="${pageContext.request.contextPath}/validAdminName.html?adminName="+adminName+"&timestamp="+new Date().getTime();
				url=encodeURI(url);        
				$.ajax({
					url:url,
					async:false,
					cache:false,
					success : function(data) {
					   var adminMsg= data.adminMsg;  
				        p=/已存在/;
						t=adminMsg.search(p);
						if(t!=-1){
							alert("用户名已存在");
						}								
					},
					error : function(){
					    alert("用户名校验失败！");  
					}
				});	
			}
		}
	
	   //管理员密码添加校验
  	  function formValidate(){
			var userName=document.getElementById("userName").value;
			if(userName=='null'||userName==""||userName=='undefined'){
				alert("用户名不能为空");
				document.getElementById("userName").focus();
				return false;
			}
			if(!checkUserName(userName,5,20,false)){
				alert("用户名长度须在5到20之间,由字母数字下划线组成");
				document.getElementById("userName").focus();
				return false;
			}
			if(t!=-1){
				alert("管理员用户名已存在");
				document.getElementById("userName").focus();
				return false;
			}
			var password=document.getElementById("password").value;
			if(password=='null'||password==""||password=='undefined'){
				alert("密码不能为空");
				document.getElementById("password").focus();
				return false;
			}
			if(!checkUserName(adminName,6,16,false)){
				alert("密码长度为6-16个字符，包括字母,数字,下划线");
				document.getElementById("password").focus();
				return false;
			}
			
			var rePassword=document.getElementById("rePassword").value;
			if(rePassword=='null'||rePassword==""||rePassword=='undefined'){
				alert("确认密码不能为空");
				document.getElementById("rePassword").focus();
				return false;
			}
			if(rePassword!=password){
				alert("确认密码不一致");
				document.getElementById("rePassword").focus();
				return false;
			}
			var role=document.getElementById("role").value;
			if(role==null||role==""||role=='undefined'){
				alert("请选择管理员所属角色");
				document.getElementById("role").focus();
				return false;
			}
						
			return true;			
		}
		</script>
	</head>

	<body>
		<jsp:include page="top.jsp" flush="true"/>
		<div class="container-fluid">
			<div class="row-fluid">
             <jsp:include page="left.jsp" flush="true"/>
				<div id="content" class="span10">
					<!-- content starts -->

					<div>
						<ul class="breadcrumb">
							<li>
								<a href="admin/admin.jsp">管理员主页</a><span class="divider">/</span>
							</li>
							<li>
								<a href="admin/adminManage.jsp">操作员管理</a><span class="divider">/</span>
							</li>
							<li>
								<a href="javascript:void(0);">新增操作员</a>
							</li>
						</ul>
					</div>
					<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-edit"></i>新增操作员</h2>
						<script type="text/javascript">
							var message="${adminMsg}";
							if(message!=null&&message!=""&&message!='undefined'){
								alert(message);
								var r=0;
								p=/成功/;
							    r=message.search(p);
								if(r!=-1){
									window.location.href="admin/adminManage.jsp";
								}								
							}
						</script>
					</div>
					<div class="box-content">
						<form class="form-horizontal" method="post" action="admin/addAdmin.html" onsubmit="return formValidate()">
							<fieldset>
							<div class="control-group">
								<label class="control-label"></label>
								<div class="controls">
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label">用户名：</label>
								<div class="controls">							
								  	<input type="text" id="userName" name="userName" onblur="setValidName(this);" />&nbsp;
								  <font color='red'>格式：5到20位,字母、数字、下划线</font>
								</div>
							  </div>
							   <div class="control-group">
								<label class="control-label">真实姓名：</label>
								<div class="controls">
								  	<input type="text" id="realName" name="realName"  />
								</div>
							  </div>
							   <div class="control-group">
								<label class="control-label">密码：</label>
								<div class="controls">
								  	<input type="password" id="password" name="password"/>&nbsp;<font color='red'>格式：6-16位,包含字母,数字,下划线</font>
								</div>
							  </div>
							   <div class="control-group">
								<label class="control-label" for="focusedInput">确认密码：</label>
								<div class="controls">
								  	<input type="password" id="rePassword" name="rePassword" />
								</div>
							  </div>
							
							  <div class="control-group">
								<label class="control-label">管理员角色：</label>
								<div class="controls">
								  	<select name="role" id="role" style="height:40px;" >
								  		<option value="">请选择管理员所属角色</option>
										<s:iterator value="#request.roleList" id="role" status="st">
											<option value="${role.id}">${role.roleName}</option>
										</s:iterator>
						            </select>
								</div>
							  </div>  			
							  <div style="height:30px;"></div>
							  <div class="control-group">
								<label class="control-label"></label>
								<div class="controls">
								  	<button type="submit" class="btn btn-primary">增加</button>&nbsp;&nbsp;
									<button type="reset" class="btn btn-primary">重置</button>&nbsp;&nbsp;&nbsp;
									<button type="button" onclick="window.location.href='admin/adminManage.jsp'" class="btn btn-primary">返回</button>
								</div>
							  </div>
							  
							</fieldset>
						  </form>
					</div>
				</div><!--/span-->
			
			</div><!--/row-->			
         </div>
		</div><!--/.fluid-container-->
       </div>
	   <jsp:include page="footer.jsp" flush="true"/>
	</body>
</html>
