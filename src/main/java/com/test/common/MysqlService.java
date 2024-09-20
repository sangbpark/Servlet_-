package com.test.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlService {
	private static MysqlService mysqlService = null;
	
	// 상수 메모리에 저장되어서 변하지 않는 값
	private static final String URL= "jdbc:mysql://localhost:3306/test_240627";
	private static final String ID = "root";
	private static final String PASSWORD = "root";
	
	private Connection conn;
	private Statement statement;
	private ResultSet res;
	
	// Singleton(싱글톤) 패턴: MysqlService라는 객체가 단 하나만 생성되도록 하는 디자인패턴
	public static MysqlService getInstance() {
		if (mysqlService == null) {
			mysqlService = new MysqlService();
		}
		return mysqlService;
	};
	
	// DB connect
	public void connect() {
		try {
			// 1. 드라이버 메모리에 로딩 잘못은 여기서 나오니 여기서 예외처리
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			
			// 2. DB 연결(connection)
			conn = DriverManager.getConnection(URL, ID, PASSWORD);
			
			// 3. statement: DB와 연결해서 쿼리를 실행하기 위한 준비
			statement = conn.createStatement(); 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		
	};
	
	// DB disconnect
	public void disconnect() {
		try {
			statement.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
	};
	// R 서블릿 쿼리가 잘못 된 거기 때문에 예외처리를 넘긴다.
	public ResultSet select(String query) throws SQLException {
		res = statement.executeQuery(query);
		return res;
	};
	// CUD
	public void update(String query) throws SQLException {
		statement.executeUpdate(query);
	}
}
