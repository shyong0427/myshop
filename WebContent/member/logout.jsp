<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//	session.invalidate();	// delete all of client session
	session.removeAttribute("idKey");
%>
<script type="text/javascript">
	alert("로그아웃 하셨습니다.")
	location.href = "../guest/guest_index.jsp";
</script>
</body>
</html>