<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="cartMgr" class="shop.order.CartMgr" scope="session"/>
<jsp:useBean id="order" class="shop.order.OrderBean"/>
<jsp:setProperty property="*" name="order"/>

<%
	String flag = request.getParameter("flag");	// 구매목록 보기, 수정, 삭제 판단용 변수
	String id = (String)session.getAttribute("idKey");
//	out.print(order.getProduct_no() + " 주문량  : " + order.getQuantity() + " " + id);
	if(id == null) {
		response.sendRedirect("../member/login.jsp");
	} else {
		if(flag == null) {	// Cart에 주문상품 담기 
			order.setId("id");
			cartMgr.addCart(order);
%>
<script>
	alert("장바구니 담기에 성공하였습니다.");
	location.href = "cartlist.jsp";
</script>
<%
		} else if(flag.equals("update")) {	// Cart 수정
			order.setId(id);
			cartMgr.udpateCart(order);
%>
<script>
	alert("장바구니 내용을 수정했습니다.");
	location.href = "cartlist.jsp";
</script>
<%
		} else if(flag.equals("del")) {	// Cart 삭제
			cartMgr.deleteCart(order);
%>
<script>
	alert("해당 상품의 주문을 삭제했습니다.");
	location.href = "cartlist.jsp";
</script>
<%
		}
	}
%>