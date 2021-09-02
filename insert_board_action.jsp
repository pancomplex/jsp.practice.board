<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html; carset=utf-8;");
String userName = request.getParameter("userName");
String email = request.getParameter("userEmail");
String subject = request.getParameter("subject");
String userPw = request.getParameter("userPw");
String contents = request.getParameter("contents");

String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "test_user";
String password = "1234";

Connection conn = null;
PreparedStatement pstmt = null;

String sql = "INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL,?,?,?,?,?)";
try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, id, password);
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userName);
	pstmt.setString(2, email);
	pstmt.setString(3, subject);
	pstmt.setString(4, userPw);
	pstmt.setString(5, contents);
	int result = pstmt.executeUpdate();
	if (result > 0) {
%>
<script>
	alert("글이 작성되었습니다.");
	location.href = "board.jsp";
</script>
<%
} else {
%>
<script>
	alert("글작성에 실패하였습니다.");
	history.back();
</script>
<%
}
} catch (Exception e) {
e.printStackTrace();
} finally {
try {
if (pstmt != null)
	pstmt.close();
if (conn != null)
	conn.close();
} catch (Exception e2) {
e2.printStackTrace();
}
}
%>