package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/leeson01/quiz08")
public class GetMethodQuiz08 extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		List<String> list = new ArrayList<>(Arrays.asList(
		        "강남역 최고 맛집 소개 합니다.", 
		        "오늘 기분 좋은 일이 있었네요.", 
		        "역시 맛집 데이트가 제일 좋네요.", 
		        "집에 가는 길에 동네 맛집 가서 안주 사갑니다.",
		        "자축 저 오늘 생일 이에요."));
		
		String search = request.getParameter("search");
		
		PrintWriter out = response.getWriter();
		
		out.print("<html><head><title>검색</title></head><body>");
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).contains(search)) {
				// 1)
				out.print(list.get(i).replace(search, "<b>" + search + "</b>" ) + "<br>");
				// 2)
//				String text = list.get(i);
//				String[] words = text.split(search);
//				out.print(words[0] + "<b>" + search + "</b>" + words[1] + "<br>");
				
			}
		}
		out.print("</body></html>");
	}
}
