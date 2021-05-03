package com.saltlux.mysite.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.saltlux.mysite.dto.OrderDTO;
import com.saltlux.mysite.dto.UserDTO;
import com.saltlux.mysite.service.OrderService;
import com.saltlux.mysite.service.UserService;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	//주문내역/배송조회 페이지
	@GetMapping("/mypage_orderlist")
	public ModelAndView orderlist(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String userId = (String)session.getAttribute("memId");
		UserDTO userDTO = userService.checkId(userId);
		List<OrderDTO> list = orderService.getOrderInfo(userId);
		
		mav.addObject("userDTO", userDTO);
		mav.addObject("list", list);
		mav.addObject("display", "/mypage/mypageIndex.jsp");
		mav.addObject("contents", "/mypage/mypage_orderlist.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
}
