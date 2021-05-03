<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 후기 한개(반복) -->

<c:forEach var="list" items="${list}" varStatus="status">	
	<div class="userPage_area" id="qna_'${status.index }'"
		style="background-color: rgb(255, 255, 255);">
		<div id="qnaSubject_'${status.index }'" class="userPage_subject">
			<span style="color: #a0a0a0; font-weight: 700;">질문 : </span>
			${list.qnaboardSubject }
		</div>
		<div class="userPage_name">${list.userId }</div>
		<div class="userPage_date">${list.regDate }</div>
	</div>
	<div class="userPage_content" id="qna_'${status.index }'_content"
		style="white-space: pre-wrap;">
		${list.qnaboardContent }
		<input type="button" onclick="qnaDelete('${list.qnaboardCode}')"	class="qna_content_btn" id="qna_delete_btn"		style="visibility: hidden;" value="삭제">
		<input type="button"onclick="qnaModify('${list.qnaboardCode}')" class="qna_content_btn" id="qna_modify_btn"		style="visibility: hidden;" value="수정">
	</div>
</c:forEach>
