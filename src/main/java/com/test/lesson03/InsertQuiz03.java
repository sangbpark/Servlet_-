package com.test.lesson03;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson03/insert_quiz03")
public class InsertQuiz03 extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String nickname = request.getParameter("nickname");
		String title = request.getParameter("title");
		int price = Integer.parseInt(request.getParameter("price"));
		String description = request.getParameter("description");
		String pictureUrl = request.getParameter("pictureUrl");
		
		MysqlService ms = MysqlService.getInstance();
		ms.connect();
		
		String selectQuery = "select * from `seller`"
				+ "where `nickname` = \"" + nickname + "\""  ;
		int sellerId = 0;
		try {
			ResultSet res = ms.select(selectQuery);
			while ( res.next() ) {
				sellerId = res.getInt("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String insertQuery = "";
		
		if (pictureUrl.equals("")) {
			insertQuery = "insert into `used_goods`"
					+ "(`sellerId`, `title`, `description`, `price`)"
					+ "values"
					+ "(" + sellerId + ", '" + title + "', '"+ description + "'," + price +  ")";
		} else {
			insertQuery = "insert into `used_goods`"
					+ "(`sellerId`, `title`, `description`, `price`, `pictureUrl`)"
					+ "values"
					+ "(" + sellerId + ", '" + title + "', '"+ description + "'," + price +  ",'" + pictureUrl + "')";
		}
		
		try {
			ms.update(insertQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ms.disconnect();
		
		response.sendRedirect("/lesson03/quiz03.jsp");
	}
}
