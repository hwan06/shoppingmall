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

---
### 회원목록조회/수정 화면
![image](https://github.com/hwan06/shoppingmall/assets/114748934/bf9befbc-9a20-444f-bdb0-624b16a2c962)   
### 회원조회 화면
![image](https://github.com/hwan06/shoppingmall/assets/114748934/3e86b777-03c4-4180-b8df-faaa58ceaaf5)
### 회원조회 성공했을 경우의 화면
![image](https://github.com/hwan06/shoppingmall/assets/114748934/c18003a0-6aa3-4c51-a7f6-194dfe39cbce)   
### 회원조회 실패했을 경우의 화면
![image](https://github.com/hwan06/shoppingmall/assets/114748934/f267803e-5c2b-4505-82b3-2eab932b74a9)

