package com.saltlux.mysite.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.mysite.dto.GoodsDTO;
import com.saltlux.mysite.dto.OrderDTO;
import com.saltlux.mysite.repository.OrderRepository;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;

	public int setOrderInfo(OrderDTO orderDTO) {
		return orderRepository.setOrderInfo(orderDTO);
	}

	public List<OrderDTO> getOrderInfo(String userId) {
		return orderRepository.getOrderInfo(userId);
	}

	public void reduceSaleProduct(Map<String, Object> map) {
		orderRepository.reduceSaleProduct(map);
	}

	public void orderCancel(String userId) {
		orderRepository.orderCancel(userId);
	}

	public List<OrderDTO> getOrderProduct() {
		return orderRepository.getOrderProduct();
	}
	
	
}
