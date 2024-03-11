<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2024/03/11
  Time: 4:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>회원정보</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
<body>
<form>
    <table>
        <tr>
            <td>아이디</td>
            <td>비밀번호</td>
            <td>이름</td>
            <td>이메일</td>
            <td>가입일</td>
        </tr>
        <c:forEach items="${dtoList}" var="dto">
            <tr>
                <td>${dto.id}</td>
                <td>${dto.pw}</td>
                <td>${dto.name}</td>
                <td>${dto.email}</td>
                <td>${dto.signupDate}</td>
            </tr>>
        </c:forEach>
    </table>
</form>

</body>
</html>
