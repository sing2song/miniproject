package com.saltlux.mysite.repository;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.mysite.dto.GoodsDTO;
import com.saltlux.mysite.dto.OrderDTO;

@Repository
public class OrderRepository {
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DataSource dataSource;

	public int setOrderInfo(OrderDTO orderDTO) {
		return sqlSession.insert("orderSQL.setOrderInfo", orderDTO);
	}

	public List<OrderDTO> getOrderInfo(String userId) {
		return sqlSession.selectList("orderSQL.getOrderInfo",userId);
	}

	public void reduceSaleProduct(Map<String, Object> map) {
		sqlSession.update("orderSQL.reduceSaleProduct",map);
	}

	public void orderCancel(String userId) {
		sqlSession.delete("orderSQL.orderCancel",userId);
	}

	public List<OrderDTO> getOrderProduct() {
		return sqlSession.selectList("orderSQL.getOrderProduct");
	}	

}
