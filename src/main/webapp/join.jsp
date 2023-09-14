<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DB.DBconnect" %>
<%@ page import = "java.sql.*" %>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="css/style.css"></head> 
<script type="text/javascript">
	function check() {
		if(!document.data.custname.value) {
			data.custname.focus();
			alert("회원성명을 입력하세요.");
			return false;
		}else if(!document.data.phone.value) {
			data.phone.focus();
			alert("전화번호를 입력하세요.");
			return false;
		}else if(!document.data.address.value) {
			data.address.focus();
			alert("주소를 입력하세요.");
			return false;
		}else if(!document.data.joindate.value) {
			data.joindate.focus();
			alert("가입날짜를 입력해주세요.");
			return false;
		}else if(!document.data.grade.value) {
			data.grade.focus();
			alert("등급을 입력해주세요.");
			return false;
		}else if(!document.data.city.value) {
			data.city.focus();
			alert("도시코드를 입력해주세요.");
			return false;
		}else {
			return true;
		}
	}
</script>
</head>
<body>

<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	
	<section class = "section">
			<form name="data" action="join_p.jsp" method="post" onsubmit="return check()">
				<h2>회원가입</h2>
				<table class = "table_style">
					<tr>
						<th>회원번호(자동발생)</th>
						<td><input type="text" name="custno" value="<%=num%>" readonly></td> 
					</tr>
					
					<tr>
						<th>회원성명</th>
						<td><input type="text" name="custname" value=""></td>
					</tr>
					
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="phone" value=""></td>
					</tr>
					
					<tr>
						<th>회원주소</th>
						<td><input type="text" name="address" value=""></td>
					</tr>
					
					<tr>
						<th>가입일자</th>
						<td><input type="text" name="joindate" value=""></td>
					</tr>
					
					<tr>
						<th>고객등급[A:VIP, B:일반, C:직원]</th>
						<td><input type="text" name="grade" value=""></td>
					</tr>
					
					<tr>
						<th>도시코드</th>
						<td><input type="text" name="city" value=""></td>
					</tr>
					
					<tr>
						<th colspan="2">
						<input type="submit" value="등록">
						<input type="button" onclick="location.href = 'join.jsp'" value="취소"></th>
																		<!-- location.href <- 현재 브라우저에 연결페이지 로딩 --> 
					</tr>
				
				
				</table>

			</form>
	</section>
	
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>