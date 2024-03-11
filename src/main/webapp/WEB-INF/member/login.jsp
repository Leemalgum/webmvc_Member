<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2024/03/11
  Time: 7:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>로그인</title>
</head>
<body>
<c:if test="${param.result=='error'}">
    <span style="color: red">
    <h1>로그인 에러입니다. 다시 시도하세요!!</h1>
    </span>
</c:if>
<form action="/login" method="post">
    <input type="text" name="id">
    <input type="text" name="pw">
    <button type="submit">LOGIN</button>
</form>
</body>
</html>
