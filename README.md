## 쇼핑몰 실제 화면
### 홈 화면   
![image](https://github.com/hwan06/shoppingmall/assets/114748934/1df2ef8b-ab8c-4258-8408-d90a851e9a17)   

---
### 회원등록 화면
![image](https://github.com/hwan06/shoppingmall/assets/114748934/fffaabdb-5e01-44f2-93f2-756cabe22351)   
#### 스크립틀릿에서 DB연결 및 SQL문을 실행하여 num에 값을 저장하여 회원번호칸을 자동으로 채워주는 코드
```java
<@% page import = "DB.DBConnect" %> <!-- DB connect -->
<%@ page import = "java.sql.*" %> <!-- SQL import -->
<%
	String sql = "select max(custno) from member_tbl_02";
	
	//DB 연결 기능을 객체변수 conn 에 저장 -> 1.DB 연결
	Connection conn = DBconnect.getConnection();
	
	// sql변수에 저장되어 있는 문장이 쿼리문이 됨 -> 2. DB 연결 후 쿼리문이 생성
	// PreparedStatement <- 쿼리문 형식으로 변환 해준다.
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	// 변수 pstmt에 저장되어 있는 SQL문을 실행하여 객체 변수 rs에 저장
	// 쿼리문 결과값을 받아온다.
	ResultSet rs = pstmt.executeQuery();
	
	// 기준이 되는 변수에 결과값이 저장되어 있는 경우 next()를 호출하여 마지막 값을 확인
	// 결과값이 없을 경우엔 실행 하지 않아도 됨.
	rs.next();
	
	int num = rs.getInt(1) + 1;
	
%>
```
### 회원등록 sql문
#### DB에 insert 문을 이용하여 회원정보를 저장하는코드
```java
<%
	// 오라클에 한글 입력시 깨지지 않음
	request.setCharacterEncoding("UTF-8");
	String sql = "insert into member_tbl_02 values(?, ?, ?, ?, ?, ?, ?)";
	Connection conn = DBconnect.getConnection();
	PreparedStatement ps = conn.prepareStatement(sql);
	
	// 웹 브라우저에서 불러오는 데이터는 문자열 형식으로 인식되므로, 
	// 숫자 데이터면 형변환 *Integer.parseInt() 메서드를 이용해야 한다.
	ps.setInt(1, Integer.parseInt(request.getParameter("custno")));
	ps.setString(2, request.getParameter("custname"));
	ps.setString(3, request.getParameter("phone"));
	ps.setString(4, request.getParameter("address"));
	ps.setString(5, request.getParameter("joindate"));
	ps.setString(6, request.getParameter("grade"));
	ps.setString(7, request.getParameter("city"));
	
	// 데이터베이스 질의문을 실행하여 데이터 변경 작업을 수행하고 그 결과를 알려주는 역할을 한다
	ps.executeUpdate();// 쿼리문을 실행하고, 순서대로 member_tbl_02에 기록
%>
```
---
### 회원목록조회/수정 화면
![image](https://github.com/hwan06/shoppingmall/assets/114748934/bf9befbc-9a20-444f-bdb0-624b16a2c962)    
#### select문을 이용하여 사용자의 모든 정보검색 결과를 rs에 저장한다.
```java
<%
	Connection conn = DBconnect.getConnection();
	String sql = "select custno, custname, phone, address, to_char(joindate, 'yyyy-mm-dd') as joindate,"
			+ " case when grade = 'A' then 'VIP' when grade = 'B' then '일반' else '직원' end as grade,"
			+ " city from member_tbl_02"
			+ " order by custno";
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
%>
```
#### 스크립틀릿을 안에서 while문을 이용하여 rs의 값을 모두 출력할 때까지 테이블에 데이터를 삽입해준다.
```java
<% while(rs.next()) { %>
        <tr class="center">
        	<td><%=rs.getString("custno") %></td>
        	<td><%=rs.getString("custname") %></td>
        	<td><%=rs.getString("phone") %></td>
        	<td><%=rs.getString("address") %></td>
        	<td><%=rs.getString("joindate") %></td>
        	<td><%=rs.getString("grade") %></td>
        	<td><%=rs.getString("city") %></td>
        </tr>
        <%} %>
```

---
### 회원조회 화면
![image](https://github.com/hwan06/shoppingmall/assets/114748934/3e86b777-03c4-4180-b8df-faaa58ceaaf5)    
#### 유효성 검사. 회원번호 입력칸이 비어있으면 포커스를 옮기고 경고창 띄우는 코드
```js
<script type="text/javascript">
	function check() {
		if(!document.data.custno.value) {
			data.custno.focus();
			alert("회원번호를 입력하세요.");
			return false;
		}
		return true;
	}
</script>
```
#### 조회 버튼을 누르면 member_search_list.jsp로 데이터가 넘어가서 아래의 쿼리문이 실행된다. num에는 조회를 한 회원번호를, rs에는 그 회원번호의 정보를 저장한다.

```java
<%
	int num = Integer.parseInt(request.getParameter("custno"));
	Connection conn = DBconnect.getConnection();
	String sql = "select custno, custname, phone, address, to_char(joindate, 'yyyy-mm-dd') as joindate,"
			+ " case when grade = 'A' then 'VIP' when grade='B' then '일반' else '직원' end as grade, city "
			+ " from member_tbl_02"
			+ " where custno = ?";
			

	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, request.getParameter("custno"));
	ResultSet rs = ps.executeQuery();
%>
```

---
### 회원조회 성공했을 경우의 화면
![image](https://github.com/hwan06/shoppingmall/assets/114748934/c18003a0-6aa3-4c51-a7f6-194dfe39cbce)     
#### if문을 활용하여 rs에 값있다면(조회된 값이 있다면) 테이블에 입력된 회원번호의 정보를 출력해준다.
```html
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
        <%} %>
```

### 회원조회 실패했을 경우의 화면
![image](https://github.com/hwan06/shoppingmall/assets/114748934/f267803e-5c2b-4505-82b3-2eab932b74a9)    
#### rs에 값이 없다면 위에서 저장해둔 num을 이용하여 "회원번호 <%=num %>의 검색결과가 없습니다."를 출력해준다.
```java
<%else { %>
	<p align="center">회원번호 <%=num %>의 검색결과가 없습니다.</p>
	<p align="center"><input type="button" value="다시조회" onclick="location.href='member_search.jsp'"></p>
        <%} %>
```

