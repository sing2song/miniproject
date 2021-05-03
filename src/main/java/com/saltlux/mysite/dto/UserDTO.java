package com.saltlux.mysite.dto;


import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class UserDTO {
	
	private String userId; 
	private String userPwd; 
	private String userName;
	private String userEmail;
	private String userPhone;  
	private int userPoint;
	private int productInCart;
	private String receiverName;
	private String receiverZipcode;
	private String receiverAddr1,receiverAddr2;
	private String receiverPhone;
	private String deliveryMsg;
	private String deliveryOption;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date joinDate;
	private int totalPayment; //총구매액
}
