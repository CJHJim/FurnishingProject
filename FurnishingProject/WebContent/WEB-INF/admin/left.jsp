<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
 	<!-- left menu starts -->
				<div class="span2 main-menu-span">
					<div class="well nav-collapse sidebar-nav">
						<ul class="nav nav-tabs nav-stacked main-menu">
					 	
						  <li class="nav-header hidden-tablet" id="goodsMenu">
								<i id="productIcon" style="margin-top:-5px;" class="icon-minus-sign"></i>
								<font size='3' class="changeBackground">商品管理</font>
						  </li>
						  <s:iterator value="#session.adminFunctionList" id="function" status="st">	
						  
						    <s:if test="#function.functionName=='商品分类管理'">
			                   <s:if test="%{#function.enabled==0}">
			                   	 <li name="productMenu" >
								  <a class="ajax-link" href="admin/goodsCategoryManage.jsp">
								  	<i class="icon-eye-open"></i><span class="hidden-tablet">商品分类管理</span>
									</a>
							     </li>				
							  </s:if>
							 </s:if>
							 
							  <s:if test="#function.functionName=='商品类型管理'">
			                   <s:if test="%{#function.enabled==0}">
			                   	 <li name="productMenu" >
								  <a class="ajax-link" href="admin/goodsTypeManage.jsp">
								  	<i class="icon-eye-open"></i><span class="hidden-tablet">商品类型管理</span>
									</a>
							     </li>				
							  </s:if>
							 </s:if>
							 
							  <s:if test="#function.functionName=='分类类型关联管理'">
			                   <s:if test="%{#function.enabled==0}">
			                   	 <li name="productMenu" >
								  <a class="ajax-link" href="admin/goodsCategoryTypeManage.jsp">
								  	<i class="icon-eye-open"></i><span class="hidden-tablet">商品分类类型关联管理</span>
									</a>
							     </li>				
							  </s:if>
							 </s:if>
							 
							 
							   <s:if test="#function.functionName=='商品规格管理'">
			                 	<s:if test="%{#function.enabled==0}">
		                 		 <li name="productMenu">
									<a class="ajax-link"  href="admin/specificationTypeManage.jsp">
										<i class="icon-eye-open"></i><span class="hidden-tablet">商品规格管理</span>
									</a>
								  </li>
								</s:if>
							  </s:if>	
							  
							    <s:if test="#function.functionName=='商品扩展属性管理'">
			                 	<s:if test="%{#function.enabled==0}">
		                 		 <li name="productMenu">
									<a class="ajax-link"  href="admin/productAttributeManage.jsp">
										<i class="icon-eye-open"></i><span class="hidden-tablet">商品扩展属性管理</span>
									</a>
								  </li>
								</s:if>
							  </s:if>	
							 
							 
							 <s:if test="#function.functionName=='商品推送'">
			                   <s:if test="%{#function.enabled==0}">
			                   	 <li name="productMenu" >
								  <a class="ajax-link" href="javascript:void(0);">
								  	<i class="icon-eye-open"></i><span class="hidden-tablet">商品推送</span>
									</a>
							     </li>				
							  </s:if>
							 </s:if>
							 
							  <s:if test="#function.functionName=='品牌管理'">
			                   <s:if test="%{#function.enabled==0}">
			                   	 <li name="productMenu" >
								  <a class="ajax-link" href="admin/brandManage.jsp">
								  	<i class="icon-eye-open"></i><span class="hidden-tablet">品牌管理</span>
									</a>
							     </li>				
							  </s:if>
							 </s:if>
							 
							   <s:if test="#function.functionName=='类型品牌关联管理'">
			                   <s:if test="%{#function.enabled==0}">
			                   	 <li name="productMenu" >
								  <a class="ajax-link" href="admin/typeBrandManage.jsp">
								  	<i class="icon-eye-open"></i><span class="hidden-tablet">类型品牌关联管理</span>
									</a>
							     </li>				
							  </s:if>
							 </s:if>		
							 
							 <s:if test="#function.functionName=='客户需求管理'">
			                   <s:if test="%{#function.enabled==0}">
			                   	 <li name="productMenu" >
								  <a class="ajax-link" href="admin/customerRequireManage.jsp">
								  	<i class="icon-eye-open"></i><span class="hidden-tablet">客户需求管理</span>
									</a>
							     </li>				
							  </s:if>
							 </s:if>
							 
							 <s:if test="#function.functionName=='商品统计'">
			                   <s:if test="%{#function.enabled==0}">
			                   	 <li name="productMenu" >
								  <a class="ajax-link" href="javascript:void(0);">
								  	<i class="icon-eye-open"></i><span class="hidden-tablet">商品统计</span>
									</a>
							     </li>				
							  </s:if>
							 </s:if>
							 
							 </s:iterator>
						     
							
							<li class="nav-header hidden-tablet" id="orderMenu">
								<i id="orderMenuIcon" style="margin-top:-5px;" class="icon-minus-sign"></i>								
								<font size='3' class="changeBackground">订单管理</font>
						  </li>
						    <s:iterator value="#session.adminFunctionList" id="function" status="st">
						    	
							<s:if test="#function.functionName=='订单管理'">
			                   <s:if test="%{#function.enabled==0}">	
							   	 <li name="orderingMenu">
								 <a class="ajax-link" href="admin/orderManage.jsp">
								 	<i class="icon-eye-open"></i><span class="hidden-tablet">订单管理</span>
								</a>
							    </li>
								</s:if>
							   </s:if>	
							   
							   <s:if test="#function.functionName=='评价管理'">
			                   <s:if test="%{#function.enabled==0}">	
							   	 <li name="orderingMenu">
								 <a class="ajax-link" href="admin/adminCommentManage.jsp">
								 	<i class="icon-eye-open"></i><span class="hidden-tablet">评价管理</span>
								</a>
							    </li>
								</s:if>
							   </s:if>	
							   
							   <s:if test="#function.functionName=='仲裁管理'">
			                   <s:if test="%{#function.enabled==0}">	
							   	 <li name="orderingMenu">
								 <a class="ajax-link" href="admin/arbitrationManage.jsp">
								 	<i class="icon-eye-open"></i><span class="hidden-tablet">仲裁管理</span>
								</a>
							    </li>
								</s:if>
							   </s:if>		
							   
							  <s:if test="#function.functionName=='投诉管理'">
			                   <s:if test="%{#function.enabled==0}">	
							   	 <li name="orderingMenu">
								 <a class="ajax-link" href="admin/complainManage.jsp">
								 	<i class="icon-eye-open"></i><span class="hidden-tablet">投诉管理</span>
								</a>
							    </li>
								</s:if>
							   </s:if>	
							   
							  <s:if test="#function.functionName=='报表管理'">
			                   <s:if test="%{#function.enabled==0}">	
							   	 <li name="orderingMenu">
								 <a class="ajax-link" href="admin/adminReportManage.jsp">
								 	<i class="icon-eye-open"></i><span class="hidden-tablet">报表管理</span>
								</a>
							    </li>
								</s:if>
							   </s:if>	
							   
							  <s:if test="#function.functionName=='退款管理'">
			                   <s:if test="%{#function.enabled==0}">	
							   	 <li name="orderingMenu">
								 <a class="ajax-link" href="admin/backupMoneyManage.jsp">
								 	<i class="icon-eye-open"></i><span class="hidden-tablet">退款管理</span>
								</a>
							    </li>
								</s:if>
							   </s:if>								  

							</s:iterator>		
							
							<li class="nav-header hidden-tablet" id="adminMenu">
								<i id="adminMenuIcon" style="margin-top:-5px;" class="icon-minus-sign"></i>								
								<font size='3' class="changeBackground">操作员管理</font>
						  </li>
						    <s:iterator value="#session.adminFunctionList" id="function" status="st">
			                  <s:if test="#function.functionName=='个人信息管理'">
			                   <s:if test="%{#function.enabled==0}">
			                   	 <li name="adminingMenu" >
								  <a class="ajax-link" href="admin/admin.jsp">
								  	<i class="icon-user"></i><span class="hidden-tablet">个人信息管理</span>
									</a>
							     </li>				
							  </s:if>
							 </s:if>
			
			                  <s:if test="#function.functionName=='操作员管理'">
			                   <s:if test="%{#function.enabled==0}">	
							   	 <li name="adminingMenu">
								 <a class="ajax-link" href="admin/adminManage.jsp">
								 	<i class="icon-user"></i><span class="hidden-tablet">操作员信息管理</span>
								</a>
							    </li>
								</s:if>
							   </s:if>							    											
			                
			                  <s:if test="#function.functionName=='操作员权限管理'">
			                   <s:if test="%{#function.enabled==0}">	
							   	 <li name="adminingMenu">
								 <a class="ajax-link" href="admin/operateAuthManage.jsp">
								 	<i class="icon-user"></i><span class="hidden-tablet">操作员权限管理</span>
								</a>
							    </li>						   			
							  </s:if>
							 </s:if>	
							 
							 <s:if test="#function.functionName=='操作员角色管理'">
			                   <s:if test="%{#function.enabled==0}">	
							   	 <li name="adminingMenu">
								 <a class="ajax-link" href="admin/roleManage.jsp">
								 	<i class="icon-user"></i><span class="hidden-tablet">操作员角色管理</span>
								</a>
							    </li>						   			
							  </s:if>
							 </s:if>

							</s:iterator>
						    
						  <li class="nav-header hidden-tablet" id="changeMenu">
						  	    <i id="changeMenuIcon" style="margin-top:-5px;" class="icon-minus-sign"></i>								
								<font size='3' class="changeBackground">用戶管理</font>
						  </li>
			              	<s:iterator value="#session.adminFunctionList" id="function" status="st">
								
			                  <s:if test="#function.functionName=='会员管理'">
			                   <s:if test="%{#function.enabled==0}">	
								 <li name="changingMenu">
							      <a class="ajax-link" href="admin/customerManage.jsp">
							      	<i class="icon-user"></i><span class="hidden-tablet">会员管理</span>
								</a>
								 </li>				
							  </s:if>
							 </s:if>
							
			                  <s:if test="#function.functionName=='供应商管理'">
			                   <s:if test="%{#function.enabled==0}">	
							     <li name="changingMenu">
								  <a class="ajax-link" href="admin/supplierManage.jsp">
								  	<i class="icon-user"></i><span class="hidden-tablet">供应商管理</span>
								</a>
							     </li>			
							  </s:if>
							 </s:if>							
							 
							</s:iterator>					
						
						  <li class="nav-header hidden-tablet" id="systemMenu">	
						   <i id="systemMenuIcon" style="margin-top:-5px;" class="icon-minus-sign"></i>						
							<font size='3' class="changeBackground">系统设置</font>
						  </li>
						   <s:iterator value="#session.adminFunctionList" id="function" status="st">
						   	
			                <s:if test="#function.functionName=='系统设置'">
			                   <s:if test="%{#function.enabled==0}">	
								 <li name="systemingMenu">
							      <a class="ajax-link" href="admin/systemSetting.jsp">
							      	<i class="icon-eye-open"></i><span class="hidden-tablet">系统设置</span>
								</a>
								 </li>				
							  </s:if>
							 </s:if>
							 
							 <s:if test="#function.functionName=='信息管理'">
			                   <s:if test="%{#function.enabled==0}">	
								 <li name="systemingMenu">
							      <a class="ajax-link" href="#function.functionUrl">
							      	<i class="icon-eye-open"></i><span class="hidden-tablet">信息管理</span>
								</a>
								 </li>				
							  </s:if>
							 </s:if>	
							 
							 <s:if test="#function.functionName=='供应商等级管理'">
			                   <s:if test="%{#function.enabled==0}">	
								 <li name="systemingMenu">
							      <a class="ajax-link" href="admin/supplierClassManage.jsp">
							      	<i class="icon-eye-open"></i><span class="hidden-tablet">供应商等级管理</span>
								</a>
								 </li>				
							  </s:if>
							 </s:if>	
							 
							</s:iterator>	
						
					  </ul>
					</div><!--/.well -->
				</div><!--/span-->
				<!-- left menu ends -->
			<script type="text/javascript" src="./js/jquery-1.7.2.min.js" ></script>
			<script type="text/javascript">
		 	$(document).ready(function(){	
				$("#goodsMenu").click(function(){
					if($("li[name='productMenu']:visible").length!=0){
						$("li[name='productMenu']").each(function(){
						    $(this).hide();
					    });
						$("#productIcon").removeClass("icon-minus-sign");
						$("#productIcon").addClass("icon-plus-sign");
					}else{
						$("li[name='productMenu']").each(function(){
						    $(this).show();
					    });
						$("#productIcon").removeClass("icon-plus-sign");
						$("#productIcon").addClass("icon-minus-sign");
					 }
				  });
					
					$("#orderMenu").click(function(){
						if($("li[name='orderingMenu']:visible").length!=0){
							$("li[name='orderingMenu']").each(function(){
							    $(this).hide();
						    });
							$("#orderMenuIcon").removeClass("icon-minus-sign");
						    $("#orderMenuIcon").addClass("icon-plus-sign");
						}else{
							$("li[name='orderingMenu']").each(function(){
							    $(this).show();
						    });
							$("#orderMenuIcon").removeClass("icon-plus-sign");
						    $("#orderMenuIcon").addClass("icon-minus-sign");
					     }
					});
					
					$("#repositoryMenu").click(function(){
						if($("li[name='repositoryingMenu']:visible").length!=0){
							$("li[name='repositoryingMenu']").each(function(){
							    $(this).hide();
						    });
							$("#repositoryMenuIcon").removeClass("icon-minus-sign");
						    $("#repositoryMenuIcon").addClass("icon-plus-sign");
						}else{
							$("li[name='repositoryingMenu']").each(function(){
							    $(this).show();
						    });
							$("#repositoryMenuIcon").removeClass("icon-plus-sign");
						    $("#repositoryMenuIcon").addClass("icon-minus-sign");
					     }
					});
					
					$("#adminMenu").click(function(){
						if($("li[name='adminingMenu']:visible").length!=0){
							$("li[name='adminingMenu']").each(function(){
							    $(this).hide();
						    });
							$("#adminMenuIcon").removeClass("icon-minus-sign");
						    $("#adminMenuIcon").addClass("icon-plus-sign");
						}else{
							$("li[name='adminingMenu']").each(function(){
							    $(this).show();
						    });
							$("#adminMenuIcon").removeClass("icon-plus-sign");
						    $("#adminMenuIcon").addClass("icon-minus-sign");
					     }
					});
					$("#logisticMenu").click(function(){
						if($("li[name='logisticingMenu']:visible").length!=0){
							$("li[name='logisticingMenu']").each(function(){
							    $(this).hide();
						    });
							$("#logisticMenuIcon").removeClass("icon-minus-sign");
						    $("#logisticMenuIcon").addClass("icon-plus-sign");
						}else{
							$("li[name='logisticingMenu']").each(function(){
							    $(this).show();
						    });
							$("#logisticMenuIcon").removeClass("icon-plus-sign");
						    $("#logisticMenuIcon").addClass("icon-minus-sign");
					     }
					});
					$("#changeMenu").click(function(){
						if($("li[name='changingMenu']:visible").length!=0){
							$("li[name='changingMenu']").each(function(){
							    $(this).hide();
						    });
							$("#changeMenuIcon").removeClass("icon-minus-sign");
						    $("#changeMenuIcon").addClass("icon-plus-sign");
						}else{
							$("li[name='changingMenu']").each(function(){
							    $(this).show();
						    });
							$("#changeMenuIcon").removeClass("icon-plus-sign");
						    $("#changeMenuIcon").addClass("icon-minus-sign");
					     }
					});
					
					$("#systemMenu").click(function(){
						if($("li[name='systemingMenu']:visible").length!=0){
							$("li[name='systemingMenu']").each(function(){
							    $(this).hide();
						    });
							$("#systemMenuIcon").removeClass("icon-minus-sign");
						    $("#systemMenuIcon").addClass("icon-plus-sign");
						}else{
							$("li[name='systemingMenu']").each(function(){
							    $(this).show();
						    });
							$("#systemMenuIcon").removeClass("icon-plus-sign");
						    $("#systemMenuIcon").addClass("icon-minus-sign");
					     }
					});
		    	});
			
		</script>
		<style type="text/css">
			.changeBackground{			   
				cursor:pointer;				
			     color: #2071a1;
			}
			
			
		</style>
