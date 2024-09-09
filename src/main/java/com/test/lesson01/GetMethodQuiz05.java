package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz05")
public class GetMethodQuiz05 extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		int n = Integer.parseInt(request.getParameter("number"));
		
		out.print("<html><head><title>" + n +"단</title></head><body>");
		out.print("<ul>");
		for (int i = 1; i < 10; i++) {
			out.println("<li>" + n + " X " + i + " = " + (n * i) + "</li>");
		}
		out.print("</ul>");
		out.print("</body></html>");
	}
}
