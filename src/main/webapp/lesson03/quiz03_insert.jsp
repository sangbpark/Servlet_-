<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>홍당무 마켓</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link rel="stylesheet" href="quiz01-style.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
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
				<li class="nav-item"><a href="/lesson03/quiz03_insert.jsp" class="nav-link text-white">물건 올리기</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white">마이 페이지</a></li>
			</ul>
		</nav>
		<section class="contents mt-3 p-5">
			<div>
				<div class="display-4 my-3">물건 올리기</div>
				<form method="post" action="/lesson03/insert_quiz03" id="form">
					<div class="d-flex justify-content-around mt-5">
						<div class="col-3">
						<select class="custom-select" id="nickname" name="nickname">
							<option class="bg-secondary text-white" value="">-아이디 선택-</option>
						<%
							while (res.next()) {
						%>
							<option class="bg-secondary text-white"><%= res.getString("nickname") %></option>
						<% 
							}
						%>
						</select>
						</div>
						<div class="col-6">
						<input type="text" class="form-control" placeholder="제목" id="title" name="title">
						</div>
						<div class="input-group col-3">
						  <input type="text" class="form-control" placeholder="가격" id="price" name="price" >
						  <div class="input-group-append">
						    <span class="input-group-text" id="basic-addon2">원</span>
						  </div>
						</div>
					</div>
					<div class="my-3">
						<textarea name="description" id="description" rows="5" cols="110"></textarea>
					</div>
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text">이미지 url</span>
					  </div>
					  <input type="text" class="form-control" id="pictureUrl" name="pictureUrl">
					</div>
					<input type="submit" id="submit" class="btn btn-light btn-block" value="저장">
				</form>
			</div>
		</section>
		<footer class="d-flex justify-content-center align-items-center"><small>Copyright © marondal 2021</small></footer>
	</div>
<%
	ms.disconnect();
%>
 <script>
 	$(document).ready(function() {
 		
 		$('#submit').on('click', function() {
 			let nickname = $('#nickname option:selected').val();
 			let title = $('#title').val();
 			let price = $('#price').val();
 			let description = $('#description').val();
 			let pictureUrl = $('#pictureUrl').val();
 			
 			if(!nickname) {
 				alert("nickname을 선택하세요")
 				return false;
 			}
 			if(!title) {
 				alert("title을 입력하세요")
 				return false;
 			}
 			if(!price || isNaN(price)) {
 				alert("price을 입력하세요")
 				return false;
 			}
 			if(!description) {
 				alert("description을 입력하세요")
 				return false;
 			}
 					
 		} );
 	});
 </script>
</body>
</html>