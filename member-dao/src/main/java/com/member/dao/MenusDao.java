package com.member.dao;

import java.util.ArrayList;
import java.util.List;
import com.member.bean.Menus;

public interface MenusDao {

	ArrayList<Menus> selectMenu(int id);
	
	List<Menus> menuList(Menus m);
	
	int menuCount(Menus m);
}
