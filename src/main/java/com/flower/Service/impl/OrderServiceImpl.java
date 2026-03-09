package com.flower.Service.impl;

import com.flower.dao.OrderMapper;
import com.flower.entity.Order;
import com.flower.Service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * 订单业务实现类，注解开发，被Spring管理
 */
@Service // 标记为业务层组件，自动注入Spring容器
public class OrderServiceImpl implements OrderService {

    // 注入Mapper接口
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Order> getAllOrders() {
        return orderMapper.selectAllOrders();
    }

    @Override
    public Order getOrderById(Integer orderId) {
        return orderMapper.selectOrderById(orderId);
    }

    @Override
    public boolean addOrder(Order order) {
        // 受影响行数>0 表示新增成功
        return orderMapper.insertOrder(order) > 0;
    }

    @Override
    public boolean updateOrder(Order order) {
        return orderMapper.updateOrder(order) > 0;
    }

    @Override
    public boolean deleteOrder(Integer orderId) {
        return orderMapper.deleteOrderById(orderId) > 0;
    }
}