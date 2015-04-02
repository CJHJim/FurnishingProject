<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
	<meta http-equiv="pragma" content="no-cache" /> 
	<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" /> 
	<meta http-equiv="expires" content="0" />
 	<script type="text/javascript">
		<!--
		window.onload = function(){
			var b=document.getElementById("hid").value;
			if (b!=null&&b == "1") {
				window.location.reload();
			}else{
				document.getElementById("hid").value="0";
			}
	
		}
		var tag=true;
		function switchBar(obj){
			if(tag){
				parent.frame.cols="0,*";
				tag=false;
				obj.title="打开左边管理菜单";
			}
			else{
				parent.frame.cols="195,*";
				tag=true;
				obj.title="关闭左边管理菜单";
			}
		}
	  function quit(){
	  	var b=window.confirm("您确认退出吗？");
		if(b==true){
		document.getElementById("hid").value="1";
		window.parent.location.href="customerExit.html"
		}
	  }	
	   function CreateXmlHttpRequest(){//创建xmlhttprequest对象
       var xmlHttp = null;
       try{  // Firefox, Opera 8.0+, Safari 
            xmlHttp=new XMLHttpRequest(); 
           }catch(e){  // Internet Explorer 
            try{xmlHttp=new ActiveXObject("Msxml2.XMLHTTP"); 
            }catch(e){ try{xmlHttp=new ActiveXObject("Microsoft.XMLHTTP"); 
                   }catch(e){ 
                      alert("您的浏览器不支持AJAX！"); 
                   } 
            } 
       }
	   return xmlHttp;
   }
	  -->
	</script>
 <!-- topbar starts -->
 <div id="bg" style="float:bottom;">
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container-fluid">
					<span id="teacher_title">
					<s:if test="#session.customer!=null">
							用户名：&nbsp;&nbsp;${customer.loginName}						
						</s:if>
						<s:else>
						<script type="text/javascript">
						    alert("您尚未登录本系统，请先登录！");
						    window.parent.location.href = "${pageContext.request.contextPath}/login.jsp";	
						 </script>
						</s:else>
						
					</span>
					<!-- user dropdown starts -->
				    <div class="btn-group pull-right" >
						<a class="btn dropdown-toggle" data-toggle="dropdown"> 
						<i class="icon-user"></i><span class="hidden-phone">首页</span> 
						<span class="caret"></span> 
						</a>
						<ul class="dropdown-menu">							
						    <li>
								<a href="index.jsp">首页</a>
							</li>
                            <li>
							   <a href="javascript:void(0)" onclick="quit()">退出登录</a>
		                       <input type="hidden" id="hid" name="hid" value="0"/>
							</li>							
						</ul>
				  </div>
					<!-- user dropdown ends -->
			  </div>
			  </div>
			</div>
		</div>
		<!-- jQuery -->
		<script src="js/frame_js/jquery-1.7.2.min.js"></script>
		<!-- transition / effect library -->
		<script src="js/frame_js/bootstrap-transition.js"></script>
		<!-- alert enhancer library -->
		<script src="js/frame_js/bootstrap-alert.js"></script>
		<!-- modal / dialog library -->
		<script src="js/frame_js/bootstrap-modal.js"></script>
		<!-- custom dropdown library -->
		<script src="js/frame_js/bootstrap-dropdown.js"></script>
		<!-- scrolspy library -->
		<script src="js/frame_js/bootstrap-scrollspy.js"></script>
		<!-- library for creating tabs -->
		<script src="js/frame_js/bootstrap-tab.js"></script>
		<!-- library for advanced tooltip -->
		<script src="js/frame_js/bootstrap-tooltip.js"></script>
		<!-- popover effect library -->
		<script src="js/frame_js/bootstrap-popover.js"></script>
		<!-- button enhancer library -->
		<script src="js/frame_js/bootstrap-button.js"></script>
		<!-- accordion library (optional, not used in demo) -->
		<script src="js/frame_js/bootstrap-collapse.js"></script>
		<!-- carousel slideshow library (optional, not used in demo) -->
		<script src="js/frame_js/bootstrap-carousel.js"></script>
		<!-- autocomplete library -->
		<script src="js/frame_js/bootstrap-typeahead.js"></script>
		<!-- tour library -->
		<script src="js/frame_js/bootstrap-tour.js"></script>
		<!-- library for cookie management -->
		<script src="js/frame_js/jquery.cookie.js"></script>
		<!-- calander plugin -->
		<script src='js/frame_js/fullcalendar.min.js'></script>
		<!-- data table plugin -->
		<!--<script src='js/frame_js/jquery.dataTables.min.js'></script>-->

		<!-- chart libraries start -->
		<script src="js/frame_js/excanvas.js"></script>
		<script src="js/frame_js/jquery.flot.min.js"></script>
		<script src="js/frame_js/jquery.flot.pie.min.js"></script>
		<script src="js/frame_js/jquery.flot.stack.js"></script>
		<script src="js/frame_js/jquery.flot.resize.min.js"></script>
		<!-- chart libraries end -->

		<!-- select or dropdown enhancer -->
		<script src="js/frame_js/jquery.chosen.min.js"></script>
		<!-- checkbox, radio, and file input styler -->
		<script src="js/frame_js/jquery.uniform.min.js"></script>
		<!-- plugin for gallery image view -->
		<script src="js/frame_js/jquery.colorbox.min.js"></script>
		<!-- rich text editor library -->
		<script src="js/frame_js/jquery.cleditor.min.js"></script>
		<!-- notification plugin -->
		<script src="js/frame_js/jquery.noty.js"></script>
		<!-- file manager library -->
		<script src="js/frame_js/jquery.elfinder.min.js"></script>
		<!-- star rating plugin -->
		<script src="js/frame_js/jquery.raty.min.js"></script>
		<!-- for iOS style toggle switch -->
		<script src="js/frame_js/jquery.iphone.toggle.js"></script>
		<!-- autogrowing textarea plugin -->
		<script src="js/frame_js/jquery.autogrow-textarea.js"></script>
		<!-- multiple file upload plugin -->
		<script src="js/frame_js/jquery.uploadify-3.1.min.js"></script>
		<!-- history.js for cross-browser state change on ajax -->
		<script src="js/frame_js/jquery.history.js"></script>
		
		<!-- topbar ends -->
		