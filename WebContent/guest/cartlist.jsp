<%@page import="shop.product.ProductBean"%>
<%@page import="shop.order.OrderBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cartMgr" class="shop.order.CartMgr" scope="session" />
<jsp:useBean id="productMgr" class="shop.product.ProductMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품주문</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" >
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
** 장바구니 목록 보기 **<p/>
<%@ include file="guest_top.jsp" %>
<table style="width: 90%">
  <tr style="background-color: pink">
  	<th>주문상품</th><th>가격(소계)</th><th>수량</th><th>수정/삭제</th><th>조회</th>
  </tr>
  <%
  int totalPrice = 0;
  Hashtable hCart = cartMgr.getCartList();
  if(hCart.size() == 0){
  %>
  <tr><td>주문 내역 없어요</td></tr>
  <%	  
  }else{
	  Enumeration enu = hCart.keys();  //Map cpollection 읽어 처리하기
	  while(enu.hasMoreElements()){
		 OrderBean orderBean = (OrderBean)hCart.get(enu.nextElement());
		 ProductBean productBean = productMgr.getProduct(orderBean.getProduct_no());
		 int price = Integer.parseInt(productBean.getPrice());
		 int quantity = Integer.parseInt(orderBean.getQuantity());
		 int subTotal = price * quantity;  //소계	
		 totalPrice += subTotal;   //총계
   %>
   <form action="cartproc.jsp" method="get">
   	<input type="hidden" name="flag">
   	<input type="hidden" name="product_no" value="<%=productBean.getNo()%>">
   	<tr style="text-align: center;">
   		<td><%=productBean.getName() %></td>
   		<td><%=subTotal %></td>
   		<td>
   			<input type="text" name="quantity" style="text-align: center;"
   			size="5" value="<%=quantity %>">
   		</td>
   		<td>
   			<input style="background-color: aqua" 
   			  type="button" value="수정" onclick="cartUpdate(this.form)"> /
   			<input style="background-color: aqua" 
   			  type="button" value="삭제" onclick="cartDelete(this.form)">
   		</td>
   		<td>
   			<a href="javascript:productDetail('<%=productBean.getNo()%>')">상세보기</a>
   		</td>
   	</tr>
   </form>
   <%
	  }
   %>
   <tr>
   	<td colspan="5">
   	  <br>
   	  <b>총 결제 금액 : <%=totalPrice %>&nbsp;&nbsp;&nbsp;
   	  <a href="orderproc.jsp">[ 주문하기 ]</a>
   	  </b>
   	</td>
   </tr>
  <%
  }
  %>
</table>
<%@ include file="guest_bottom.jsp" %>

<form action="productdetail_g.jsp" name="detailFrm">
	<input type="hidden" name="no">
</form>
</body>
</html>






