<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ page pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>Bootstrap star rating example</title>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<link rel="stylesheet" href="/c/css/star-rating.css"/>
<script src="/c/js/star-rating.js"></script>

<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet"> -->




	
<!-- 		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-star-rating/4.0.2/css/star-rating.min.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-star-rating/4.0.2/js/star-rating.min.js"></script>  -->
	
	
<script>
$(document).ready(function () {

	$('.star-view').rating('refresh', { displayOnly: true, disabled: true, showClear: false, showCaption: false , animate: false});
});


 

</script>
<body>
<div class="jumbotron">
    <h1>${ movie.title }</h1>
    <p>${ movie.director } 감독</p>
</div>
<div class="thumbnail">
    <img src="${ movie.image }">
</div>

<div class="page-header">
    <h2>리뷰</h2>
</div>

<c:url var="reviewsPath" value="/reviews" />
<f:form modelAttribute="review" action="${ reviewsPath }" method="post">
    <c:forEach var="error" items="${ fieldErrors }">
        <div class="alert alert-warning">
            <strong>${ error.getField() }</strong>: ${ error.getDefaultMessage() }
        </div>
    </c:forEach>
    
  
    <f:textarea path="text" cssClass="form-control" rows="5" />
     <!-- 평점 선택창 -->
    <f:label path="rating">평점: </f:label>
    
    <input type="text" name="rating" id="rating-system"  class="rating rating-loading" data-size="xs" value="5">
	<input type="hidden" name="userId" type="text" value="${email }">
     
    <f:hidden path="movieId" />
    <button class="btn btn-block btn-primary" type="submit">리뷰 등록</button>
</f:form>

<table class="table table-stripped" id="reviews">
    <thead>
        <tr>
        	<th>Rating</th> <!-- 평점 -->
            <th>User</th>
            <th>Text</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="review" items="${ reviews }" varStatus="status">
            <tr>
         
            	<%-- <td><c:forEach var="rating" items="${ ratingOptions }" varStatus="status" begin="1" end="${ review.rating }">★</c:forEach></td> --%>
            	<td><input type="text" id="star_view${status }" class="rating rating-loading star-view" value="${ review.rating }" data-size="xs"></td>
                <td>${review.userId }</td>
                <td>${ review.text }</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>


