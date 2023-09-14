package DB;
import java.sql.*;

public class DBconnect {

	public static Connection getConnection() {
		
		Connection conn = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "system";
		String pw = "1234";

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