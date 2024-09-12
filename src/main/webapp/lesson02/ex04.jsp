<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제어문 사용</title>
</head>
<body>
	<%
		// Map을 테이블로 표현하기
		// {"korean"=85, "english"=72, "math"=90, "science"=100}
		Map<String,Integer> score = new HashMap<String,Integer>();
		
		score.put("korean", 85);
		score.put("english", 72);
		score.put("math", 90);
		score.put("science", 100);
		
	%>
	
	<table border="1">
	<%
		Iterator<String> iter = score.keySet().iterator();
		while(iter.hasNext()) {
			String key = iter.next();
		
	%>
		<tr>
			<th>
				<%
					if (key.equals("korean")) {
						out.print("국어");
					} else if (key.equals("english")) {
						out.print("영어");
					} else if (key.equals("math")) {
						out.print("수학");
					} else if (key.equals("science")) {
						out.print("과학");
					}
				%>
			</th>
			<td><%= score.get(key) %></td>
		</tr>
	<% 
		}
	%>
	</table>
</body>
</html>