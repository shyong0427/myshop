<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="cartMgr" class="shop.order.CartMgr" scope="session"/>
<jsp:useBean id="order" class="shop.order.OrderBean"/>
<jsp:setProperty property="*" name="order"/>

<%
	String flag = request.getParameter("flag");	// 구매목록 보기, 수정, 삭제 판단용 변수
	String id = (String)session.getAttribute("idKey");
%>