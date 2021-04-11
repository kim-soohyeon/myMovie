<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%@ page pageEncoding="utf-8" %>
<div class="jumbotron well">
	<img src="https://static.thenounproject.com/png/2549184-200.png" width="50" height="50" align="left">
    <h2>관리자 페이지</h2>
    
    <p>항상 마이무빙을 위해 힘써주셔서 감사합니다.^_^</p>
</div>
<table class="table table-striped">
    <thead>
        <tr>
            <th>User</th>
            <th>Roles</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="user" items="${ users }">
            <tr>
                <td>${ user.email }</td>
                <td>
                    <c:forEach var="authority" items="${ user.authorities }">
                        ${ authority.authority }
                    </c:forEach>
                </td>
                 <td>
                    <p>
                        <c:url var="changeRolePath" value="/admin/role/${ user.id }" />
                        <a href="${ changeRolePath }/admin" class="btn btn-default <c:if test="${ user.hasRole('ADMIN') }">btn-primary</c:if>">관리자</a>
                        <a href="${ changeRolePath }/manager" class="btn btn-default <c:if test="${ user.hasRole('MANAGER') }">btn-primary</c:if>">매니저</a>
                        <a href="${ changeRolePath }/user" class="btn btn-default <c:if test="${ user.hasRole('USER') }">btn-primary</c:if>">사용자</a>
                    </p>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>