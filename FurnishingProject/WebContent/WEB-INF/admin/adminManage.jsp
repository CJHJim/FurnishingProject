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
		<title>操作员管理</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta name="description"
			content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template." />
		<meta name="author" content="Muhammad Usman" />

		<!-- The styles -->
		<link id="bs-css" href="css/frame/bootstrap-cerulean.css"rel="stylesheet" />
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
		<script type="text/javascript" src="./js/admin.js" ></script>		
		<script type="text/javascript">
		//排序
		var flagVal="${AdminorderKey}";
		function rankAdmin(input){
			 var orderType;
			 var orderKey=input; 
			if(flagVal==null||flagVal==""||flagVal!=input){  
				 orderType="desc";                     
			}else{
				 orderType="${AdminorderType}";
				 if(orderType!=null&&"asc"==orderType){
				 	orderType="desc";
				 }else{
				 	 orderType="asc";
				 }                   
			}
			window.location.href="admin/adminManage.html?orderKey="+orderKey+"&orderType="+orderType;
		}
		
	/******************************删除管理员***************************************************************/
		function delAdmin(){
			var adminArray=new Array();
				$("input[name='item']:checkbox").each(function(){
					if($(this).attr("checked")){
						adminArray.push($(this).val());
					}
				});
				if(adminArray.length==0){
					alert("请选中一条记录");
					return;
				}	
				var flag=window.confirm("您确定要删除选中的管理员？");
				if(flag){
					var ids=adminArray.join(",");		
			    $.ajax({
					url:"delAdmin.html?ids="+ids+"&timestamp="+new Date().getTime(),
					async:false,
					cache:false,
					success : function(data) {
					   var adminMsg= data.adminMsg;  
				        alert(adminMsg);	
						window.location.href='admin/adminManage.jsp';						
					},
					error : function(){
					    alert("管理员删除失败！");  
					}
				 });	
				}
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
					<a href="admin/adminManage.jsp">管理员管理</a>
					</li>
				 </ul>
				</div>
				<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-user"></i> 
						 <span >
						 	<button type="button" style="margin-left:5px;" onclick="window.location.href='admin/addAdminWindow.html'" class="btn btn-primary">新增</button>&nbsp;&nbsp;
							<button type="button" onclick="delAdmin()" class="btn btn-primary">删除所选</button>						   
						 </span>
						</h2>
					</div>
					<div class="box-content">
					 <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper" role="grid">
					  <div  id="showAdmin_table">
					  <table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr style="font:bold;">
							  	  <td  width="8%"><input type="checkbox" id="checkItems" name="selectAll" onclick="checkAll()" value="" />全选</td>
								  <td onmouseover="style.backgroundColor='#DCEDF4';" onmouseout="style.backgroundColor='#FBFFFF';" onclick="rankAdmin('id')">编号</td>
								  <td onmouseover="style.backgroundColor='#DCEDF4';" onmouseout="style.backgroundColor='#FBFFFF';" onclick="rankAdmin('loginName')">用户名 </td>
								  <td onmouseover="style.backgroundColor='#DCEDF4';" onmouseout="style.backgroundColor='#FBFFFF';" onclick="rankAdmin('roleName')">类型名称</td>
								  <td onmouseover="style.backgroundColor='#DCEDF4';" onmouseout="style.backgroundColor='#FBFFFF';" onclick="rankAdmin('ip')">登录ip</td>
								  <td onmouseover="style.backgroundColor='#DCEDF4';" onmouseout="style.backgroundColor='#FBFFFF';"  onclick="rankAdmin('loginCount')">登录次数</td>
								  <td onmouseover="style.backgroundColor='#DCEDF4';" onmouseout="style.backgroundColor='#FBFFFF';" onclick="rankAdmin('enabled')">是否启用</td>
								   <td onmouseover="style.backgroundColor='#DCEDF4';" onmouseout="style.backgroundColor='#FBFFFF';" onclick="rankAdmin('lastLoginTime')">上次登陆时间</td>
								  <td>修&nbsp;改</td>
							  </tr>
						  </thead>
						  <tbody>
						     <s:iterator value="#request.resultList" id="show_administrator" status="st">
									<tr>
									 <td align="center">
										<input type="checkbox" value="${show_administrator.id}" name="item"/>
									</td>
									<td >${show_administrator.id}</td>
									<td>${show_administrator.loginName}</td>
									<td>${show_administrator.roleName}</td>
									<td >${show_administrator.ip}</td>
									<td>${show_administrator.loginCount}</td>
									<td >
					                     <s:if test="#show_administrator.enabled==0">
												已启用
											</s:if>		
											<s:if test="#show_administrator.enabled==1">
												未启用
											</s:if>		
					                 </td>
									 <td><fmt:formatDate value="${show_administrator.lastLoginTime}" type="both" pattern="yyyy-MM-dd hh:mm:ss"/></td>
									 <td><button type="button" onclick="window.location.href='admin/editAdminWindow.html?id=${show_administrator.id}'" class="btn btn-primary">修&nbsp;改</button></td>
					
								   </tr>
					       	       </s:iterator>
						  </tbody>
					  </table>
					 </div> 
					  <div >
					       <span style="float:left;"><font size="3">${pageNo}/${totalPage}页，每页${pageSize}条，共${totalCount}条</font></span>
						     <span style="float:right;">
								<s:if test="%{#request.pageNo==1}">
								   <input type="button" class="btn btn-mini btn-info" value="首页" />
								   <input type="button" class="btn btn-mini btn-info" value="上一页"  />
								</s:if>
								<s:else>
								    <input type="button" onclick="window.location.href='admin/adminManage.html?pageNo=1'" class="btn btn-mini btn-info" value="首页" />
								    <input type="button" onclick="window.location.href='admin/adminManage.html?pageNo=${pageNo-1}'" class="btn btn-mini btn-info" value="上一页" />
								</s:else>	
							
							  <span style="margin-left:10px;margin-right:10px;">跳转至
								  <select name="pageNo" id="goPage" onchange="'admin/adminManage.html?pageNo='+this.value" style="width:50px;" >
			                        <c:forEach begin="1" end="${totalPage}" varStatus="status">
			                 	     <c:if test="${status.count!=pageNo}">
			                 	     	<option value="${status.count}" }>${status.count}</option>
			                 	     </c:if>
								     <c:if test="${status.count==pageNo}">
			                 	 	  <option value="${status.count}" selected="selected" >${status.count}</option>
			                 	     </c:if>
			                       </c:forEach>
			                      </select>&nbsp;页
							  </span>
		                      
								  <s:if test="%{#request.pageNo==#request.totalPage}">
								  	<input type="button" class="btn btn-mini btn-info" value="下一页" />
									<input type="button" class="btn btn-mini btn-info" value="尾页" />
								  </s:if>
								  <s:else>
								  	   <input type="button" onclick="window.location.href='admin/adminManage.html?pageNo=${pageNo+1}'" class="btn btn-mini btn-info" value="下一页" />
									   <input type="button" onclick="window.location.href='admin/adminManage.html?pageNo=${totalPage}'" class="btn btn-mini btn-info" value="尾页" />
								  </s:else>
							  </span>
					   </div>
					   <div style="clear:both;"></div>
					 </div>            
					</div>
				</div><!--/span-->
			</div><!--/row-->
			<!-- content ends -->
			<script type="text/javascript">
				/*
				 * 
				//改变每页显示的记录数
	 	function transf(){
			var size=document.getElementById("pageNumber").value;
			window.location.href="admin/adminManage.html?pageSize="+size;
		}			
				var p="${pNo}";
				if(p!=null&&p!=""){
					 document.getElementById(p).selected="selected";
				}else{
					document.getElementById("10").selected="selected";
				}
				*/
			</script>
		<hr/>
	    
		</div>
	  </div> 
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
  </body>
</html>
