<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0080)http://localhost:8080/mango/login.jhtml?redirectUrl=%2Fmango%2Fcart%2Flist.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>会员登录</title>

<link href="./css/common.css" rel="stylesheet" type="text/css" />
<link href="./css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function change(){
		var checkImg = $("verifycode");
		checkImg.src = "${pageConext.request.contextPath}/user_verifycode.action?time" + new Date().getTime();
	}
	function $(id){
		return document.getElementById(id);
	}
</script>

</head>
<body>
	<%@ include file="head.jsp"%>
	<div class="container login">
		<div class="span12">
			<div class="ad">
				<img src="${pageContext.request.contextPath}/image/login.jpg" width="500" height="330" alt="会员登录"
					title="会员登录">
			</div>
		</div>
		<div class="span12 last">
			<div class="wrap">
				<div class="main">
					<div class="title">
						<strong>会员登录</strong>USER LOGIN
					</div>
					<form id="loginForm" method="post" action="user_login.action">
						<table>
							<tbody>
								<tr>
									<th>用户名/E-mail:</th>
									<td><input type="text" id="username" name="user.username"
										class="text" maxlength="20"></td>
								</tr>
								<tr>
									<th>密&nbsp;&nbsp;码:</th>
									<td><input type="password" id="password" name="user.password"
										class="text" maxlength="20" autocomplete="off"></td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>验证码:</th>
									<td><span class="fieldSet"> <input type="text"
											id="verifycode" name="verifycode" class="text captcha"
											maxlength="4" autocomplete="off"><img
												id="captchaImage" class="captchaImage"
												src="user_verifycode.action"
												title="点击更换验证码" onclick="change();"></span>
											<s:actionerror />			
									</td>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td><label> <input type="checkbox"
											id="isRememberUsername" name="isRememberUsername"
											value="true">记住用户名 </label> <label> &nbsp;&nbsp;<a>找回密码</a>
									</label></td>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td><input type="submit" class="submit" value="登 录"></td>
								</tr>
								<tr class="register">
									<th>&nbsp;</th>
									<td>
										<dl>
											<dt>还没有注册账号？</dt>
											<dd>
												立即注册即可体验在线购物！ <a href="./会员注册.htm">立即注册</a>
											</dd>
										</dl>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="foot.jsp"%>
</body>
</html>