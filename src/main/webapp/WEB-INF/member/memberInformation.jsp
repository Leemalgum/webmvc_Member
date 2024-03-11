<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2024/03/11
  Time: 7:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
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
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 5px;
        }

        div {
            text-align: center;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.4);
            overflow: auto;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<form>
    <table>
        <tr>
            <td>아이디</td>
            <td>비밀번호</td>
            <td>이름</td>
            <td>이메일</td>
            <td>가입일</td>
            <td>수정</td>
            <td>삭제</td>
        </tr>
        <c:forEach items="${dtoList}" var="dto">
            <tr>
                <td>${dto.id}</td>
                <td>${dto.pw}</td>
                <td>${dto.name}</td>
                <td>${dto.email}</td>
                <td>${dto.signupDate}</td>
                <td><a href="#" class="modal-button" data-id="${dto.id}" data-pw="${dto.pw}" data-name="${dto.name}" data-email="${dto.email}">수정</a> </td>
                <td>
                    <form id="deleteForm" action="/member/delMember.do" method="post">
                        <input type="hidden" name="id" value="${dto.id}">
                        <a href="#" onclick="document.getElementById('deleteForm').submit(); return false;">삭제</a>
                    </form>
                </td>
            </tr>>
        </c:forEach>
    </table>
    <div>
        <a href="/member/memberForm">회원가입</a>
    </div>
</form>
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <form action="/member/modMember.do" method="post">
            <label>아이디:</label> <input type="text" id="modal-id" name="id" readonly><br>
            <label>비밀번호:</label> <input type="text" id="modal-pw" name="pw"><br>
            <label>이름:</label> <input type="text" id="modal-name" name="name"><br>
            <label>이메일:</label> <input type="text" id="modal-email" name="email"><br>
            <button type="submit">수정</button>
        </form>
    </div>
</div>
<script>
    // 모달 버튼 클릭 시 모달 표시
    var modalButtons = document.querySelectorAll('.modal-button');
    modalButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            document.getElementById('myModal').style.display = 'block';

            document.getElementById('modal-id').value = this.getAttribute('data-id');
            document.getElementById('modal-pw').value = this.getAttribute('data-pw');
            document.getElementById('modal-name').value = this.getAttribute('data-name');
            document.getElementById('modal-email').value = this.getAttribute('data-email');
        });
    });

    // 모달 닫기 버튼
    var closeBtn = document.querySelector('.close');
    closeBtn.addEventListener('click', function() {
        document.getElementById('myModal').style.display = 'none';
    });

    // 모달 외부 클릭 시 모달 닫기
    window.addEventListener('click', function(event) {
        var modal = document.getElementById('myModal');
        if (event.target == modal) {
            modal.style.display = 'none';
        }
    });
</script>
</body>
</html>
