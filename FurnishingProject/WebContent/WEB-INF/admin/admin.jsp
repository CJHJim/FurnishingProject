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
		<title>个人信息管理</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta name="description"
			content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template." />
		<meta name="author" content="Muhammad Usman" />

		<!-- The styles -->
		<link id="bs-css" href="css/frame/bootstrap-cerulean.css" rel="stylesheet" />
		<link href="css/frame/charisma-app.css" rel="stylesheet" />
		<style type="text/css">
         body {
	       padding-bottom: 40px;
         }
         .sidebar-nav {
	       padding: 9px 0;
         }
		 .btn_style{
		   color:#369BD7;
		 }
		
       </style>
			
		<link rel="shortcut icon" href="images/frame/favicon.ico" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript" src="./js/jquery-1.7.2.min.js" ></script>
		<script type="text/javascript" src="./js/admin.js" ></script>		
		
	</head>

	<body>
		<jsp:include page="top.jsp" flush="true"/>
		<div class="container-fluid">
			<div class="row-fluid"  >
             <jsp:include page="left.jsp" flush="true"/>
				<div  id="content" class="span10">
					<!-- content starts -->
					<div>
						<ul class="breadcrumb" >
							<li>
							    <a href="admin/admin.jsp">管理员主页</a><span class="divider">/</span>
							</li>
							<li>
								<a href="javascript:void(0);">管理员个人信息</a>
							</li>
						</ul>
					</div>
			<div class="row-fluid sortable">
				<div class="box span12" >
					<div class="box-header well" data-original-title>
						<h2><i class="icon-edit"></i>管理员个人信息</h2>
					</div>
					<div class="box-content" >
						<form class="form-horizontal">
							<fieldset>
							<div class="control-group">
								<label class="control-label">用户名：</label>
								<div class="controls">
								  <span class="input-xlarge uneditable-input">${admin.loginName}</span>
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label">真实姓名：</label>
								<div class="controls">
								  <span class="input-xlarge uneditable-input">${admin.realName}</span>
								</div>
							  </div>
							  
							    <div class="control-group">
								<label class="control-label">角色：</label>
								<div class="controls">
								  <span class="input-xlarge uneditable-input">
								  	${adminRole.roleName}
                                  </span>
								</div>
							  </div>	
								
							  <div class="control-group">
								<label class="control-label">登录IP：</label>
								<div class="controls">
								  <span class="input-xlarge uneditable-input">
								  	${admin.ip}
								  </span>
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="focusedInput">登录次数:</label>
								<div class="controls">
								  <span class="input-xlarge uneditable-input">
								  	${admin.loginCount}
								  </span>
								</div>
							  </div>
							 <div class="control-group">
								<label class="control-label" for="focusedInput">上次登录时间:</label>
								<div class="controls">
								  <span class="input-xlarge uneditable-input">								  	
									<fmt:formatDate value="${admin.lastLoginTime}" type="both" pattern="yyyy-MM-dd hh:mm:ss"/>
								  </span>
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="focusedInput">修改密码:</label>
								<div class="controls">
								   <button type="button" onclick="adminAlterpass()" class="btn btn-primary">修改密码</button>
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
