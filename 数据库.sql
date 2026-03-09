-- 先使用你之前用自己名字拼音创建的数据库，比如zhangsan
USE 你的名字拼音全拼;

-- 创建花店订单表，和之前的字段完全对应，规避MySQL关键字
CREATE TABLE IF NOT EXISTS flower_order (
                                            order_id INT NOT NULL AUTO_INCREMENT COMMENT '订单ID(主键)',
                                            customer_name VARCHAR(50) NOT NULL COMMENT '客户姓名',
    order_date DATE NOT NULL COMMENT '订单日期',
    status VARCHAR(20) NOT NULL COMMENT '订单状态(例：待付款/已完成/已取消)',
    PRIMARY KEY (order_id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='花店订单信息表';

-- 可以先插入2条测试数据，方便直接看效果
INSERT INTO flower_order (customer_name, order_date, status) VALUES
                                                                 ('张三', '2026-03-01', '已完成'),
                                                                 ('李四', '2026-03-08', '待付款');