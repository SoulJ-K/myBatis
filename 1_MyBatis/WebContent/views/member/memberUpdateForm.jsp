<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#infoTable{margin: auto;}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<h1 align="center">내 정보 수정</h1>
	<form action="${ contextPath }/mupdate.me" method="post">
		<table id="infoTable">
			<tr>
				<td width="100px">* 아이디</td>
				<td><input type="text" name="userId" value="${ param.userId }" class="st" readonly></td>
			</tr>
			<tr>
				<td>* 이름</td>
				<td><input type="text" name="userName" value="${ param.userName }" class="st"></td>
			</tr>
			<tr>
				<td>* 닉네임</td>
				<td><input type="text" name="nickName" value="${ param.nickName }" class="st"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;이메일</td>
				<td><input type="text" name="email" value="${ param.email }" class="st"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;생년월일</td>
				<td>
					<select name="year">
						<c:forEach begin="<%= new GregorianCalendar().get(Calendar.YEAR) - 50 %>" 
									end="<%= new GregorianCalendar().get(Calendar.YEAR) %>" var="i">
							<%--<c:if test="${ fn:substring(param.birthDay, 0, 4) == i }">
								<option value="${ i }" selected>${ i }</option>
							</c:if>
							 <c:if test="${ fn:substring(param.birthDay, 0, 4 != i }">
								<option value="${ i }">${ i }</option>
							</c:if> --%>
							<option value="${ i }" >${ i }</option>
						</c:forEach>
					</select>
					
					<select name="month">
						<c:forEach begin="1" end="12" var="i">
							<c:if test="${ fn:substring(param.birthDay, 5, 7) == i }">
								<option value="${ i }" selected>${ i }</option>
							</c:if>
							<c:if test="${ fn:substring(param.birthDay, 5, 7) != i }">
								<option value="${ i }">${ i }</option>
							</c:if>
						</c:forEach>
					</select>
					
					<select name="date">
						<c:forEach begin="1" end="31" var="i">
							<c:if test="${ fn:substring(param.birthDay, 8, 10) == i }">
								<option value="${ i }" selected>${ i }</option>
							</c:if>
							<c:if test="${ fn:substring(param.birthDay, 8, 10) != i }">
								<option value="${ i }">${ i }</option>
							</c:if>
						</c:forEach>
					</select>
					<input type="text" name="birthDay" value="${ param.birthDay }" class="st">
				</td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;전화번호</td>
				<td><input type="text" name="phone" value="${ param.phone }" class="st"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;주소</td>
				<td><input type="text" name="address" value="${ param.address }" class="st"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;성별</td>
				<td>
					<c:if test="${ param.gender == 'M' }">
						<input type="radio" name="gender" value="M" class="st" checked>남자 &nbsp;
						<input type="radio" name="gender" value="F" class="st" >여자 &nbsp;
					</c:if>
					<c:if test="${ param.gender == 'F' }">
						<input type="radio" name="gender" value="M" class="st" >남자 &nbsp;
						<input type="radio" name="gender" value="F" class="st" checked>여자 
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div align="center">
						<br>
						<input type="submit" value="수정">
						<button type="reset" onclick="history.go(-1);">취소</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>