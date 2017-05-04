package com.member.service;

import java.util.List;
import java.util.Map;

import com.member.bean.Menus;
import com.member.bean.User;




public interface UserService {
	
	User findUserByUsername(String username); 
	
	void inser(); 
	
	List<User> selectById(); 
	
	List<Menus> selectMenu();
	
	 Map menuList(Menus m);
}
