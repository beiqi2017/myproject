<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta HTTP-EQUIV="pragma" CONTENT="no-cache">
	<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
	<meta HTTP-EQUIV="expires" CONTENT="0">
	<title>登录</title>
	<link rel="icon" href="images/logo.png" type="image/x-icon" />
   <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
  <link rel="stylesheet" type="text/css" href="./jquery-easyui-1.4.5/themes/default/easyui.css">   <!--引入CSS样式-->
  <link rel="stylesheet" type="text/css" href="./jquery-easyui-1.4.5/themes/icon.css">   <!--Icon引入-->
  <script language="JavaScript" type="text/javascript" src="./jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>
  <script language="JavaScript" type="text/javascript" src="./jquery-easyui-1.4.5/jquery.min.js" charset="utf-8"></script>  
  <script language="JavaScript" type="text/javascript" src="./jquery-easyui-1.4.5/jquery.easyui.min.js" charset="utf-8"></script> 
	<style type="text/css">
	#login_box{ background: url(./images/login_bg.jpg) repeat left top}
		
		.login{width:760px; height:400px; margin:0 auto; background:url(./images/login.jpg) no-repeat left top; left:50%; top:50%; margin-left:-380px; margin-top:-200px; position:absolute; }
		.login ul{ float:left; width:398px; height:170px; margin:75px 0 0 300px; display:inline;list-style-type: none;}
		.login ul li{ float:left; width:100%; padding-bottom:10px}
		.login ul li input{height:25px}
		.spanw {width: 65px;display:inline-block;text-align: right}
	</style>
</head>
<script type="text/javascript"> 
    function changeImg() { 
        var imgSrc = $("#imgObj"); 
        var src = imgSrc.attr("src"); 
        imgSrc.attr("src", chgUrl(src)); 
    } 
    //时间戳     
    //为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳     
    function chgUrl(url) { 
        var timestamp = (new Date()).valueOf(); 
        url = url.substring(0,9); 
        if ((url.indexOf("&") >= 0)) { 
            url = url + "×tamp=" + timestamp; 
        } else { 
            url = url + "?timestamp=" + timestamp; 
        } 
        return url; 
    } 
    
     function loginSubmit(){
	   var form=$('#loginForm');
	   if(validateLoginForm()){
		   form.form("submit",{
			  url:"./login.do",
			  success:function(data){
				var result=$.parseJSON(data);
				if (result.success) {
					 window.location.href="./login.html";
				} else {
					var loginErrorMsg=$("#loginErrorMsg");
					loginErrorMsg.empty();
					loginErrorMsg.show();
					loginErrorMsg.html(result.error.msg);
					changeImg();
				}
			}
		})
	}
}
       
       function validateLoginForm(){
	     var loginErrorMsg=$("#loginErrorMsg");
	     loginErrorMsg.empty();
	     loginErrorMsg.show();
	     var username=$("#username").val();
	     if(!username){
		   loginErrorMsg.html("登录名不能为空");
		   return false;
	     }
	     var password=$("#password").val();
	     if(!password){
		   loginErrorMsg.html("密码不能为空");
		   return false;
	     }
	     /*var code=$("#code").val();
	     if(!code){
		   loginErrorMsg.html("验证码不能为空");
		   return false;
	     }*/
	   return true;
}
</script> 
<body id="login_box">
	<form id="loginForm" method="post">
		<div class="login">
			<ul>
				<li><font color="red" id="loginErrorMsg" style="display: none;">用户名称不能为空</font></li>
				<li>
					<span class="spanw">登录名：</span><input name="username" id="username" type="text" style="width:230px"  />
				</li>
				<li>
					<span class="spanw">密&nbsp;码：</span><input name="password" id="password" type="password" style="width:230px" />
				</li>
			    <li>
					<span class="spanw">验证码：</span><input name="code" id="code" type="text" style="width:100px;vertical-align: middle;" maxlength="4" />
					<img id="imgObj" src="./code.do" height="31px" onclick="changeImg()" title="点击刷新" style="vertical-align: middle;"/>
				</li>
				<li style="text-align: center">
					 <input type="button" style="width:150px;height:40px;background-color:#007dc1;border:1px solid #124d77;color:#ffffff;font-family:arial;"  onclick="loginSubmit()" value="登录">
				</li>
			</ul>
    	</div>
	</form>
</body>
</html>