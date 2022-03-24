package com.acorn.project.order.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.cart.dto.CartDto;
import com.acorn.project.order.dao.OrderDao;
import com.acorn.project.order.dto.OrderDetailDto;
import com.acorn.project.order.dto.OrderDto;
import com.acorn.project.order.dto.OrderListDto;
import com.acorn.project.product.dto.ProductDto;
import com.acorn.project.product.dto.StockBuyDto;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDao dao;

	@Override
	public void orderInfo(OrderDto dto) {
		
		dao.orderInfo(dto);
		
	}

	@Override
	public void orderInfo_Detail(OrderDetailDto dtoDetail) {
		//세션 아이디 불러오기
		
		
		dao.orderInfo_Detail(dtoDetail);
		
	}

	@Override
	public List<OrderDto> getListOrder(OrderDto dto) {

		return dao.getList(dto);
		
	}
	
	@Override
	public List<OrderDto> getAllListOrder(OrderDto dto) {
		
		return dao.getAllList(dto);
	}

	@Override
	public List<OrderListDto> orderDetailList(OrderDto dto) {

		return dao.orderDetailList(dto);
	}

	@Override
	public List<OrderListDto> AllOrderDetailList(OrderDto dto) {

		return dao.AllOrderDetailList(dto);
	}

	@Override
	public void stockReduce(ProductDto sbdto) {
		
		dao.stockReduce(sbdto);
	}

	@Override
	public void buyCount(ProductDto sbdto) {
		
		dao.buyCount(sbdto);
	}

	@Override
	public void stockIncrease(ProductDto sbdto) {

		dao.stockIncrease(sbdto);
	}

	@Override
	public void buyCountDown(ProductDto sbdto) {

		dao.buyCountDown(sbdto);
	}
	
	@Override
	public void delivered(OrderDto dto) {

		dao.delivered(dto);
		
	}

	@Override
	public List<OrderDto> thisWeek(OrderDto dto) {
		
		return dao.thisWeek(dto);
	}

	@Override
	public List<OrderDto> lastWeek(OrderDto dto) {

		return dao.lastWeek(dto);
	}

	@Override
	public void orderCancel(OrderDto dto) {

		dao.orderCancel(dto);
	}

	@Override
	public void orderReturn(OrderDto dto) {
		dao.orderReturn(dto);
	}
	
}
