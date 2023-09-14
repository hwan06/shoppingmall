<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
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

</head>
<body>
	<header>
			<jsp:include page="layout/header.jsp"></jsp:include>
		</header>
		
		<nav>
			<jsp:include page="layout/nav.jsp"></jsp:include>
		</nav>
		
		<section class="section">
			<form name="data" method="post" action="member_search_list.jsp"onsubmit="return check()">
				<h2>회원조회</h2>
				<table class="table_style">
					<tr>
						<th>회원번호</th>
						<td><input type="text" name="custno"></td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="submit" value="조회">
							<input type="button" onclick="location.href = 'memberlist.jsp'" value="취소">
						</th>
					</tr>
				</table>
			</form>
			
		</section>
		
		<footer>
			<jsp:include page="layout/footer.jsp"></jsp:include>
		</footer>
</body>
</html>