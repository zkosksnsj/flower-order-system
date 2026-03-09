package com.flower.dao;

import com.flower.entity.Order;
import org.apache.ibatis.annotations.*;
import java.util.List;

/**
 * 订单Mapper接口，MyBatis注解开发，直接写SQL
 */
@Mapper // 标记为MyBatis的Mapper接口，被Spring扫描
public interface OrderMapper {

    /**
     * 查询所有订单（作业要求的查询所有）
     */
    @Select("SELECT order_id orderId, customer_name customerName, order_date orderDate, status FROM flower_order")
    List<Order> selectAllOrders();

    /**
     * 根据订单ID查询单个订单（作业要求的查询单个）
     */
    @Select("SELECT order_id orderId, customer_name customerName, order_date orderDate, status FROM flower_order WHERE order_id = #{orderId}")
    Order selectOrderById(Integer orderId);

    /**
     * 新增订单（作业要求的新增）
     */
    @Insert("INSERT INTO flower_order (customer_name, order_date, status) VALUES (#{customerName}, #{orderDate}, #{status})")
    int insertOrder(Order order);

    /**
     * 修改订单（作业要求的修改）
     */
    @Update("UPDATE flower_order SET customer_name=#{customerName}, order_date=#{orderDate}, status=#{status} WHERE order_id=#{orderId}")
    int updateOrder(Order order);

    /**
     * 新增：按客户姓名模糊查询订单
     */
    @Select("SELECT order_id orderId, customer_name customerName, order_date orderDate, status FROM flower_order WHERE customer_name LIKE CONCAT('%', #{customerName}, '%')")
    List<Order> selectOrdersByCustomerName(String customerName);

    /**
     * 根据订单ID删除订单（作业要求的删除）
     */
    @Delete("DELETE FROM flower_order WHERE order_id = #{orderId}")
    int deleteOrderById(Integer orderId);
}