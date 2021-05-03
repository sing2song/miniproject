package com.saltlux.mysite.repository;

import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.mysite.dto.QnaboardDTO;

@Repository
public class QnaboardRepository {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DataSource dataSource;

	public List<QnaboardDTO> getQnaList(String productCode) {
		return sqlSession.selectList("qnaSQL.getQnaList",productCode);
	}
}
