package com.flower.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;

/**
 * 订单实体类，对应数据库flower_order表
 */
@Data // 自动生成get/set/toString，不用手写，不想用lombok就自己生成get/set
public class Order {
    // 订单ID
    private Integer orderId;
    // 客户姓名
    private String customerName;
    // 订单日期（日期格式化，解决前端传日期报错问题）
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date orderDate;
    // 订单状态
    private String status;
}