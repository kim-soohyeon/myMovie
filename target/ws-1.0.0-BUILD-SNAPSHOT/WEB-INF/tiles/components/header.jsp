<link rel="icon" href="https://d1ujqdpfgkvqfi.cloudfront.net/favicon-generator/htdocs/favicons/2019-05-08/79299a0a215820c658abb26740fbfbe6.ico.png" type="image/x-icon">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page pageEncoding="utf-8"%>
<head>
<title>마이무빙</title>
</head>
<nav class="navbar navbar-default">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed"
            data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
            aria-expanded="false">
            <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
            <span class="icon-bar"></span> <span class="icon-bar"></span>
        </button>
        <img src="https://d1ujqdpfgkvqfi.cloudfront.net/favicon-generator/htdocs/favicons/2019-05-08/79299a0a215820c658abb26740fbfbe6.ico.png" width="50" height="50" align="left">
        <!-- <title>마이무빙</title> -->
        <a class="navbar-brand" href="<c:url value="/" />" style="vertical-align:middle;">홈</a>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="<c:url value="/movies" />">영화</a></li>
        <sec:authorize access="hasRole('ADMIN')">
		    <li><a href="<c:url value='/admin'/>">관리</a></li>
		</sec:authorize>
        	<li><a href="<c:url value="/location" />">영화관</a></li>
        </ul> 
        <!-- 로그인 버튼 -->
        <sec:authorize access="isAnonymous()">
                <c:url var="loginUrl" value="/login" />
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${ loginUrl }">로그인</a></li>
            </ul>
        </sec:authorize>
        <!-- 로그아웃 버튼 -->
        <sec:authorize access="isAuthenticated()">
            <c:url var="logoutUrl" value="/logout" />
            <form action="${logoutUrl}" method="post"
                class="navbar-form navbar-right">
                <button type="submit" class="btn btn-default">로그아웃</button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
        </sec:authorize>
        <!-- /.navbar-collapse -->
<%--         <ul class="nav navbar-nav navbar-right">
            <li><a>권한: [${ authorities.authority }]</a></li>
        </ul>  --%>
    </div>
    <!-- /.container-fluid -->
</nav>