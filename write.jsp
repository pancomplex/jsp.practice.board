<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp"%>
<h1 class="write_title">글쓰기</h1>
	<form method="post" action="insert_board_action.jsp" class="form">
	<table class="tdLeft">
		<col style="width:150px;"></col>
		<tbody>
			<tr>
				<th>name</th>
				<td><input type="text" name="userName"></td>
			</tr>
			<tr>
				<th>email</th>
				<td><input type="email" name="userEmail"></td>
			</tr>
			<tr>
				<th>subject</th>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<th>password</th>
				<td><input type="password" name="userPw"></td>
			</tr>
			<tr>
				<th>contents</th>
				<td><textarea name="contents"></textarea></td>
			</tr>
		</tbody>
	</table>
	<div class="btns center" style="margin:20px auto 40px;">
			<input type="submit" value="확인">
			<input type="button" value="취소" onclick="goBoard()">
		</div>
	</form>
	<script>
	const goBoard = function(){location.href = "board.jsp";}
	</script>
<%@ include file="./include/footer.jsp"%>