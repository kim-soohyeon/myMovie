<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<title>영화 등록</title>
</head>
<body>
    <div class="container">
        <div class="jumbotron">
            <h1>영화등록</h1>
            <!-- <p>views/books/new.jsp</p> -->
        </div>
        <form action="<c:url value="/movies" />" method="post" enctype="multipart/form-data">
            <div class="form-group form-group-lg">
                <label class="control-label">영화 제목</label>
                <input name="title" type="text" class="form-control">
            </div>
            <div class="form-group form-group-lg">
                <label class="control-label">감독</label>
                <input name="director" type="text" class="form-control">
            </div>
            <div class="form-group form-group-lg">
                <label class="control-label">이미지</label>
                <input name="file" type="file">
            </div>
            <button type="submit" class="btn btn-lg btn-primary">등록</button>
        </form>
    </div>
</body>
</html>