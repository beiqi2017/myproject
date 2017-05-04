package com.member.controller;

import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.member.bean.Menus;
import com.member.bean.User;
import com.member.service.UserService; 
@Controller
@RequestMapping("/Test")
@Scope("request")
public class Test {

	@Autowired
	private UserService userService;
	private Logger log = Logger.getLogger(Test.class);

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	@ResponseBody
	public List<User> user() {
		log.info("action start");
		System.out.println("1111");
		return userService.selectById();
	}

	@RequestMapping(value = "/page", method = RequestMethod.GET)
	public String page() {
		System.out.println("2222");
		return "index1";
	}
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() {
		userService.inser();
		return "index1";
	}
	
	@ExceptionHandler(Exception.class)
	public void handleException(Exception ex) {
		ex.printStackTrace();
	}
	
	@RequestMapping(value = "/selectMenu", method = RequestMethod.GET)
	@ResponseBody
	public List<Menus> selectMenu() {
		return userService.selectMenu();
	}
	
	@RequestMapping(value = "/menuList", method = RequestMethod.POST)
	@ResponseBody
	public Map menuList(Menus m) {
		return userService.menuList(m);
	}
}
