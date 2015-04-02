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
		<title>编辑操作员</title>
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
       </style>
		
		<link rel="shortcut icon" href="images/frame/favicon.ico" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript">
		 
  	     function formValidate(){
		  var role=document.getElementById("role").value;
			if(role==null||role==""||role=='undefined'){
				alert("请选择管理员所属角色");
				document.getElementById("role").focus();
				return false;
			}
			
			return true;
		}
		
	//重置密码
	  function adminReset(id){
	    var b=window.confirm("您确定重置密码？");
		if(b){		
		   $.ajax({
				url:"adminReset.html?id="+id+"&timestamp="+new Date().getTime(),
				async:false,
				cache:false,
				success : function(data) {
				   var adminMsg= data.adminMsg;  
			        alert(adminMsg);			
				},
				error : function(){
				    alert("管理员编辑失败！");  
				}
		 });		
		
		}
	  }
	  
	  	//解锁与锁定管理员
		function isLock(input,id){
			var val=input.innerHTML;
			if(val!=null&&val=="锁定"){
				var b=window.confirm("您确定锁定该管理员吗！");
				if(b){
				lockOperateAdmin(id);
				input.innerHTML="解锁";
				}
			}
			if(val!=null&&val=="解锁"){
				var b=window.confirm("您确定解锁该管理员吗！");
				if(b){
				lockOperateAdmin(id);
				input.innerHTML="锁定";
				}
			}
		}
		//锁定管理员
		function lockOperateAdmin(id){	
		   $.ajax({
				url:"lockOperateAdmin.html?id="+id+"&timestamp="+new Date().getTime(),
				async:false,
				cache:false,
				success : function(data) {
				   var adminMsg= data.adminMsg;  
			        alert(adminMsg);			
				},
				error : function(){
				    alert("管理员锁定\解锁失败！");  
				}
			});			
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
								<a href="javascript:void(0);">编辑操作员</a>
							</li>
						</ul>
					</div>
					<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-edit"></i>编辑操作员</h2>
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
						<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/admin/updateAdmin.html" onsubmit="return formValidate()">
							<input type="hidden" value="${editAdmin.id}" name="adminId">
							<fieldset>
							<div class="control-group">
								<label class="control-label"></label>
								<div class="controls">
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label">用户名：</label>
								<div class="controls">
								  ${editAdmin.loginName}
								</div>
							  </div>
							   <div class="control-group">
								<label class="control-label">管理员角色：</label>
								<div class="controls">
								  	<select name="role" id="role" style="height:45px;">
								  		<s:iterator value="#request.roleList" id="role" status="st">
								  			<s:if test="%{role.id==editAdmin.roleId}">
								  				<option value="${role.id}" selected="selected">${role.roleName}</option>
								  			</s:if>
											<s:else>
												<option value="${role.id}">${role.roleName}</option>
											</s:else>
								  		</s:iterator>										 
						            </select>
								</div>
							  </div>  
							 
							  <div class="control-group">
								<label class="control-label"></label>
								<div class="controls">								  	
									<button type="button" onclick="adminReset('${editAdmin.id}')" class="btn btn-primary">重置密码</button>&nbsp;
									<c:if test="${administrator.enabled==0}">
									    <button type="button" onclick="isLock(this,'${editAdmin.id}')" class="btn btn-primary">锁定</button>&nbsp;
								     </c:if>
								     <c:if test="${administrator.enabled==1}">
								  	   <button type="button"  onclick="isLock(this,'${editAdmin.id}')" class="btn btn-primary">解锁</button>&nbsp;
								     </c:if>
									  <button type="button" onclick="window.location.href='admin/adminManage.jsp'" class="btn btn-primary">返回列表</button>
									  <button type="submit" style="margin-left:60px;" class="btn btn-primary">保存修改</button>
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
