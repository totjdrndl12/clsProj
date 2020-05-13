<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글게시판 목록보기</title>
<link rel="stylesheet" href="/clsProj/css/w3.css">
<link rel="stylesheet" href="/clsProj/css/user.css">
<script type="text/javascript" src="/clsProj/js/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#sbtn').click(function(){
			var str = $('#body').val();
			if(!str){
				return;
			}
			$('#frm').submit();
		});
		
		$('#hbtn').click(function(){
			$(location).attr('href', '/clsProj/main.cls');
		});
	});
</script>
</head>
<body>
	<div class="w3-content mxw2">
		<div class="w3-col">
			<h2 class="w3-blue w3-center w3-padding">댓글 게시판</h2>
			<div class="w3-col w3-margin-bottom">
				<c:if test="${empty SID}">
					<div class="w3-col m1 w3-right w3-button w3-tiny w3-blue" id="">Login</div>
				</c:if>
				<c:if test="${not empty SID}">
					<div class="w3-col m1 w3-right w3-button w3-tiny w3-lime" id="write">Write</div>
					<div class="w3-col m1 w3-right w3-button w3-tiny w3-red" id="logout">Logout</div>
				</c:if>
				
				<div class="w3-col m1 w3-left w3-button w3-tiny w3-green" id="hbtn">Home</div>
			</div>

			<%-- 
			<c:forEach var="vo" items="${LIST}"> 
			</c:forEach>
			--%>
				<div class="w3-col w3-border w3-margin-bottom" id="">
					<div class="w3-col w-100 w3-center pd-10 w3-border-right">
						<img class="h-80p w-auto w3-border" src="/clsProj/img/img_avatar1.png">
						<h5 class="w3-col w3-center"><b>euns</b></h5>
					</div>
					<div class="w3-rest pdh-10">
						<div class="w3-col w3-border-bottom w3-border-light-blue">
							<h6 class="w3-half w3-left-align w3-text-grey" style="margin: 0px; padding-right: 10px"><small>2020년 05월 13일 09:50</small></h6>
						</div>
						<div class="w3-col w3-border-bottom w3-margin-bottom w3-border-khaki">
							<h6 class="w3-padding" id="body">원글입니다.</h6>
						</div>
						<div class="w3-col" style="margin-bottom: 0px;">
							<span class="w3-button w3-red w3-right" style="padding: 3px">삭제</span>
							<span class="w3-button w3-orange w3-right" style="padding: 3px">수정</span>
							<span class="w3-button w3-blue w3-right" style="padding: 3px">댓글</span>
						</div>
					</div>
				</div>
			
			<c:if test="${empty LIST}">
				<div class="w3-col w3-border w3-margin-bottom w3-card" id="gmsg">
					<h3 class="w3-padding w3-center">아직 작성된 글이 없습니다.</h3>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>