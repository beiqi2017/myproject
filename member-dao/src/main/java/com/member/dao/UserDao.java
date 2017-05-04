package com.member.dao;

import java.util.List;

import com.member.bean.Role;
import com.member.bean.User;

public interface UserDao {
  
  User findUserByUsername(String username); 
	
  List<User> selectById(); 
  
  void insertUser(User u);
  
  void insertRole(Role r);
}
