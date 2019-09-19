<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
<br>
<%@ include file="admin_top.jsp" %>
	<form action="productproc.jsp?flag=insert" method="post" enctype="multipart/form-data">
		<table style="width: 90%">
			<tr>
				<td colspan="2" style="text-align: center;">* 상품 등록 *</td>
			</tr>
			<tr>
				<td>상품명 : </td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>가   격 : </td>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<td>설   명 : </td>
				<td><textarea rows="5" cols="60" name="detail"></textarea></td>
			</tr>
			<tr>
				<td>재고량 : </td>
				<td><input type="text" name="stock"></td>
			</tr>
			<tr>
				<td>이미지 : </td>
				<td><input type="file" name="image" size="30"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="상품등록">
					<input type="reset" value="새로입력">
				</td>
			</tr>
		</table>
	</form>
<%@ include file="admin_bottom.jsp" %>
</body>
</html>