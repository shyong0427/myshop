<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="memberMgr" class="shop.member.MemberMgr" />

<%
	String adminid = request.getParameter("adminid");
	String adminpasswd = request.getParameter("adminpasswd");
	
	boolean b = memberMgr.adminloginCheck(adminid, adminpasswd);
	
	if(b) {
		session.setAttribute("adminKey", adminid);	// 관리자 세션 설정
		response.sendRedirect("admin_index.jsp");
	} else {
%>
<script>
	alert("관리자 입력자료가 일치하지 않습니다.");
	location.href = "adminlogin.jsp";
</script>
<%
	}
%>