package com.acorn.project.order.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.project.order.dao.OrderDao;
import com.acorn.project.order.dto.OrderDetailDto;
import com.acorn.project.order.dto.OrderDto;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDao dao;

	@Override
	public void orderInfo(OrderDto dto, HttpSession session) {
		String id=(String)session.getAttribute("id");
		dto.setUserId(id);
		System.out.println(dto.getUserId());
		dao.orderInfo(dto);
		
	}

	@Override
	public void orderInfo_Detail(OrderDetailDto dtoDetail) {
		
		dao.orderInfo_Detail(dtoDetail);
		
	}
	
}