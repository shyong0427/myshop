<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	session.removeAttribute("adminKey");
%>
	<script type="text/javascript">
		alert("관리자에서 로그아웃 하였습니다.");
		location.href = "../index.jsp";
	</script>
</body>
</html>