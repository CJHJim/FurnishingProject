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
								<font size='3' class="changeBackground">我的购物</font>
						      </li>
                                 
								  <li name="productMenu">
									<a class="ajax-link"  href="myCar.jsp">
										<i class="icon-eye-open"></i><span class="hidden-tablet">我的购物车</span>
									</a>
								  </li>
								  
								   <li name="productMenu">
									<a class="ajax-link"  href="supplierHistory.jsp">
										<i class="icon-eye-open"></i><span class="hidden-tablet">购买过的店铺</span>
									</a>
								  </li>
								  
								   <li name="productMenu">
									<a class="ajax-link"  href="myCollection.jsp">
										<i class="icon-eye-open"></i><span class="hidden-tablet">我的收藏</span>
									</a>
								  </li>
								  
								  <li name="productMenu">
									<a class="ajax-link"  href="myFocus.jsp">
										<i class="icon-eye-open"></i><span class="hidden-tablet">我的关注</span>
									</a>
								  </li>
								  
								   <li name="productMenu">
									<a class="ajax-link"  href="myRecommend.jsp">
										<i class="icon-eye-open"></i><span class="hidden-tablet">我的浏览</span>
									</a>
								  </li>
								  
								   <li name="productMenu">
									<a class="ajax-link"  href="myRecommend.jsp">
										<i class="icon-eye-open"></i><span class="hidden-tablet">我的推荐</span>
									</a>
								  </li>
								  
								  <li name="productMenu">
									<a class="ajax-link"  href="myGroup.jsp">
										<i class="icon-eye-open"></i><span class="hidden-tablet">我的团购</span>
									</a>
								  </li>
								  
								  <li name="productMenu">
									<a class="ajax-link"  href="groupHouseManage.jsp">
										<i class="icon-eye-open"></i><span class="hidden-tablet">团购大厅</span>
									</a>
								  </li>
								 
		                 		 <li name="productMenu">
									<a class="ajax-link"  href="myCommentManage.jsp">
										<i class="icon-eye-open"></i><span class="hidden-tablet">评价管理</span>
									</a>
								  </li>

		                 		 <li name="productMenu">
									<a class="ajax-link"  href="supplier/productManage.jsp">
										<i class="icon-eye-open"></i><span class="hidden-tablet">积分管理</span>
									</a>
								  </li>
								  
							  <li class="nav-header hidden-tablet" id="moneyMenu">
								<i id="moneyIcon" style="margin-top:-5px;" class="icon-minus-sign"></i>
								<font size='3' class="changeBackground">我的账户</font>
						      </li>	  
							  
							   <li name="moneyingMenu">
								<a class="ajax-link"  href="myAccount.jsp">
									<i class="icon-eye-open"></i><span class="hidden-tablet">账户信息管理</span>
								</a>
							  </li>
							  
							    <li name="moneyingMenu">
								<a class="ajax-link"  href="moneyRecordManage.jsp">
									<i class="icon-eye-open"></i><span class="hidden-tablet">收支明细</span>
								</a>
							  </li>
							  
							   <li name="moneyingMenu">
								<a class="ajax-link"  href="safeManage.jsp">
									<i class="icon-eye-open"></i><span class="hidden-tablet">账户安全</span>
								</a>
							  </li>
							  
							  <li name="moneyingMenu">
								<a class="ajax-link"  href="bankManage.jsp">
									<i class="icon-eye-open"></i><span class="hidden-tablet">账户关联银行</span>
								</a>
							  </li>
							  
							  <li class="nav-header hidden-tablet" id="shopMenu">
								<i id="shopMenuIcon" style="margin-top:-5px;" class="icon-minus-sign"></i>								
								<font size='3' class="changeBackground">需求管理</font>
						      </li>							  
							  
							   <li name="shopMenuingMenu" >
								   <a class="ajax-link" href="myProductManage.jsp">
								  	<i class="icon-user"></i><span class="hidden-tablet">需求大厅</span>
								   </a>
							     </li>	

								  <li name="shopMenuingMenu" >
								   <a class="ajax-link" href="requireBidSupplierManage.jsp">
								  	<i class="icon-user"></i><span class="hidden-tablet">我的需求</span>
								   </a>
							     </li>	
								  
								   <li name="shopMenuingMenu">
								   <a class="ajax-link" href="successdCaseManage.jsp">
								 	 <i class="icon-user"></i><span class="hidden-tablet">成功案例</span>
								   </a>
							      </li>
								  
								   <li name="shopMenuingMenu">
								   <a class="ajax-link" href="certificatedSupplierManage.jsp">
								 	 <i class="icon-user"></i><span class="hidden-tablet">认证商家</span>
								   </a>
							      </li>
								  
								  
							  
								  		
							  <li class="nav-header hidden-tablet" id="orderMenu">
								<i id="orderMenuIcon" style="margin-top:-5px;" class="icon-minus-sign"></i>								
								<font size='3' class="changeBackground">订单管理</font>
						      </li>

			                   	 <li name="orderingMenu" >
								   <a class="ajax-link" href="myOrderManage.jsp">
								  	<i class="icon-user"></i><span class="hidden-tablet">订单信息管理</span>
								   </a>
							     </li>		

							   	  <li name="orderingMenu">
								   <a class="ajax-link" href="returnMyOrderManage.jsp">
								 	 <i class="icon-user"></i><span class="hidden-tablet">退货订单管理</span>
								   </a>
							      </li>

							   	  <li name="orderingMenu">
								   <a class="ajax-link" href="exchangeMyOrderManage.jsp">
								 	<i class="icon-user"></i><span class="hidden-tablet">换货订单管理</span>
								   </a>
							      </li>						   			
	
							   	 <li name="orderingMenu">
								 <a class="ajax-link" href="myHistoryOrderManage.jsp">
								 	<i class="icon-user"></i><span class="hidden-tablet">历史订单查询</span>
								</a>
							    </li>						   			
						    
							  <li class="nav-header hidden-tablet" id="customerMenu">
							  	    <i id="customerIcon" style="margin-top:-5px;" class="icon-minus-sign"></i>								
									<font size='3' class="changeBackground">客户服务</font>
							  </li>
			                     
								  <li name="customeringMenu">
							      <a class="ajax-link" href="returnMoneyManage.jsp">
							      	<i class="icon-eye-open"></i><span class="hidden-tablet">退款管理</span>
								</a>
								 </li>	
								 
								 <li name="customeringMenu">
							      <a class="ajax-link" href="customerComplain.jsp">
							      	<i class="icon-eye-open"></i><span class="hidden-tablet">投诉管理</span>
								  </a>
								 </li>	
								 
								  <li name="customeringMenu">
							      <a class="ajax-link" href="customerArbitration.jsp">
							      	<i class="icon-eye-open"></i><span class="hidden-tablet">仲裁管理</span>
								  </a>
								 </li>	
								 
								  <li name="customeringMenu">
								  <a class="ajax-link" href="${function.functionUrl}">
								  	<i class="icon-eye-open"></i><span class="hidden-tablet">咨询回复</span>
								  </a>
							     </li>			
							
							  <li class="nav-header hidden-tablet" id="systemMenu">	
							    <i id="systemMenuIcon" style="margin-top:-5px;" class="icon-minus-sign"></i>						
								<font size='3' class="changeBackground">用户中心</font>
							  </li>		
						  
						        <li name="systemingMenu">
							      <a class="ajax-link" href="customer.jsp">
							      	<i class="icon-eye-open"></i><span class="hidden-tablet">个人信息</span>
								  </a>
						        </li>
								
								<li name="systemingMenu">
							      <a class="ajax-link" href="customerCredit.jsp">
							      	<i class="icon-eye-open"></i><span class="hidden-tablet">信誉等级</span>
								  </a>
						        </li>
								
								<li name="systemingMenu">
							      <a class="ajax-link" href="myAddressManage.jsp">
							      	<i class="icon-eye-open"></i><span class="hidden-tablet">收货地址</span>
								  </a>
						        </li>	
						
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
				  
				  $("#moneyMenu").click(function(){
					if($("li[name='moneyingMenu']:visible").length!=0){
						$("li[name='moneyingMenu']").each(function(){
						    $(this).hide();
					    });
						$("#moneyIcon").removeClass("icon-minus-sign");
						$("#moneyIcon").addClass("icon-plus-sign");
					}else{
						$("li[name='moneyingMenu']").each(function(){
						    $(this).show();
					    });
						$("#moneyIcon").removeClass("icon-plus-sign");
						$("#moneyIcon").addClass("icon-minus-sign");
					 }
				  });
				  
				    $("#shopMenu").click(function(){
					if($("li[name='shopMenuingMenu']:visible").length!=0){
						$("li[name='shopMenuingMenu']").each(function(){
						    $(this).hide();
					    });
						$("#shopMenuIcon").removeClass("icon-minus-sign");
						$("#shopMenuIcon").addClass("icon-plus-sign");
					}else{
						$("li[name='shopMenuingMenu']").each(function(){
						    $(this).show();
					    });
						$("#shopMenuIcon").removeClass("icon-plus-sign");
						$("#shopMenuIcon").addClass("icon-minus-sign");
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
					
					$("#customerMenu").click(function(){
						if($("li[name='customeringMenu']:visible").length!=0){
							$("li[name='customeringMenu']").each(function(){
							    $(this).hide();
						    });
							$("#customerIcon").removeClass("icon-minus-sign");
						    $("#customerIcon").addClass("icon-plus-sign");
						}else{
							$("li[name='customeringMenu']").each(function(){
							    $(this).show();
						    });
							$("#customerIcon").removeClass("icon-plus-sign");
						    $("#customerIcon").addClass("icon-minus-sign");
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
