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
		<title>收货地址</title>
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
		var flagVal="${addressOrderKey}";
		function rankAdmin(input){
			 var orderType;
			 var orderKey=input; 
			if(flagVal==null||flagVal==""||flagVal!=input){  
				 orderType="desc";                     
			}else{
				 orderType="${addressOrderType}";
				 if(orderType!=null&&"asc"==orderType){
				 	orderType="desc";
				 }else{
				 	 orderType="asc";
				 }                   
			}
			window.location.href="myAddressManage.html?orderKey="+orderKey+"&orderType="+orderType;
		}
		
	    function delMyAddress(){
			var array=new Array();
				$("input[name='item']:checkbox").each(function(){
					if($(this).attr("checked")){
						array.push($(this).val());
					}
				});
				if(array.length==0){
					alert("请选中一条记录");
					return;
				}	
				var flag=window.confirm("您确定要删除选中的收货地址？");
				if(flag){
					var ids=array.join(",");		
			    $.ajax({
					url:"deleteMyAddress.html?ids="+ids+"&timestamp="+new Date().getTime(),
					async:false,
					cache:false,
					success : function(data) {
					   var message= data.customerMsg;  
				        alert(message);	
						window.location.href='myAddressManage.jsp';						
					},
					error : function(){
					    alert("收货地址删除失败！");  
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
					<a href="index.jsp">首页</a><span class="divider">/</span>
					</li>
					<li>
					<a href="customer.jsp">个人主页</a><span class="divider">/</span>
					</li>
					<li>
					<a href="myAddressManage.jsp">收货地址</a>
					</li>
				 </ul>
				</div>
				<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-user"></i> 
						 <span >
						 	<button type="button" onclick="window.location.href='addMyAddressWin.html'" class="btn btn-primary">新增</button>
							<button type="button" onclick="delMyAddress()" class="btn btn-primary">删除所选</button>						   
						 </span>
						</h2>
					</div>
					<div class="box-content">
					 <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper" role="grid">
					
					  <table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr style="font:bold;">
							  	  <td  width="8%"><input type="checkbox" id="checkItems" name="selectAll" onclick="checkAll()" value="" />全选</td>
								  <td onmouseover="style.backgroundColor='#DCEDF4';" onmouseout="style.backgroundColor='#FBFFFF';" onclick="rankAdmin('receiverName')">收件人姓名</td>
								  <td onmouseover="style.backgroundColor='#DCEDF4';" onmouseout="style.backgroundColor='#FBFFFF';" onclick="rankAdmin('phone')">电话 </td>	
								  <td onmouseover="style.backgroundColor='#DCEDF4';" onmouseout="style.backgroundColor='#FBFFFF';" onclick="rankAdmin('provinceName')">所在省</td>
								  <td onmouseover="style.backgroundColor='#DCEDF4';" onmouseout="style.backgroundColor='#FBFFFF';" onclick="rankAdmin('cityName')">所在市 </td>	
								  <td onmouseover="style.backgroundColor='#DCEDF4';" onmouseout="style.backgroundColor='#FBFFFF';" onclick="rankAdmin('countyName')">所在县 </td>	
								  <td onmouseover="style.backgroundColor='#DCEDF4';" onmouseout="style.backgroundColor='#FBFFFF';" onclick="rankAdmin('address')">详细地址</td>
								  <td onmouseover="style.backgroundColor='#DCEDF4';" onmouseout="style.backgroundColor='#FBFFFF';" onclick="rankAdmin('zipCode')">邮编 </td>	
								  <td>修&nbsp;改</td>
							  </tr>
						  </thead>
						  <tbody>
						     <s:iterator value="#request.resultList" id="show_address" status="st">
									<tr>
									 <td align="center">
										<input type="checkbox" value="${show_address.id}" name="item"/>
									</td>
									<td>${show_address.receiverName}</td>
									<td>${show_address.phone}</td>
									<td>${show_address.provinceName}</td>
									<td>${show_address.cityName}</td>	
									<td>${show_address.countyName}</td>
									<td>${show_address.address}</td>
									<td>${show_address.zipCode}</td>									
									<td>							
										   <button type="button" onclick="window.location.href='editMyAddressWin.html?id=${show_address.id}'" class="btn btn-primary">修&nbsp;改</button>
									</td>					
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
								    <input type="button" onclick="window.location.href='myAddressManage.html?pageNo=1'" class="btn btn-mini btn-info" value="首页" />
								    <input type="button" onclick="window.location.href='myAddressManage.html?pageNo=${pageNo-1}'" class="btn btn-mini btn-info" value="上一页" />
								</s:else>	
							
							  <span style="margin-left:10px;margin-right:10px;">跳转至
								  <select name="pageNo" id="goPage" onchange="window.location.href='myAddressManage.html?pageNo='+this.value" style="width:50px;" >
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
								  	   <input type="button" onclick="window.location.href='myAddressManage.html?pageNo=${pageNo+1}'" class="btn btn-mini btn-info" value="下一页" />
									   <input type="button" onclick="window.location.href='myAddressManage.html?pageNo=${totalPage}'" class="btn btn-mini btn-info" value="尾页" />
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
			window.location.href="myAddressManage.html?pageSize="+size;
		}			
				var p="${pNo}";
				if(p!=null&&p!=""){
					 document.getElementById(p).selected="selected";
				}else{
					document.getElementById("10").selected="selected";
				}
				*/
			</script>

	  </div> 
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
  </body>
</html>
