<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp"%>

<%
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "test_user";
	String password = "1234";
	
	Connection  conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<main>
<h1 class="list_title">글목록</h2>
	<div id="contents">
		
		<div class="form">
			<table border="1">
				<cols>
					<col style="width: 100px">
					<col style="width: 580px">
					<col style="width: 120px">
					
				</cols>
				<thead>
					<tr>
						<th>NO</th>
						<th>제목</th>
						<th>이름</th>
						
					</tr>
				</thead>
				<tbody>
					<%
						String sql = "SELECT * FROM BOARD ORDER BY NO DESC";
						try{
							Class.forName(driver);
							conn = DriverManager.getConnection(url,id,password);
							pstmt = conn.prepareStatement(sql);
							rs = pstmt.executeQuery();
							while(rs.next()) {
								out.print("<tr>");
								out.print("<td>"+rs.getString("no")+"</td>");
								out.print("<td class='left'><a href='view.jsp?no="+rs.getString("no")+"'>"+rs.getString("subject")+"</a></td>");
								out.print("<td><a href='member_info.jsp?name="+rs.getString("name")+"'>"+rs.getString("name")+"</a></td>");
								
								out.print("</tr>");
							}
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							try {
								if(rs!=null) rs.close();
								if(pstmt!=null) pstmt.close();
								if(conn!=null) conn.close();
							} catch(Exception e2) {
								e2.printStackTrace();
							}
						}
					%>
				</tbody>
			</table>
			<div class="btns center" style="margin:20px auto 40px;">
			
			<input type="button" value="글쓰기" onclick="goWrite()")>
		</div>
		</div>
	</div>
</main>
<script>
const goWrite = function (){location.href = "write.jsp";}
</script>
<%@ include file="./include/footer.jsp"%>





