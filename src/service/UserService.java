package service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.User;
public class UserService extends Service{
	public static User loginUser (String userID, String password) throws SQLException{
		Connection con = getConnection();
		Statement stmt = con.createStatement();
	    String sql;
	    sql = "SELECT userID from user where userID = '" + userID + "' and password = '" + password + "'";
	    System.out.println(sql);
	    ResultSet rs = stmt.executeQuery(sql);
	    if(rs.next()) {
	    	User user = new User(rs.getString(1));
	    	return user;
	    }else{
	    	return null;
	    }
	}
}
