<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">
		<title>智能家居销售平台</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
		<script type="text/javascript" src="./js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="./js/form.js"></script>
        <link href="./css/skin.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="./js/admin.js"></script>
        <style type="text/css">
            body {
                margin-left: 0px;
                margin-top: 0px;
                margin-right: 0px;
                margin-bottom: 0px;
                background-color: #1D3647;
				
            }
        
        </style>   
		<script type="text/javascript">
			//登陆校验
			function customerLoginFrom(){
				var username=$("#username").val();
				var password=$("#password").val();
				var verifycode=$("#verifycode").val();
				if(username==null||username==""||username=='undefined'){
					alert("登陆用户名不能为空");
					return false;
				}
				if(!checkUserName(username,3,20,true)){
					alert("登录名不合法");
					return false;
				}
				if(password==null||password==""||password=='undefined'){
					alert("登陆密码不能为空");
					return false;
				}
				if(!checkUserName(password,3,20,false)){
					alert("登陆密码不合法");
					return false;
				}
				if(verifycode==null||verifycode==""||verifycode=='undefined'){
					alert("登陆验证码不能为空");
					return false;
				}
				if(!checkVerifyCode(verifycode)){
					alert("登陆验证码不合法");
					return false;
				}
				
				
				
				return false;
			}
			
			var message="${customerMsg}";
			if(message!=null&&message!=""&&message!='undefined'){
				alert(message);
				window.location.href='login.jsp'
			}	
		</script>     
    </head>
    <body>
        <table width="100%" height="166" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td height="42" valign="top">
                    <table width="100%" height="42" border="0" cellpadding="0" cellspacing="0" class="login_top_bg">
                        <tr>
                            <td width="1%" height="21">
                                &nbsp;
                            </td>
                            <td height="42">
                                &nbsp;
                            </td>
                            <td width="17%">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <table width="100%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg">
                        <tr>
                            <td width="49%" align="right">
                                
                                
                            </td>
                            <td width="1%">
                                &nbsp;
                            </td>
                            <td width="50%" valign="bottom">
                                <table width="100%" height="59" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="4%">
                                            &nbsp;
                                        </td>
                                        <td width="96%" height="38">
                                            <span class="login_txt_bt">智能家居销售平台用户登录</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td height="21">
                                            <table cellSpacing="0" cellPadding="0" width="100%" border="0" id="table211" height="328">
                                                <tr>
                                                    <td height="164" colspan="2" align="middle">
                                                        <form name="myform" action="customerLoginAction.jsp" onsubmit="return customerLoginFrom()" method="post">
                                                            <table cellSpacing="0" cellPadding="0" width="100%" border="0" height="143" id="table212">
                                                                <tr>
                                                                    <td width="8%" height="38" class="top_hui_text">
                                                                        <span class="login_txt">用户名：&nbsp; </span>
                                                                    </td>
                                                                    <td height="38" colspan="2" class="top_hui_text">
                                                                        <input name="username" id="username" class="editbox4" value="${userName}" size="20">&nbsp;<font color='red'>长度为3到20位</font>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="8%" height="35" class="top_hui_text">
                                                                        <span class="login_txt">密 码： &nbsp;</span>
                                                                    </td>
                                                                    <td height="8%" colspan="2" class="top_hui_text">
                                                                        <input class="editbox4" id="password" type="password" value="${password}" size="20" name="password">&nbsp;<font color='red'>长度为3到20位</font>&nbsp;&nbsp;<img src="./images/admin/luck.gif" width="19" height="18">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="60px" height="35">
                                                                        <span class="login_txt">验证码：</span>
                                                                    </td>
                                                                    <td height="35" colspan="2" class="top_hui_text">
                                                                        <input class="wenbenkuang" name="verifycode" id="verifycode" type="text" value="${rand}" maxLength=4 size=10>
																		<img alt="code..." name="randImage" id="randImage" src="image.jsp" />
																		<a href="javascript:refreshImg();" style="line-height:31px; margin-left:6px;">看不清？</a>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td height="35">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="9%" height="35">
                                                                        <input name="Submit" type="submit" class="button" id="Submit" value="登  陆">
                                                                    </td>
                                                                    <td  class="top_hui_text">
                                                                        <input name="cs" type="reset" class="button" id="cs" value="取 消" >
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br>
                                                        </form>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="433" height="164" align="right" valign="bottom">
                                                        <img src="./images/admin/login-wel.gif" width="242" height="138">
                                                    </td>
                                                    <td width="57" align="right" valign="bottom">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="20">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="login-buttom-bg">
                        <tr>
                            <td align="center">
                                <span class="login-buttom-txt">Copyright &copy;2014-2015</span>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </body>
</html>

