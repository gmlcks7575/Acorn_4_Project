package com.acorn.project.order.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.acorn.project.cart.dto.CartDto;
import com.acorn.project.order.dto.OrderDetailDto;
import com.acorn.project.order.dto.OrderDto;
import com.acorn.project.order.dto.OrderListDto;
import com.acorn.project.product.dto.ProductDto;
import com.acorn.project.product.dto.StockBuyDto;

public interface OrderService {

	public void orderInfo(OrderDto dto);
	
	public void orderInfo_Detail(OrderDetailDto dtoDetail);
	
	public List<OrderDto> getListOrder(OrderDto dto);
	
	public List<OrderDto> getAllListOrder(OrderDto dto);

	public List<OrderListDto> orderDetailList(OrderDto dto);
	
	public List<OrderListDto> AllOrderDetailList(OrderDto dto);
	
	public void stockReduce(ProductDto sbdto);
	
	public void buyCount(ProductDto sbdto);
	
	public void stockIncrease(ProductDto sbdto);
	
	public void buyCountDown(ProductDto sbdto);
	
	public void orderCancel(OrderDto dto);
	
	public void orderReturn(OrderDto dto);

	public void delivered(OrderDto dto);
	
	public List<OrderDto> thisWeek(OrderDto dto);

	public List<OrderDto> lastWeek(OrderDto dto);
}
