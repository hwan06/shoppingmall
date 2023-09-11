<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DB.DBconnect"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = DBconnect.getConnection();
	String sql = "insert into	member_tbl_02(custno, custname, phone, address, joindate, grade, city)"
			+ " values(?, ?, ?, ?, ?, ?, ?)";
	
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setInt(1, Integer.parseInt(request.getParameter("custno")));
	ps.setString(2, request.getParameter("custname"));
	ps.setString(3, request.getParameter("phone"));
	ps.setString(4, request.getParameter("address"));
	ps.setString(5, request.getParameter("joindate"));
	ps.setString(6, request.getParameter("grade"));
	ps.setString(7, request.getParameter("city"));
	
	ps.executeQuery();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>