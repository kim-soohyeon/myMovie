<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1,shrink-to-fit=no">
	<title>마이무빙</title>
</head>
<body>
    <div class="container">
        <div class="jumbotron well">
        	<img src="https://static.thenounproject.com/png/1911643-200.png" width="50" height="50" align="left">
            <h2>영화목록
            	<span style="float:right">
            		<s:authorize access="hasRole('ADMIN')">
	            		<a href="<c:url value="/movies/new" />"
	            		class="btn btn-lg btn-primary">영화 등록</a>
	            	</s:authorize>
            	</span>
            </h2>
            <p>리뷰를 추가하려면 영화를 클릭하세요</p>
        </div>
        
        <div class="search">
		    <form class="">
		        <div class="row">
		            <div class="col-md-10">
		                <input type="text" class="form-control input-lg" placeholder="도서명으로 검색">
		            </div>
		            <div class="col-md-2">
		                <button type="submit" class="form-control input-lg btn btn-primary">
		                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
		                    검색
		                </button>
		            </div>
		        </div>
		    </form>
		</div>
        <div class="row">
            <c:forEach var="movie" items="${movies}" varStatus="status">
                <div class="col-md-4">
                    <div class="thumbnail">
                        <a href="<c:url value='/movies/${ movie.id }' />"><img src="${ movie.image }" /></a>
                        <div class="caption">
  
	                        <h3>${ movie.title } </h3>
	                        <h4><small>${ movie.director }</small></h4>
	                        <%-- <div class="css-aeixur-TopResultItemExtraInfo erx2pba2">${ movie.director}</div> --%>
                    		<s:authorize access="hasRole('ADMIN')">
                    		<a href="<c:url value='/movies/edit/${ movie.id }' />" class="btn btn-default">수정</a>
                    		<%-- <a href="<c:url value='/movies/delete/${ movie.id }' />" class="btn btn-danger">삭제</a> --%>
                    		<a onclick="return confirm('${ movie.title }을 정말로 삭제하시겠습니까?')" href="<c:url value='/movies/delete/${ movie.id }' />" class="btn btn-danger">삭제</a>
                    		</s:authorize>
                    	</div>
                	</div>
                </div>
            </c:forEach>
        </div>
        
        
    </div>
    
</body>
</html>