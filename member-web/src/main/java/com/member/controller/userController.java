package com.member.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.member.bean.User;

@Controller
public class userController{
	
	private static final Logger logger = LoggerFactory.getLogger(userController.class);

	 /**
	   * �ж��û��Ƿ��¼
	   * @param currUser
	   * @return
	   */
	  @RequestMapping(value = "/login",method=RequestMethod.POST)
	  public String isLogin(User currUser){
	    Subject user = SecurityUtils.getSubject();
	    UsernamePasswordToken token = new UsernamePasswordToken(currUser.getUsername(),currUser.getPassword());
	    token.setRememberMe(true);
	    try {
	      user.login(token);
	      return "redirect:/main";
	    }catch (AuthenticationException e) {
	      token.clear();
	      e.printStackTrace();
	      String msg = "";
           if (e instanceof org.apache.shiro.authc.ConcurrentAccessException) {
                msg = "�û��ѵ�¼��";
             } else if (e instanceof org.apache.shiro.authc.AccountException) {
                msg = "δ֪�ʺŴ�����û�״̬�쳣��";
            } else if (e instanceof org.apache.shiro.authc.IncorrectCredentialsException) {
                msg = "�û����������";
             } else if (e instanceof org.apache.shiro.authc.AuthenticationException) {
                msg = "��֤ʧ�ܣ�";
             }
          System.out.println(msg);
	      return "redirect:/login";
	    }
	  }

}