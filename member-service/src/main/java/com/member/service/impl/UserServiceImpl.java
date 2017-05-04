package com.member.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.member.bean.Menus;
import com.member.bean.Role;
import com.member.bean.User;
import com.member.dao.MenusDao;
import com.member.dao.UserDao;
import com.member.service.UserService;




@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao dao;
	
	@Autowired
	private MenusDao menusDao;
	

	public void inser() {
		User u=new User();
		u.setId("u1");
		u.setUsername("u11");
		u.setPassword("u111");
		dao.insertUser(u);
		Role r=new Role();
		r.setId(1);
		r.setName("11");
		 dao.insertRole(r);
	}


	public List<User> selectById() {
		return dao.selectById();
	}
	
	public User findUserByUsername(String username) {
		return dao.findUserByUsername(username);
	}


	public List<Menus> selectMenu() {
		// TODO Auto-generated method stub
		return menusDao.selectMenu(0);
	}


	public Map menuList(Menus m) {
		// TODO Auto-generated method stub
		HashMap map=new HashMap();
		map.put("rows",menusDao.menuList(m));
		map.put("total",menusDao.menuCount(m));
		HashMap map1=new HashMap();
		map1.put("result",map);
		map1.put("success","true");
		return map1;
	}
}
