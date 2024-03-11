<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2024/03/11
  Time: 7:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 가입</title>
    <script>
        function resetForm() {
            document.getElementById("memberForm").reset();
        }
    </script>
</head>
<body>
<form id="memberForm" action="/member/addMember.do" method="post">
    <h1>회원 가입</h1>
    <table>
        <tr>
            <td>아이디</td>
            <td><input type="text" name="id"> </td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pw"> </td>
        </tr>
        <tr>
            <td>이름</td>
            <td><input type="text" name="name"> </td>
        </tr>
        <tr>
            <td>이메일</td>
            <td><input type="text" name="email"> </td>
        </tr>
        <tr>
            <td>
                <button type="submit">가입하기</button>
                <button type="button" onclick="resetForm()">다시입력</button>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
