package com.saltlux.mysite.repository;

import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.mysite.dto.UserDTO;
import com.saltlux.mysite.dto.UserVo;
import com.saltlux.mysite.exception.UserRepositoryException;

@Repository
public class UserRepository {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DataSource dataSource;	
	
	public UserVo findByNo(Long no) {
		return sqlSession.selectOne("user.find",no);
	}

	public UserDTO getUser(Map<String, String> map) throws UserRepositoryException {
		return sqlSession.selectOne("user.getUser",map);
	}
	
	public boolean update(UserVo vo){
		int count = sqlSession.update("user.update",vo);	
		return count==1;
	}


	public UserVo findByEmail(String email) {
		return sqlSession.selectOne("user.findByEmail", email);
	}


	public UserDTO checkId(String userId) {
		return sqlSession.selectOne("user.checkId",userId);
	}


	public UserDTO checkEmail(String userEmail) {
		return sqlSession.selectOne("user.checkEmail",userEmail);
	}


	public void join(UserDTO userDTO) {
		int count = sqlSession.insert("user.join",userDTO);
	}

	public void updateUserInfo(UserDTO userDTO) {
		sqlSession.update("user.updateUserInfo", userDTO);	
	}
	
	public void addCartCount(String userId) {
		sqlSession.update("user.addCartCount", userId);	
	}

	public void subCartCount(String userId) {
		sqlSession.update("user.subCartCount",userId);
	}

	public void allDeleteCartCount(String userId) {
		sqlSession.update("user.allDeleteCartCount",userId);
	}

	public void modify(Map<String, String> map) {
		sqlSession.update("user.modify",map);
	}

	public void memberDelete(Map<String, String> map) {
		sqlSession.delete("user.memberDelete",map);
	}


}
