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
		
		$('#lbtn').click(function(){
			$(location).attr('href', '/clsProj/member/login.cls');
		});
		
		$('.ebtn').click(function(){
			var str = $(this).parent().attr('id');
			$('#reno').val(str);
			$('#frm').attr('action', '/clsProj/reBoard/reBoardEdit.cls');
		});
		
		$('.dbtn').click(function(){
			var str = $(this).parent().attr('id');
			$('#reno').val(str);
			$('#frm').attr('action', '/clsProj/reBoard/reBoardDel.cls');
		});
		
		$('.rbtn').click(function(){
			var str = $(this).parent().attr('id');
			$('#reno').val(str);
			$('#frm').attr('action', '/clsProj/reBoard/reBoardReply.cls');
		});
	});
</script>
</head>
<body>
	<form method="post" action="" id="frm">
		<input type="hidden" name="reno" id="reno">
		<input type="hidden" name="body" id="body">
		<input type="hidden" name="redate" id="redate">
		<input type="hidden" name="avatar" id="avatar">
	</form>
	
	<div class="w3-content mxw2">
		<div class="w3-col">
			<h2 class="w3-blue w3-center w3-padding">댓글 작성</h2>
			<div class="w3-col w3-margin-bottom">
				<div class="w3-col m1 w3-left w3-button w3-tiny w3-green" id="hbtn">Home</div>
			</div>

			<div class="w3-col w3-card w3-border">
				<div class="w3-col w3-border w3-margin-bottom" id="">
					<div class="w3-col w-100 w3-center pd-10 w3-border-right">
						<img class="h-80p w-auto w3-border" src="/clsProj/img/${AVT}">
						<h5 class="w3-col w3-center w3-text-grey mg-0 pd-0">${ID}</h5>
					</div>
					<div class="w3-rest pdh-10">
						<div class="w3-col w3-border-bottom w3-border-light-blue">
							<h6 class="w3-half w3-left-align w3-text-grey" style="margin: 0px; padding-right: 10px"><small>${SDATE}</small></h6>
						</div>
						<div class="w3-col w3-border-bottom mb10 w3-border-khaki">
							<h6 class="w3-padding" id="body">${BODY}</h6>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div>
			<div class="w3-col w3-margin-top w3-padding w3-card" style="margin-bottom: 0px;" id="${RENO}">
				<form method="post" action="/clsProj/reBoard/ReBoardReplProc.cls" id="frm">
					<input type="hidden" name="upno" id="upno" value="${RENO}">
					<input type="hidden" name="id" id="id" value="${ID}">
					<div class="w3-col">
						<h4 class="w3-col w-100 w3-text-gray w3-right-align"><label>작성자 : </label></h4>
						<h4 class="w3-rest w3-text-gray pd-left-20"><label>noBody</label></h4>
					</div>
					<div class="w3-col">
						<h4 class="w3-col w-100 mb5 w3-text-gray w3-right-align"><label for="body">댓글내용 : </label></h4>
					</div>
					<div class="w3-col">
						<textarea class="w3-col" name="body" id="body" style="resize: none;"></textarea>
					</div>
				</form>
			</div>
			<div class="w3-col" style="margin-bottom: 0px;">
				<span class="w3-button w3-small w-100 w3-red w3-right dbtn" style="padding: 3px">취소</span>
				<span class="w3-button w3-small w-100 inblock  w3-blue w3-right rbtn" style="padding: 3px" id="">댓글</span>
			</div>
		</div>
		
	</div>
</body>
</html>