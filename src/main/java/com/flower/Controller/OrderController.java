package com.flower.Controller;

import com.flower.dao.OrderMapper;
import com.flower.entity.Order;
import com.flower.Service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 订单控制层，包含查询（含模糊查询）、新增、修改、删除全功能
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    // 注入业务层（原有）
    @Autowired
    private OrderService orderService;

    // 新增：注入Mapper（用于模糊查询，不用改Service）
    @Autowired
    private OrderMapper orderMapper;

    /**
     * 核心修改：支持查询所有订单/按客户姓名模糊查询订单
     */
    @RequestMapping("/list")
    public String listAllOrders(
            @RequestParam(required = false) String customerName, // 接收前端查询关键词
            Model model
    ) {
        List<Order> orderList;
        // 有查询关键词 → 执行模糊查询；无关键词 → 查询所有
        if (customerName != null && !customerName.trim().isEmpty()) {
            orderList = orderMapper.selectOrdersByCustomerName(customerName.trim());
        } else {
            orderList = orderService.getAllOrders();
        }
        model.addAttribute("orderList", orderList);
        return "orderList";
    }

    // 以下是原有功能，完全保留，无需修改
    @RequestMapping("/get/{orderId}")
    public String getOrderById(@PathVariable Integer orderId, Model model) {
        model.addAttribute("order", orderService.getOrderById(orderId));
        return "orderEdit";
    }

    @RequestMapping("/toAdd")
    public String toAddPage() {
        return "orderAdd";
    }

    @RequestMapping("/add")
    public String addOrder(Order order) {
        orderService.addOrder(order);
        return "redirect:/order/list";
    }

    @RequestMapping("/update")
    public String updateOrder(Order order) {
        orderService.updateOrder(order);
        return "redirect:/order/list";
    }

    @RequestMapping("/delete/{orderId}")
    public String deleteOrder(@PathVariable Integer orderId) {
        orderService.deleteOrder(orderId);
        return "redirect:/order/list";
    }
}