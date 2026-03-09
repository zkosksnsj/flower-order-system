<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增订单</title>
    <style>
        .form-box {width: 500px; margin: 50px auto;}
        .form-item {margin: 15px 0;}
        label {display: inline-block; width: 100px; text-align: right; margin-right: 10px;}
        input {width: 300px; padding: 8px;}
        .btn-box {text-align: center; margin-top: 30px;}
        .btn {padding: 8px 20px; background: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer;}
        .btn-back {background: #6c757d; text-decoration: none; padding: 8px 20px; border-radius: 4px; color: white;}
    </style>
</head>
<body>
<div class="form-box">
    <h2 style="text-align: center;">新增花店订单</h2>
    <form action="${pageContext.request.contextPath}/order/add" method="post">
        <div class="form-item">
            <label>客户姓名：</label>
            <input type="text" name="customerName" required>
        </div>
        <div class="form-item">
            <label>订单日期：</label>
            <input type="date" name="orderDate" required>
        </div>
        <div class="form-item">
            <label>订单状态：</label>
            <input type="text" name="status" placeholder="例：待付款/已完成" required>
        </div>
        <div class="btn-box">
            <button type="submit" class="btn">提交新增</button>
            <a href="${pageContext.request.contextPath}/order/list" class="btn-back">返回列表</a>
        </div>
    </form>
</div>
</body>
</html>
