## 쇼핑몰 project 환경 세팅
1. encoding - UTF-8 세팅 (page 기본 인코딩 설정)
2. Tomcat 연결
3. Oracle 연결
4. (ojdbc6.jar import)    
![image](https://github.com/hwan06/shoppingmall/assets/114748934/3a3ac7d2-d9cc-49bd-af1f-c6a5419ffb96)
---

### 테이블 생성하고 데이터 삽입하기 [전체코드](https://github.com/hwan06/shoppingmall/blob/main/setting/Oracle.sql)
``` sql
DROP TABLE member_tbl_02;
CREATE TABLE member_tbl_02(
	custno number(6) primary key,
	custname varchar2(20),
	phone varchar2(13),
	address varchar2(60),
	joindate date,
	grade char(2),
	city char(2)
);
INSERT INTO MEMBER_TBL_02 VALUES(100001, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');
INSERT INTO MEMBER_TBL_02 VALUES(100002, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01');
INSERT INTO MEMBER_TBL_02 VALUES(100003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151001', 'C', '30');
INSERT INTO MEMBER_TBL_02 VALUES(100004, '최사랑', '010-1111-5555', '울릉군 울릉웁 독도2리', '20151113', 'A', '30');
INSERT INTO MEMBER_TBL_02 VALUES(100005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60');
INSERT INTO MEMBER_TBL_02 VALUES(100006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60');
```
---
### index.jsp, layout(header, nav, section, footer), css(style) 파일 생성 (기본적인 쇼핑몰 홈화면)
![image](https://github.com/hwan06/shoppingmall/assets/114748934/17eda7bd-05c0-4953-9dff-a58bcb7333c5)   
[index](https://github.com/hwan06/shoppingmall/blob/main/src/main/webapp/index.jsp),
[header](https://github.com/hwan06/shoppingmall/blob/main/src/main/webapp/layout/header.jsp),
[nav](https://github.com/hwan06/shoppingmall/blob/main/src/main/webapp/layout/nav.jsp),
[section](https://github.com/hwan06/shoppingmall/blob/main/src/main/webapp/layout/section.jsp),
[footer](https://github.com/hwan06/shoppingmall/blob/main/src/main/webapp/layout/footer.jsp),
[css](https://github.com/hwan06/shoppingmall/blob/main/src/main/webapp/css/style.css)   

---
### DB연결 클래스파일 생성 후, DB연결하기
![image](https://github.com/hwan06/shoppingmall/assets/114748934/735f0509-9b84-43d5-a73c-9d95e1c0f164)   
[DB연결코드](https://github.com/hwan06/shoppingmall/blob/main/src/main/java/DB/DBconnect.java)

---
### join.jsp, join_p.jsp, memberlist.jsp 생성
![image](https://github.com/hwan06/shoppingmall/assets/114748934/24d6d808-c94f-48f9-b95e-f5187b6f50f0)   
[join](https://github.com/hwan06/shoppingmall/blob/main/src/main/webapp/join.jsp),
[join_p](https://github.com/hwan06/shoppingmall/blob/main/src/main/webapp/join_p.jsp),
[memberlist](https://github.com/hwan06/shoppingmall/blob/main/src/main/webapp/memberlist.jsp)
---
## join.jsp의 주요코드
스크립틀릿에서 DB연결 및 SQL문을 실행하여 num에 값을 불러오는 코드
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
---
## join_p.jsp의 주요코드
DB에 insert 문을 이용하여 회원정보를 저장하는코드
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
## memberlist.jsp의 주요코드
select문을 이용하여 사용자의 모든 정보와 문제에 기재되어 있는 형식에 따라 데이터 출력하는 코드
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
스크립틀릿을 이용하여 while문을 사용한다. rs에 값이 있는동안 테이블에 데이터 삽입
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
