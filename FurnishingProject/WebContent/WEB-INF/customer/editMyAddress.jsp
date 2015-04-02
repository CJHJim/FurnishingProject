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
		<title>修改收货地址</title>
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
								<a href="customer.jsp">主页</a><span class="divider">/</span>
							</li>
							<li>
								<a href="myAddressManage.jsp">收货地址管理</a><span class="divider">/</span>
							</li>
							<li>
								<a href="javascript:void(0);">修改收货地址</a>
							</li>
						</ul>
					</div>
					<div class="row-fluid sortable">
				<div class="box span12" >
					<div class="box-header well" data-original-title>
						<h2><i class="icon-edit"></i>修改收货地址</h2>
					</div>
					<script type="text/javascript">
						var message="${customerMsg}";
						if(message!=null&&message!=""&&message!='undefined'){
							alert(message);
							var r=0;
							p=/成功/;
						    r=message.search(p);
							if(r!=-1){
								window.location.href="myAddressManage.jsp";
							}								
						}
					</script>
					<div class="box-content" >
						<form class="form-horizontal" action="updateMyAddress.jsp" method="post">
							<fieldset>
								
							<input type="hidden" id="addressId" name="addressId" value="${editDestination.id}" />	
							<div class="control-group">
								<label class="control-label">收件人：</label>
								<div class="controls">
								  <input type="text" value="${editDestination.receiverName}" id="receiverName" name="receiverName"/>
								</div>
							  </div>
							  
							   <div class="control-group">
								<label class="control-label">电话：</label>
								<div class="controls">
								  	<input type="text" value="${editDestination.phone}" id="telephone" name="telephone"/>
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label">所在地：</label>
								<div class="controls">
								   <select id="province" name="province" onchange="loadCityByProvince(this);" style="height:40px;">
								   	<option value="">选择省份</option>
								   	  <s:iterator value="#request.provinceList" id="show_province" status="st">								   	  
										<s:if test="%{#request.editDestination.provinceId==#show_province.id}">											
										   <option value="${show_province.id}" selected="selected">${show_province.provinceName}</option>
										</s:if>
										<s:else>
											<option value="${show_province.id}">${show_province.provinceName}</option>
										</s:else>
								   	  </s:iterator>
								   </select>&nbsp;&nbsp;
								   
								   <select id="city" name="city" onchange="loadCountyByCity(this)" style="height:40px;">
								   	 <option value="">选择市</option>		
									 <option value="${tempCity.id}" selected="selected">${tempCity.cityName}</option>  						   	  
								   </select>&nbsp;&nbsp;
								   
								   <select id="county" name="county" style="height:40px;">
								   	 <option value="">选择县</option>
									 <option value="${tempCounty.id}" selected="selected">${tempCounty.countyName}</option>								   	 
								   </select>
								</div>
							  </div>
							  
							 <div class="control-group">
								<label class="control-label">详细地址：</label>
								<div class="controls">
								  	<input type="text" value="${editDestination.address}" id="address"  name="address"/>
								</div>
							  </div>
							    <div class="control-group">
								<label class="control-label">邮编：</label>
								<div class="controls">
								  	<input type="text" value="${editDestination.zipCode}" id="zipCode" name="zipCode"/>
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label" for="focusedInput"></label>
								<div class="controls">
									<button type="submit"  class="btn btn-primary">修改</button>		
									 <button type="button" onclick="window.location.href='myAddressManage.jsp'" class="btn btn-primary">返回</button>						  
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
