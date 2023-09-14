<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DB.DBconnect" %>
<%@ page import="java.sql.*" %>
<% 
Connection conn = DBconnect.getConnection();
String sql = "select custno, custname, phone, address, to_char(joindate, 'yyyy-mm-dd') as joindate,"
		+ " case when grade = 'A' then 'VIP' when grade = 'B' then '일반' else '직원' end as grade,"
		+ " city from member_tbl_02"
		+ " where custno=?"
		+ " order by custno";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, request.getParameter("custno"));
ResultSet rs = ps.executeQuery();

int num = Integer.parseInt(request.getParameter("custno"));
%>		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	
	<section class="section">
	<h2>회원 조회 결과	</h2>
		<% if(rs.next()) { %>
		<table class = "table_style">
        <tr>
            <th>회원번호</th>
            <th>회원성명</th>
            <th>전화번호</th>
            <th>주소</th>
            <th>가입일자</th>
            <th>고객등급</th>
            <th>거주지역</th>
        </tr>
        
        <tr class="center">
        	<td><%=rs.getString("custno") %></td>
        	<td><%=rs.getString("custname") %></td>
        	<td><%=rs.getString("phone") %></td>
        	<td><%=rs.getString("address") %></td>
        	<td><%=rs.getString("joindate") %></td>
        	<td><%=rs.getString("grade") %></td>
        	<td><%=rs.getString("city") %></td>
        </tr>
        <tr class="center" >
        	<td colspan="7"><input type="button" value="다시조회" onclick="location.href='member_search.jsp'"></td>
        </tr>
        <%}else { %>
       		<p align="center">회원번호 <%=num %>의 검색결과가 없습니다.</p>
					<p align="center"><input type="button" value="다시조회" onclick="location.href='member_search.jsp'"></p>
        <%} %>
        
    </table>
    
	</section>
	
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>