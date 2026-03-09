<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>花店订单管理系统</title>
    <style>
        /* 基础样式 */
        table {border-collapse: collapse; width: 80%; margin: 20px auto; text-align: center;}
        th,td {border: 1px solid #ccc; padding: 10px;}
        th {background-color: #f5f5f5;}
        .btn-box, .search-box {width: 80%; margin: 10px auto;}
        /* 按钮样式 */
        .btn {padding: 6px 12px; text-decoration: none; background: #007bff; color: white; border-radius: 4px; margin: 0 5px; border: none; cursor: pointer;}
        .btn-danger {background: #dc3545;}
        .btn-warning {background: #ffc107; color: #333;}
        .btn-search {background: #28a745;}
        /* 查询输入框 */
        .search-input {padding: 6px 12px; width: 300px; border: 1px solid #ccc; border-radius: 4px; margin-right: 10px;}
    </style>
</head>
<body>
<div class="btn-box">
    <h2>花店订单管理系统</h2>
    <a href="${pageContext.request.contextPath}/order/toAdd" class="btn">新增订单</a>
</div>

<!-- 新增：查询模块（核心） -->
<div class="search-box">
    <label>客户姓名查询：</label>
    <!-- 回显查询关键词，刷新后不丢失 -->
    <input type="text" class="search-input" id="searchName"
           placeholder="输入姓名模糊查询（例：张）" value="${param.customerName}">
    <button class="btn btn-search" onclick="searchOrder()">查询</button>
    <button class="btn" onclick="resetSearch()">重置</button>
</div>

<!-- 订单列表（原有逻辑保留） -->
<table>
    <tr>
        <th>订单ID</th>
        <th>客户姓名</th>
        <th>订单日期</th>
        <th>订单状态</th>
        <th>操作</th>
    </tr>
    <!-- 遍历订单数据 -->
    <c:forEach items="${orderList}" var="order">
        <tr>
            <td>${order.orderId}</td>
            <td>${order.customerName}</td>
            <td>${order.orderDate}</td>
            <td>${order.status}</td>
            <td>
                <a href="${pageContext.request.contextPath}/order/get/${order.orderId}" class="btn btn-warning">修改</a>
                <a href="${pageContext.request.contextPath}/order/delete/${order.orderId}" class="btn btn-danger" onclick="return confirm('确定删除该订单吗？')">删除</a>
            </td>
        </tr>
    </c:forEach>
    <!-- 无数据时友好提示 -->
    <c:if test="${empty orderList}">
        <tr>
            <td colspan="5" style="color: #999; padding: 20px;">暂无订单数据</td>
        </tr>
    </c:if>
</table>

<!-- 查询&重置JS逻辑 -->
<script>
    // 执行查询（跳转带参数）
    function searchOrder() {
        const name = document.getElementById("searchName").value.trim();
        window.location.href = "${pageContext.request.contextPath}/order/list?customerName=" + encodeURIComponent(name);
    }

    // 重置查询（清空输入框，查全部）
    function resetSearch() {
        document.getElementById("searchName").value = "";
        window.location.href = "${pageContext.request.contextPath}/order/list";
    }

    // 按回车键触发查询（优化体验）
    document.getElementById("searchName").addEventListener("keydown", function(e) {
        if (e.key === "Enter") searchOrder();
    });
</script>
</body>
</html>