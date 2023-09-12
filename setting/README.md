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
## join.jsp, join_p.jsp, memberlist.jsp에서 주요코드
스크립틀릿에서 DB연결 및 SQL문을 실행하여 num에 값 불러오기
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
