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
### index.jsp, join.jsp, join_p.jsp, memberlist.jsp, layout(header, nav, section, footer), css(style) 생성
![image](https://github.com/hwan06/shoppingmall/assets/114748934/f258c5e2-5132-4ad8-a358-8cc17c61473c)
---

### DB연결 클래스파일 생성 후, DB연결하기
![image](https://github.com/hwan06/shoppingmall/assets/114748934/735f0509-9b84-43d5-a73c-9d95e1c0f164)

---
### DB연결 코드 
``` java
package DB;
import java.sql.*;

public class DBconnect {

	public static Connection getConnection() {
		
		Connection conn = null; // Connection(연결객체) 변수 conn 선언
		String url = "jdbc:oracle:thin:@localhost:1521:xe"; // 연결 드라이버 주소
		String id = "system"; // 계정 아이디
		String pw = "1234"; // 계정 비번

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			System.out.println("DB접속성공");

		}catch(Exception e) {
			System.out.println("DB접속실패");
			e.printStackTrace();
		}
		
		return conn;
	}		

}
```
