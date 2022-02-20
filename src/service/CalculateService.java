package service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.Calculation;
import model.User;

public class CalculateService extends Service{
	public void addCalculation(Calculation c) throws SQLException{
		Connection con = getConnection();
		Statement stmt = con.createStatement();
		String sql = "insert into calculations('input1','input2','operator','result','notes','sequence','userid')values(" + c.getInput1() + "," + c.getInput2()
		+ ",'" + c.getOperator() + "'," + c.getResult() + ",'" + c.getNotes() + "'," + c.getSequence() + ",'" + c.getUserid() + "')";
		stmt.executeUpdate(sql);
		
		
	}
	public int getsequence(User user) throws SQLException{
		Connection con = getConnection();
		Statement stmt = con.createStatement();
		String sql = "select max(sequence) +1 from calculation where userID = '" + user.getUserName() + "'";
		ResultSet result = stmt.executeQuery(sql);
		if (result.next()) {
			int nextSequence = result.getInt(0);
			if(result.wasNull()) {
				return 1;//previously this user has no calculation
			}else {
				return nextSequence;	
			}
		} else {
			throw new SQLException();
		}
	}
	
	public static double sum(String s1, String s2, User user) {
		try {
			double d1 = Double.parseDouble(s1);
			double d2 = Double.parseDouble(s2);
			double sum = d1+d2;
			Calculation c = new Calculation();
			c.setInput1(d1);
			c.setInput2(d2);
			c.setOperator("+");
			c.setNotes(null);
			c.setResult(sum);
			int temp = getSequence(user);
			
			addCalculation(c);
			return sum;
		}catch(Throwable e){
			throw new RuntimeException("invalid input"+s1+","+s2);
		}
		
	}
	public static double difference(String s1, String s2) {
		try {
			double d1 = Double.parseDouble(s1);
			double d2 = Double.parseDouble(s2);
			double diff = d1-d2;
			return diff;
		}catch(Throwable e){
			throw new RuntimeException("invalid input"+s1+","+s2);
		}
		
	}
	public static double product(String s1, String s2) {
		try {
			double d1 = Double.parseDouble(s1);
			double d2 = Double.parseDouble(s2);
			double prod = d1*d2;
			return prod;
		}catch(Throwable e){
			throw new RuntimeException("invalid input"+s1+","+s2);
		}
		
	}
	public static double dividend(String s1, String s2) {
		try {
			double d1 = Double.parseDouble(s1);
			double d2 = Double.parseDouble(s2);
			double div = d1/d2;
			return div;
		}catch(Throwable e){
			throw new RuntimeException("invalid input"+s1+","+s2);
		}
		
	}
}
