<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("idKey");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById("btnLogin").addEventListener("click", funcLogin, false);
		document.getElementById("btnNewMember").addEventListener("click", funcNewmember, false);
	}
	
	function funcLogin() {
		if(loginForm.id.value === "") {
			alert("아이디를 입력해주세요.");
			loginForm.id.focus();
		} else if (loginForm.passwd.value === "") {
			alert("비밀번호를 입력해주세요.");
			loginForm.passwd.focus();
		} else {
			loginForm.action = "loginproc.jsp";
			loginForm.method = "post";
			loginForm.submit();
		}
	}
	
	function funcNewmember() {
		location.href = "register.jsp";
	}
</script>
</head>
<body>
<%
	if(id != null) {
%>
		<b><%=id %></b>님 환영합니다.<p/>
		준비된 기능을 사용할 수 있습니다.<br>
		<a href="logout.jsp">로그아웃</a>
<%
	} else {
%>
		<form name="loginForm">
			<table>
				<tr>
					<td colspan="2" style="text-align: center;">* 로그인 *</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" name="passwd"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="button" value="로그인" id="btnLogin">
						<input type="button" value="회원가입" id="btnNewMember">
					</td>
				</tr>
			</table>
		</form>
<%
	}
%>
</body>
</html>