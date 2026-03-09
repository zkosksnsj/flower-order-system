<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>花店订单管理系统</title>
    <style>
        table {border-collapse: collapse; width: 80%; margin: 20px auto; text-align: center;}
        th,td {border: 1px solid #ccc; padding: 10px;}
        th {background-color: #f5f5f5;}
        .btn-box {width: 80%; margin: 20px auto;}
        .btn {padding: 6px 12px; text-decoration: none; background: #007bff; color: white; border-radius: 4px; margin: 0 5px;}
        .btn-danger {background: #dc3545;}
        .btn-warning {background: #ffc107; color: #333;}
    </style>
</head>
<body>
<div class="btn-box">
    <h2>花店订单管理系统</h2>
    <a href="${pageContext.request.contextPath}/order/toAdd" class="btn">新增订单</a>
</div>
<table>
    <tr>
        <th>订单ID</th>
        <th>客户姓名</th>
        <th>订单日期</th>
        <th>订单状态</th>
        <th>操作</th>
    </tr>
    <!-- 循环遍历订单列表 -->
    <c:forEach items="${orderList}" var="order">
        <tr>
            <td>${order.orderId}</td>
            <td>${order.customerName}</td>
            <td>${order.orderDate}</td>
            <td>${order.status}</td>
            <td>
                <a href="${pageContext.request.contextPath}/order/get/${order.orderId}" class="btn btn-warning">修改</a>
                <a href="${pageContext.request.contextPath}/order/delete/${order.orderId}" class="btn btn-danger" onclick="return confirm('确定要删除该订单吗？')">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
