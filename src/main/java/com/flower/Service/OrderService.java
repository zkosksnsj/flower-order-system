package com.flower.Service;

import com.flower.entity.Order;
import java.util.List;

/**
 * 订单业务接口，定义所有业务方法
 */
public interface OrderService {
    // 查询所有订单
    List<Order> getAllOrders();
    // 根据ID查询单个订单
    Order getOrderById(Integer orderId);
    // 新增订单
    boolean addOrder(Order order);
    // 修改订单
    boolean updateOrder(Order order);
    // 删除订单
    boolean deleteOrder(Integer orderId);
}