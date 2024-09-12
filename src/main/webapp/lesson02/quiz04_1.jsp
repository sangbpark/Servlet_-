<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길이 변환 결과</title>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>

	<%
		int cm = Integer.parseInt( request.getParameter("cm"));
		String[] length = request.getParameterValues("length");
		String result = "";
		if (length != null) {
			for (String temp : length) {
				if (temp.equals("in")) {
					result += cm / 2.54 + " in,";
				} else if (temp.equals("yd")) {
					result += cm / 91.44 + " yd,";
				} else if (temp.equals("ft")) {
					result += cm / 30.48 + " ft,";
				} else if (temp.equals("m")){
					result += cm / 100.0 + " m,";
				}
			}
			
			result = result.substring(0, result.length() - 1);
		}
		String[] realResult = result.split(",");
	%>
	<div class="container">
		<h1>길이 변환 결과</h1>
		<h3><%= cm %>cm</h3>
		<hr>
		<h3>
		<% 
			for (String temp : realResult) {
				out.println(temp + "<br>");
			}
		%>
		</h3>
	</div>

</body>
</html>