<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<title>영화 수정</title>
</head>
<body>
    <div class="container">
        <div class="jumbotron">
            <h2>영화목록 수정</h2>
        </div>
         <!-- action 값을 잘 설정해 주세요 -->
        <form action="<c:url value='/movies/update' />" method="post" enctype="multipart/form-data">
            <div class="form-group form-group-lg">
                <label class="control-label">영화 제목</label>
                <input name="title" type="text" class="form-control" value="${ movie.title }">
            </div>
            <div class="form-group form-group-lg">
                <label class="control-label">감독</label>
                <input name="director" type="text" class="form-control" value="${ movie.director }">
            </div>
            <div class="form-group form-group-lg">
                <label class="control-label">이미지</label>
                <input name="file" type="file" class="form-control" value=""> 
            </div>
            <input name="id" type="hidden" value="${ movie.id }">
            <button type="submit" class="btn btn-lg btn-primary">수정</button>
        </form>
    </div>
</body>
</html>