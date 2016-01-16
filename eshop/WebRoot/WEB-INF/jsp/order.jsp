<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>订单页面</title>
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/cart.css"
	rel="stylesheet" type="text/css" />

</head>
<body>
	<%@ include file="head.jsp"%>
	<div class="container cart">
		<div class="span24">
			<div class="step step1">
				<ul>
					<li class="current"></li>
					<li>生成订单成功</li>
				</ul>
			</div>
				<table>
					<tbody>
						<tr>
							<span>订单编号：<s:property value="#request.order.oid" />&nbsp;&nbsp;&nbsp;&nbsp;订单状态：
								<s:if test="#request.order.state == 1">
									<a target="_blank"
										href="${pageContext.request.contextPath }/order_payOrder.action?oid=<s:property value="#order.oid"/>"><font
										color="red">付款</font></a>
								</s:if>
							</span>
						</tr>
						<tr>
							<th>图片</th>
							<th>商品</th>
							<th>价格</th>
							<th>数量</th>
							<th>小计</th>
							<th>操作</th>
						</tr>
						<s:set value="#request.order.orderitems" id="items"></s:set>
						<s:iterator value="#items" id="item">
							<tr>
								<td width="60"><input type="hidden" name="id" value="22" />
									<img src="${pageContext.request.contextPath }/<s:property value="#item.product.image"/>" /></td>
								<td><a target="_blank" href="product_findDetail.action?pid=<s:property value='#item.product.pid'/>"><s:property value="#item.product.pname" /></a>
								</td>
								<td><s:property value="#item.product.shopPrice"/></td>
								<td class="quantity" width="60"><input type="text"
									name="count" value="<s:property value="#item.count"/>" maxlength="4" onpaste="return false;" />
									<div>
										<span class="increase">&nbsp;</span> <span class="decrease">&nbsp;</span>
									</div></td>
								<td width="140"><span class="subtotal">￥<s:property value="#item.subtotal"/></span></td>
								<td><a href="./cart_removeCart.action?pid=1" class="delete">删除</a>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			<dl id="giftItems" class="hidden" style="display: none;">
			</dl>
			<div class="total">
				<em id="promotion"></em> 商品金额: <strong id="effectivePrice">￥<s:property  value="#request.order.total"/>元</strong>
			</div>
			<form id="orderForm" action="order_payOrder.action" method="post">
				<input type="hidden" name="oid" value="<s:property value="#request.order.oid" />"/>
				<div class="span24">
					<p>
						收货地址：<input name="address" type="text" value="<s:property value="#session.user.userdetail.address"/>"
							style="width:350px" /> <br /> 收货人&nbsp;&nbsp;&nbsp;：<input
							name="name" type="text" value="<s:property value="#session.user.username"/>"
							style="width:150px" /> <br /> 联系方式：<input
							name="phone" type="text" value="<s:property value="#session.user.userdetail.phone"/>" style="width:150px" />
					</p>
					<hr />
					<p>
						选择银行：<br /> <input type="radio" name="pd_FrpId"
							value="ICBC-NET-B2C" checked="checked" />工商银行 <img
							src="${pageContext.request.contextPath}/bank_img/icbc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="BOC-NET-B2C" />中国银行 <img
							src="${pageContext.request.contextPath}/bank_img/bc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="ABC-NET-B2C" />农业银行 <img
							src="${pageContext.request.contextPath}/bank_img/abc.bmp" align="middle" /> <br /> <input
							type="radio" name="pd_FrpId" value="BOCO-NET-B2C" />交通银行 <img
							src="${pageContext.request.contextPath}/bank_img/bcc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="PINGANBANK-NET" />平安银行
						<img src="${pageContext.request.contextPath}/bank_img/pingan.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="CCB-NET-B2C" />建设银行 <img
							src="${pageContext.request.contextPath}/bank_img/ccb.bmp" align="middle" /> <br /> <input
							type="radio" name="pd_FrpId" value="CEB-NET-B2C" />光大银行 <img
							src="${pageContext.request.contextPath}/bank_img/guangda.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" />招商银行
						<img src="${pageContext.request.contextPath}/bank_img/cmb.bmp" align="middle" />
					</p>
					<hr />
					<p style="text-align:right">
						<a
							href="javascript:document.getElementById('orderForm').submit();">
							<img src="${pageContext.request.contextPath}/images/finalbutton.gif" width="204" height="51"
							border="0" />
						</a>
					</p>
				</div>
			</form>
		</div>

	</div>

	<%@ include file="foot.jsp"%>
</body>
</html>
