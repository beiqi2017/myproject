<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>世联行会员系统</title>
   <link rel="icon" href="images/logo.png" type="image/x-icon" />
   <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
  
  <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="./jquery-easyui-1.4.5/themes/default/easyui.css">   <!--引入CSS样式-->
  <link rel="stylesheet" type="text/css" href="./jquery-easyui-1.4.5/themes/icon.css">   <!--Icon引入-->
  <script language="JavaScript" type="text/javascript" src="./jquery-easyui-1.4.5/jquery.min.js" charset="utf-8"></script>  
  <script language="JavaScript" type="text/javascript" src="./jquery-easyui-1.4.5/jquery.easyui.min.js" charset="utf-8"></script> 
  <script language="JavaScript" type="text/javascript" src="./jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>
</head>
<script>
$().ready(function () {
	
	$.ajax({
		url:'./Test/selectMenu.do',
		type:'get',
		async:false,
		success:function(data){
			data=$.parseJSON(data);
			if(data.length>0){
			    $.each(data, function(i, item1){ 
			        child1='<a href="#" id="'+item1['div']+'"class="easyui-linkbutton" style="width:100px;margin:1px;" data-options="iconCls:\''+item1['icon']+'\',size:\'large\',iconAlign:\'top\'">'+item1['title']+'</a>';
				    $('#menu1').append(child1);	
				    var id='#'+item1['div'];
					$(id).data("childs", item1['childSet']);
					if(i==0&&item1['childSet'].length>0){
					    $.each(item1['childSet'], function(j, item2){
					      var child2='<div class="list-group">';
					      if(item2['childSet'].length>0){
					         $.each(item2['childSet'], function(k, item3){
					            child2=child2+'<button type="button" src="'+item3['src']+'" class="list-group-item" style="text-align:center">'+item3['title']+'</button>';
					         })
					       child2=child2+'</div>';
					      }
					      var title=item2['title'];
					     $('#menu2').accordion('add',{
                                                 title:title,
                                                 iconCls:item2['icon'],
                                                 content:child2
                         });
					    })
					}
			     }); 
			     $.parser.parse(); 
			}     
		}
	})
	
	$("#add").click(function () {
		var content = '<iframe id="" src="./index.jsp" allowTransparency="true" scrolling="auto" width="100%" height="100%" frameBorder="0" name=""></iframe>';
           $('<div/>').dialog({
	                  width:'1200px',
	                  height:'800px',
                      title: '窗口',
                      content:content,
                      iconCls: 'icon-edit',
                       modal: true
                  });

	});
	
	function addTab(title, url){
		if ($('#tabs').tabs('exists', title)){
			$('#tabs').tabs('select', title);
		} else {
			var content = '<iframe src="'+url+'" allowTransparency="true"  style="border:0;width:100%;height:100%;" frameBorder="0" ></iframe>';
			$('#tabs').tabs('add',{
				title:title,
				content:content,
				closable:true,
				border : false,
		        fit : true
			});
		}
	}
	
	$(".list-group-item").click(function () {
		addTab($(this).text(),$(this).attr("src"));
	});

    $(".easyui-linkbutton").click(function () {
         var panels = $('#menu2').accordion('panels');
         for (var index=0; index<panels.length;) {
		    $('#menu2').accordion('remove',index);
		 }
		 item1=$(this).data("childs");
         $.each(item1, function(j, item2){
					      var child2='<div class="list-group">';
					      if(item2['childSet'].length>0){
					         var childSet=item2['childSet'];
					         for (var k=0; k<childSet.length; ++k) {
					           child2=child2+'<button type="button" src="'+childSet[k].src+'" class="list-group-item" style="text-align:center">'+childSet[k].title+'</button>';
							 }
					         child2=child2+'</div>';
					      }
					       var title=item2['title'];
					       $('#menu2').accordion('add',{title:title,iconCls:item2['icon'],content:child2});
					    })
		 $.parser.parse(); 
		 $(".list-group-item").click(function () {
		    addTab($(this).text(),$(this).attr("src"));
	     });
		 
	});
	
})

