package com.saltlux.mysite.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.mysite.dto.QnaboardDTO;
import com.saltlux.mysite.repository.QnaboardRepository;


@Service
public class QnaboardService {

	@Autowired
	private QnaboardRepository QnaboardRepository;

	public List<QnaboardDTO> getQnaList(String productCode) {
		return QnaboardRepository.getQnaList(productCode);
	}
}
