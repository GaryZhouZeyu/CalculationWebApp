package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Service {
	public static String DB_URL = "jdbc:mysql://localhost:3306/calculator?characterEncoding=utf8";
	public static String DB_PASSWORD = "aA010318";
	
	public static Connection getConnection() throws SQLException
	{
		try {
			 Connection conn = null;
			 Statement stmt = null;
			 //STEP 2: Register JDBC driver
			 Class.forName("com.mysql.jdbc.Driver");
			 
			 conn = DriverManager.getConnection(DB_URL,"root",DB_PASSWORD);
			 System.out.println("Connected to database");
			 return conn;
		} catch (ClassNotFoundException cnfe) {
			throw new SQLException(cnfe.getMessage());
		}
	}

}
