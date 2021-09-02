<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "test_user";
String password = "1234";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

int no = Integer.parseInt(request.getParameter("no"));
%>

<%@ include file="./include/header.jsp"%>
<h1 class="write_title">글 보기</h1>
<div class="form">
	<table class="tdLeft">
		<col style="width: 150px;"></col>
		<tbody>
			<%
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url, id, password);
				String sql = "SELECT * FROM BOARD WHERE NO = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<tr>
				<th>name</th>
				<td><%=rs.getString("name")%></td>
			</tr>
			<tr>
				<th>email</th>
				<td><%=rs.getString("email")%></td>
			</tr>
			<tr>
				<th>subject</th>
				<td><%=rs.getString("subject")%></td>
			</tr>			
			<tr>
				<th>contents</th>
				<td><p style="min-height: 250px"><%=rs.getString("contents")%>
					<p></td>
			</tr>
			<%
			}
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</tbody>
	</table>
	<div class="btns center" style="margin: 20px auto 40px;">
		<a>수정</a>
		<a>삭제</a>
	</div>
</div>

<%@ include file="./include/footer.jsp"%>