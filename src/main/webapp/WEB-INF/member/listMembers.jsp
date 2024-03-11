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
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        form {
            width: 80%;
            margin: 0 auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            text-align: center; /* 링크 가운데 정렬 */
        }

        div {
            text-align: center;
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
    <div>
        <a href="/member/memberForm">회원가입</a>
    </div>
</form>

</body>
</html>
