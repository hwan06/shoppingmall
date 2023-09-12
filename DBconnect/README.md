### DB연결 클래스파일 생성
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
