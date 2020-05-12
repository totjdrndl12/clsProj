<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cls Project Main Page</title>
<link rel="stylesheet" href="/clsProj/css/w3.css">
<link rel="stylesheet" href="/clsProj/css/user.css">
<script type="text/javascript" src="./js/jquery-3.5.0.min.js"></script>
<style>
</style>
<script type="text/javascript">
	$(function(){
		/*
		$('#login').click(function(){
			$(location).attr('href', '/clsProj/member/login.cls');
		});
		$('#logout').click(function(){
			$(location).attr('href', '/clsProj/member/logoutProc.cls');
		});
		*/
		$('.btn').click(function(){
			var tid = $(this).attr('id');
			var url = '';
			if(tid == 'login'){
				url = '/clsProj/member/login.cls';
			} else if(tid == 'logout'){
				url = '/clsProj/member/logoutProc.cls';
			} else if(tid == 'join'){
				url = '/clsProj/member/joinForm.cls';
			} else if(tid == 'gBoard'){
				url = '/clsProj/gBoard/gBoardList.cls';
			}
			
			$(location).attr('href', url);
		});
	});
</script>
</head>
<body>
	<div class="w3-content mxw2">
		<h2 class="w3-deep-orange w3-padding w3-margin-bottom w3-center w3-card-4">Cls Project Main</h2>
		<div class="w3-col">
			<c:if test="${empty SID}">
				<div class="btn w3-button w3-green inblock w-150" id="login">Login</div>
				<div class="btn w3-button w3-light-green inblock w-150" id="join">Join</div>
			</c:if>
			<c:if test="${not empty SID}">
				<div class="btn w3-button w3-red inblock w-150" id="logout">Logout</div>
				<div class="btn w3-button w3-pink inblock w-150" id="gBoard">gBoard</div>
			</c:if>
		</div>
	</div>
</body>
</html>