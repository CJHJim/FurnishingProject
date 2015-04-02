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
		<title>个人信息</title>
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
		<script type="text/javascript" src="./My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="./js/jquery-1.7.2.min.js" ></script>		
		<script type="text/javascript">
		  //根据省份加载市
		  function loadCityByProvince(input){
			var provinceId=input.value;
			if(provinceId==null||provinceId==""||provinceId=='undefined'){
				var cityElement=document.getElementById("city");
			    var cityOptions=cityElement.getElementsByTagName("option");
				for(var i=cityOptions.length-1;i>0;i--){ 
					cityElement.removeChild(cityOptions[i]);
			    }
				var countyElement=document.getElementById("county");
			    var countyOptions=countyElement.getElementsByTagName("option");
				for(var i=countyOptions.length-1;i>0;i--){ 
					countyElement.removeChild(countyOptions[i]);
			    }
				$("#city").attr("disabled",true);
				$("#county").attr("disabled",true);
			}else{
				$.ajax({
					url:"loadCityByProvince.html?provinceId="+provinceId+"&timestamp="+new Date().getTime(),
					async:false,
					cache:false,
					success : function(data) {
					var list=data.ajaxCityList;
					
					var countyElement=document.getElementById("county");
				    var countyOptions=countyElement.getElementsByTagName("option");
					for(var i=countyOptions.length-1;i>0;i--){ 
						countyElement.removeChild(countyOptions[i]);
				    }
					$("#county").attr("disabled",true);
					var cityElement=document.getElementById("city");
				    var cityOptions=cityElement.getElementsByTagName("option");
					for(var i=cityOptions.length-1;i>0;i--){ 
						cityElement.removeChild(cityOptions[i]);
				    }				
					
					if(list==null||list.length==0){
					 	alert("该省份下没有相关的市信息")
						$("#city").attr("disabled",true);
						return false;
					 }
					 $("#city").attr("disabled",false);
					 
					for(var i=0;list!=null&&i<list.length;i++){
					 	$('#city').append("<option value="+list[i].id+">"+list[i].cityName+"</option>");
					}	 
										
					},
					error : function(){
					    alert("无法根据省份加载市！");  
					}
				});		
			}
		}
		
	   //根据市加载相关的县信息
	  function loadCountyByCity(input){
			var cityId=input.value;
			if(cityId==null||cityId==""||cityId=='undefined'){
				var countyElement=document.getElementById("county");
			    var countyOptions=countyElement.getElementsByTagName("option");
				for(var i=countyOptions.length-1;i>0;i--){ 
					countyElement.removeChild(countyOptions[i]);
			    }
				$("#county").attr("disabled",true);
			}else{
				$.ajax({
					url:"loadCountyByCity.html?cityId="+cityId+"&timestamp="+new Date().getTime(),
					async:false,
					cache:false,
					success : function(data) {
					var list=data.ajaxCountyList;
					
					var countyElement=document.getElementById("county");
				    var countyOptions=countyElement.getElementsByTagName("option");
					for(var i=countyOptions.length-1;i>0;i--){ 
						countyElement.removeChild(countyOptions[i]);
				    }	
					
					if(list==null||list.length==0){
					 	alert("该省份下没有相关的市信息");
						$("#county").attr("disabled",true);
						return false;
					 }
					$("#county").attr("disabled",false);	
								
					for(var i=0;list!=null&&i<list.length;i++){
					 	$('#county').append("<option value="+list[i].id+">"+list[i].countyName+"</option>");
					}	 
										
					},
					error : function(){
					    alert("无法根据市加载相关县信息！");  
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
				<div id="content" class="span10" >
					<!-- content starts -->
					<div>
						<ul class="breadcrumb" >
							<li>
							    <a href="index.jsp">首页</a><span class="divider">/</span>
							</li>
							<li>
								<a href="customer.jsp">个人信息</a>
							</li>
						</ul>
					</div>
					<div class="row-fluid sortable">
				<div class="box span12" >
					<div class="box-header well" data-original-title>
						<h2><i class="icon-edit"></i>个人信息</h2>
					</div>
					<div class="box-content" >
						<form class="form-horizontal" enctype="multipart/form-data" action="updateCustomerInfo.jsp" method="post">
							<fieldset>
							<div class="control-group">
								<label class="control-label">用户名：</label>
								<div class="controls">
								  <span class="input-xlarge uneditable-input">${customer.loginName}</span>
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label">客户等级：</label>
								<div class="controls">
								  <span class="input-xlarge uneditable-input">${customerClass.className}</span>
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label">真实姓名：</label>
								<div class="controls">								 
								  	<input type="text" id="realName" name="realName" value="${customer.realName}"  />								  
								</div>
							  </div>
							  
							    <div class="control-group">
								<label class="control-label">性别：</label>
								<div class="controls">								 
								  	<c:choose>
								  		<c:when test="${customer.gender=='男'}">
								  			<input type="radio" name="gender" checked="checked" value="男"/>男
								            <input type="radio" name="gender" value="女"/>女
								  		</c:when>
										<c:otherwise>
											<input type="radio" name="gender"  value="男"/>男
								            <input type="radio" name="gender" checked="checked" value="女"/>女
										</c:otherwise>
								  	</c:choose>                                 
								</div>
							  </div>	
								
							  <div class="control-group">
								<label class="control-label">出生日期：</label>
								<div class="controls">								  
								  	 <input type="text" id="birthday" value="<fmt:formatDate value='${customer.birthday}' type='both' pattern='yyyy-MM-dd'/>" onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" name="birthday" />&nbsp;&nbsp;<font color='red'>*yyyy-mm-dd hh:mm:ss</font>
								</div>
							  </div>
							  
							   <div class="control-group">
								<label class="control-label">照片：</label>
								<div class="controls">
								  	<img src="${customer.photo}" /><br/><br/>
								  	 <input type="file" id="img" name="img" />
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label">所在地：</label>
								<div class="controls">
								   <select id="province" name="province" onchange="loadCityByProvince(this);" style="height:40px;">
								   	<option value="">选择省份</option>
								   	  <s:iterator value="#request.provinceList" id="show_province" status="st">
								   	  	<s:if test="%{#session.customer.provinceId==#show_province.id}">
								   	  		<option value="${show_province.id}" selected="selected">${show_province.provinceName}</option>
								   	  	</s:if>
										<s:else>
											<option value="${show_province.id}">${show_province.provinceName}</option>
										</s:else>								   	  	
								   	  </s:iterator>
								   </select>&nbsp;&nbsp;
								   
								     <select id="city" name="city" onchange="loadCountyByCity(this)" style="height:40px;">
								   	<option value="">选择市</option>
								   	  <s:iterator value="#request.cityList" id="show_city" status="st">
								   	  	<s:if test="%{#session.customer.cityId==#show_city.id}">
								   	  		<option value="${show_city.id}" selected="selected">${show_city.cityName}</option>
								   	  	</s:if>
										<s:else>
											<option value="show_city.id">${show_city.cityName}</option>
										</s:else>								   	  	
								   	  </s:iterator>
								   </select>&nbsp;&nbsp;
								   
								   <select id="county" name="county" style="height:40px;">
								   	<option value="">选择县</option>
								   	  <s:iterator value="#request.countyList" id="show_county" status="st">
								   	  	<s:if test="%{#session.customer.countyId==#show_county.id}">
								   	  		<option value="${show_county.id}" selected="selected">${show_county.countyName}</option>
								   	  	</s:if>
										<s:else>
											<option value="${show_county.id}">${show_county.countyName}</option>
										</s:else>								   	  	
								   	  </s:iterator>
								   </select>
								</div>
							  </div>
							  
							 <div class="control-group">
								<label class="control-label">详细地址：</label>
								<div class="controls">
								  	<input type="text" id="address"  value="${customer.address}" name="address"/>
								</div>
							  </div>
							    <div class="control-group">
								<label class="control-label">邮编：</label>
								<div class="controls">
								  	<input type="text" id="zipcode" value="${customer.zipCode}" name="zipcode"/>
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label">电话：</label>
								<div class="controls">
								  	<input type="text" id="telephone" value="${customer.tel}" name="telephone"/>
								</div>
							  </div>
							
							   <div class="control-group">
								<label class="control-label">qq：</label>
								<div class="controls">
								  	<input type="text" id="qq" value="${customer.qq}" name="qq"/>
								</div>
							  </div>
							   <div class="control-group">
								<label class="control-label">电子邮件：</label>
								<div class="controls">
								  	<input type="text" id="email" value="${customer.email}" name="email"/>
								</div>
							  </div>
							  
							  
							  <div class="control-group">
								<label class="control-label">兴趣爱好：</label>
								<div class="controls">
								  	<textarea id="interests" name="interests" style="width:300px;height:80px;">${customer.interests}</textarea>
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label">偏好：</label>
								<div class="controls">
								  	<textarea id="preference" name="preference" style="width:300px;height:80px;">${customer.preference}</textarea>
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label" for="focusedInput">注册时间:</label>
								<div class="controls">
								  <span class="input-xlarge uneditable-input">
								  	<fmt:formatDate value="${customer.joinTime}" type="both" pattern="yyyy-MM-dd hh:mm:ss"/>
								  </span>
								</div>
							  </div>
							 <div class="control-group">
								<label class="control-label" for="focusedInput">上次登录时间:</label>
								<div class="controls">
								  <span class="input-xlarge uneditable-input">								  	
									<fmt:formatDate value="${customer.lastLoginTime}" type="both" pattern="yyyy-MM-dd hh:mm:ss"/>
								  </span>
								</div>
							  </div>
							  
							 <div class="control-group">
								<label class="control-label" for="focusedInput">登陆IP:</label>
								<div class="controls">
								  <span class="input-xlarge uneditable-input">								  	
									${customer.loginIp}
								  </span>
								</div>
							  </div>
							  
							   <div class="control-group">
								<label class="control-label" for="focusedInput">累计消费额:</label>
								<div class="controls">
								  <span class="input-xlarge uneditable-input">
								  	<c:choose>
								  		<c:when test="${customer.totalSaleAmount!=null}">
								  			${customer.totalSaleAmount}
								  		</c:when>
										<c:otherwise>
											0
										</c:otherwise>
								  	</c:choose>
								  	
								  </span>
								</div>
							  </div>
							 <div class="control-group">
								<label class="control-label" for="focusedInput">累计订单量:</label>
								<div class="controls">
								  <span class="input-xlarge uneditable-input">
								  	<c:choose>
								  		<c:when test="${customer.totalOrderQuantity!=null}">
								  			${customer.totalOrderQuantity}
								  		</c:when>
										<c:otherwise>
											0
										</c:otherwise>
								  	</c:choose>								  	
									
								  </span>
								</div>
							  </div>
							  
							   <div class="control-group">
								<label class="control-label" for="focusedInput">登陆次数:</label>
								<div class="controls">
								  <span class="input-xlarge uneditable-input">
								  	<c:choose>
								  		<c:when test="${customer.loginAmount!=null}">
								  			${customer.loginAmount}
								  		</c:when>
										<c:otherwise>
											0
										</c:otherwise>
								  	</c:choose>
								  	
								  </span>
								</div>
							  </div>
							 <div class="control-group">
								<label class="control-label" for="focusedInput">评价次数:</label>
								<div class="controls">
								  <span class="input-xlarge uneditable-input">
								  	<c:choose>
								  		<c:when test="${customer.commentCount!=null}">
								  			${customer.commentCount}
								  		</c:when>
										<c:otherwise>
											0
										</c:otherwise>
								  	</c:choose>								  	
									
								  </span>
								</div>
							  </div>
							  
							   <div class="control-group">
								<label class="control-label" for="focusedInput">积分:</label>
								<div class="controls">
								  <span class="input-xlarge uneditable-input">
								  	<c:choose>
								  		<c:when test="${customer.score!=null}">
								  			${customer.score}
								  		</c:when>
										<c:otherwise>
											0
										</c:otherwise>
								  	</c:choose>		
								  </span>
								</div>
							  </div>
							  
							  <!--
							  <s:if test="{#request.customerAccount==null}">
							  	<div class="control-group">
									<label class="control-label" for="focusedInput">账户号:</label>
									<div class="controls">
									  <span class="input-xlarge uneditable-input">
									  	<input type="text" id="accountNumber" name="accountNumber"/>
									  </span>
									</div>
								  </div>
								  
								  <div class="control-group">
									<label class="control-label" for="focusedInput">登陆密码:</label>
									<div class="controls">
									  <span class="input-xlarge uneditable-input">
									  	<input type="password" id="loginPassword"  name="loginPassword"/>
									  </span>
									</div>
								  </div>
								  
								  <div class="control-group">
									<label class="control-label" for="focusedInput">支付密码:</label>
									<div class="controls">
									  <span class="input-xlarge uneditable-input">
									  	<input type="password" id="payPassword"  name="payPassword"/>
									  </span>
									</div>
								  </div>
							  </s:if>
							  <s:else>
							  	 <div class="control-group">
									<label class="control-label" for="focusedInput">账户号:</label>
									<div class="controls">
									  <span class="input-xlarge uneditable-input">
									  	${customerAccount.accountNumber}
									  </span>
									</div>
								  </div>
							  </s:else>
							  -->
							  
							  <div class="control-group">
								<label class="control-label" for="focusedInput">修改:</label>
								<div class="controls">
									<button type="submit"  class="btn btn-primary">修改个人信息</button>
								   <button type="button" id="adAlterPass" onclick="window.location.href='adResetPass.jsp'" class="btn btn-primary">修改登陆密码</button>
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
