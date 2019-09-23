<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="cartMgr" class="shop.order.CartMgr" scope="session" />
<jsp:useBean id="order" class="shop.order.OrderBean" />
<jsp:setProperty property="*" name="order" />

<%
String flag = request.getParameter("flag");       //구매목록보기,수정,삭제 판단용
String id = (String)session.getAttribute("idKey");
//out.print(order.getProduct_no() + " 주문수 : " + order.getQuantity() + " " + id);

if(id == null){
	response.sendRedirect("login.jsp");
}else{
	if(flag == null) {  //Cart에 주문상품 담기
		order.setId(id);
		cartMgr.addCart(order);
%>
		<script>
		alert("장바구니에 담았어요");
		location.href = "cartlist.jsp";
		</script>
<%
	}else if(flag.equals("update")) {  //Cart 수정
		order.setId(id);
		cartMgr.updateCart(order);
%>
		<script>
		alert("장바구니 내용을 수정했어요");
		location.href = "cartlist.jsp";
		</script>
<%
	}else if(flag.equals("del")) {  //Cart 삭제
		cartMgr.deleteCart(order);
%>
		<script>
		alert("해당 상품의 주문을 삭제했어요");
		location.href = "cartlist.jsp";
		</script>
<%
	}
}
%>


