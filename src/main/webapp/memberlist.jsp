<%@ page import = "DB.DBconnect" %>
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
        Connection conn = DBconnect.getConnection();
        String sql = "select custno, custname, phone, address, to_char(joindate, 'yyyy-mm-dd') as joindate,"
                    + "case when grade = 'A' then 'VIP' when grade = 'B' then '일반' else '직원' end as grade,"
                    + "city from member_tbl_02"
                    + " order by custno";
        
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
<link rel = "stylesheet" href = "css/style.css">
</head>
<body>
<header>
    <jsp:include page = "layout/header.jsp"></jsp:include>
</header>

<nav>
    <jsp:include page = "layout/nav.jsp"></jsp:include>

</nav>
<section class = "section">
    <h2> 회원목록조회/수정 </h2>
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
        
        <% while(rs.next()){ %>
        <tr class = "center">
            <td><%= rs.getString("custno") %></td>
            <td><%= rs.getString("custname") %></td>
            <td><%= rs.getString("phone") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("joindate") %></td>
            <td><%= rs.getString("grade") %></td>
            <td><%= rs.getString("city") %></td>
        </tr> <% } %>
        
    </table>
</section>

<footer>
    <jsp:include page = "layout/footer.jsp"></jsp:include>
</footer>
</body>
</html></html>