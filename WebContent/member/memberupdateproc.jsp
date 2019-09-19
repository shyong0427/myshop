<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");	
%>

<jsp:useBean id="mbean" class="shop.member.MemberBean"/>
<jsp:setProperty property="*" name="mbean"/>
<jsp:useBean id="memberMgr" class="shop.member.MemberMgr"/>

<%
	String id = (String)session.getAttribute("idKey");
//	String id = mbean.getId(); update페이지에서 id를 hidden으로 받아올 때 사용한다.

	boolean b = memberMgr.memberUpdate(mbean, id);

	if(b) {
%>
<script>
	alert("수정에 성공하였습니다.");
	location.href="../guest/guest_index.jsp";
</script>
<%  } else { %>
<script>
	alert("수정에 실패하였습니다.\n관리자에세 문의하세요.");
	history.back();	
</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>