</script>


<body class="easyui-layout" style="min-width:860px;">


<div region="north" style="height:118px;overflow:hidden;">
  
  <div id="cc" class="easyui-layout" style="width:100%;height:118px;">
    <div region="west"   style="width:195px;background-color:Azure;"><image width="193px" height="116px" src="./images/logo.png"></image></div>
    <div region="center"  style="background-color:LightSeaGreen;">
    
         <div style="background-color:Crimson;height:50px;">
              <font color="white" face="verdana" size="6" style="font-family: 'Microsoft YaHei' ! important;"><b>&nbsp;世联行金融会员管理系统&nbsp;&nbsp;</b></font>
              <div style="float:right;overflow:hidden;margin-top:10px;">
                   <div class="easyui-panel" style="padding:2px;background-color:Crimson;">
                        <a id="btn-edit" href="#" class="easyui-menubutton" data-options="menu:'#mm1',iconCls:'icon-man'">江志邦</a>
                   </div>
                   <div id="mm1" style="width:60px;">
                        <div data-options="iconCls:'icon-edit'">修改密码</div>
                        <div class="menu-sep"></div>
                        <div data-options="iconCls:'icon-redo'" id="add">退出</div>
                   </div>  
              </div> 
        </div>  
        <div style="display:inline;width:100%;padding:2px;" id="menu1">
             <!--<a href="#" class="easyui-linkbutton" style="width:100px;" data-options="iconCls:'icon-large-picture',size:'large',iconAlign:'top'">业务管理</a>
             <a href="#" class="easyui-linkbutton" style="width:100px;" data-options="iconCls:'icon-large-clipart',size:'large',iconAlign:'top'">渠道管理</a>
             <a href="#" class="easyui-linkbutton" style="width:100px;" data-options="iconCls:'icon-large-chart',size:'large',iconAlign:'top'">图表管理</a>
             <a href="#" class="easyui-linkbutton" style="width:100px;" data-options="iconCls:'icon-large-shapes',size:'large',iconAlign:'top'">系统管理</a>-->
        </div> 
    
    </div>
  </div>

</div>


<div region="west" split="true" title="导航菜单"   style="width:200px;">
     <div class="easyui-accordion" data-options="border:false,fit:true" id="menu2">
           <!--<div title="系统管理" iconCls="icon-save"  style="overflow:auto;">
               <div class="list-group">
                    <button type="button" id="tab1" class="list-group-item" style="text-align:center">用户管理</button>
                    <button type="button" id="tab"  class="list-group-item" style="text-align:center">菜单管理</button>
                    <button type="button" id="tab2" class="list-group-item" style="text-align:center">角色管理</button>
                    <button type="button" id="tab3" class="list-group-item" style="text-align:center">资源管理</button>
                    <button type="button" id="tab4" class="list-group-item" style="text-align:center">IP管理</button>
               </div>
          </div>
    
         <div title="菜单管理" iconCls="icon-reload"  style="overflow:auto;">
               <div class="list-group">
                    <button type="button" id="tab1" class="list-group-item" style="text-align:center">用户管理</button>
                    <button type="button" id="tab"  class="list-group-item" style="text-align:center">菜单管理</button>
                    <button type="button" id="tab2" class="list-group-item" style="text-align:center">角色管理</button>
                    <button type="button" id="tab3" class="list-group-item" style="text-align:center">资源管理</button>
                    <button type="button" id="tab4" class="list-group-item" style="text-align:center">IP管理</button>
               </div>
         </div>
     --></div>
</div>


<div region="center">
     <div id="tabs" class="easyui-tabs" data-options="border:false,fit:true">
         <div title="首页" style="background:WhiteSmoke;" ></div>
     </div>
</div>


<div region="south" style="height:25px;text-align:center;background-color:LightSteelBlue;padding:3px;">
                © 2016 世联行金融业务平台
</div>

</body>
</html>