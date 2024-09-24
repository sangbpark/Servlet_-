<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍당무 마켓</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<style>
header { height:100px; background-color:#ff7f00;}
footer {height:150px;}
#nav {height:100px; background-color:#ff7f00;}
.contents {min-height:500px;}
.contents > .item { width:300px; height:250px; border: 1px solid #ff7f00 }
.contents > .item:hover { background-color:#ff7f00; }
.contents > .ditem { width:300px; height:250px;}
.contents .itemimg { width:290px; height:150px;}
.contents .nickname {color:#ff7f00;}
</style>
</head>
<body>
<%
	MysqlService ms = MysqlService.getInstance();
	ms.connect();
	
	String selectQuery = "select `seller`.* , `used_goods`.*"
			+ "from `seller`"
			+ "join `used_goods`"
			+ "on `seller`.id = `used_goods`.sellerId "
			+ "order by `seller`.id desc;";
			
	ResultSet res = ms.select(selectQuery);
%>
	<div id="wrap" class="container">
		<header class="d-flex justify-content-center align-items-center">
			<div class="logo display-4 "><a href="#" class="text-white text-decoration-none"><b>HONG당무 마켓</b></a></div>
		</header>
		<nav id="nav" class="d-flex align-items-center">
			<ul class="nav nav-fill w-100 ">
				<li class="nav-item"><a href="#" class="nav-link text-white">리스트</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white">물건 올리기</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white">마이 페이지</a></li>
			</ul>
		</nav>
		<section class="contents d-flex flex-wrap justify-content-between mt-3">
			<%
				int count = 0;
				while (res.next()) {
			%>
			<div class="item mb-3 p-2">	
				<div class="itemimg"><img src="" alt="상품이미지" width="290px" height="150px"></div>
				<div>
					<div><b><%= res.getString("title") %></b></div>
					<div class="text-secondary"><%= res.getInt("price") %>원</div>
					<div class="nickname"><%= res.getString("nickname") %></div>
				</div>		
			</div>
			<%
				count++; 
				}
				if (count % 3 != 0) {
			%>
					<div class="ditem"></div>
			<%		
				} 
			%>
		</section>
		<footer class="d-flex justify-content-center align-items-center"><small>Copyright © marondal 2021</small></footer>
	</div>
<%
	ms.disconnect();
%>
</body>
</html>