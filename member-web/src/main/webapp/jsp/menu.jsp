<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>菜单管理</title>
		<link rel="icon" href="images/logo.png" type="image/x-icon" />
		<link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="./../jquery-easyui-1.4.5/themes/default/easyui.css">
		<!--引入CSS样式-->
		<link rel="stylesheet" type="text/css" href="./../jquery-easyui-1.4.5/themes/icon.css">
		<!--Icon引入-->
		<script language="JavaScript" type="text/javascript" src="./../jquery-easyui-1.4.5/jquery.min.js" charset="utf-8"></script>
		<script language="JavaScript" type="text/javascript" src="./../jquery-easyui-1.4.5/jquery.easyui.min.js" charset="utf-8"></script>
		<script language="JavaScript" type="text/javascript" src="./../jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>
	</head>
	<script>
var grid,dialog;
function show(){
      var row = $("#grid").datagrid("getSelected");
      if (row){
		    var content = '<iframe id="" src="./detail.jsp" allowTransparency="true" scrolling="auto" width="100%" height="100%" frameBorder="0" name=""></iframe>';
            dialog=$('<div/>').dialog({
	                  width:'500px',
	                  height:'250px',
                      title: '窗口',
                      content:content,
                      iconCls: 'icon-edit',
                       modal: true
                  });

     }else{
		$.messager.alert("提示","请选择记录！","info");
	 }
    }
    
    
$().ready(function() {
	grid = $('#grid').datagrid( {
		url : './../Test/menuList.do',
		striped : true,
		rownumbers : true,
		pagination : true,
		singleSelect : true,
		idField : 'id',
		sortOrder : 'desc',
		pageSize : 5,
		fit: true,  
		pageList : [ 5, 10, 20, 30, 40, 50 ],
		fitColumns : true,
		frozenColumns : [ [ {
			title : 'ID',
			field : 'id',
			width : 100,
			sortable : true
		} ] ],
		columns : [ [ {
			title : '名称',
			align : 'center',
			width : 100,
			field : 'title'
		}, {
			title : 'div',
			field : 'div',
			width : 100,
			align : 'center'
		}, {
			title : '路径',
			field : 'src',
			width : 100,
			align : 'center'
		}, {
			title : '图标',
			field : 'icon',
			width : 100,
			align : 'center'
		}, {
			title : '上级ID',
			field : 'parent',
			width : 100,
			align : 'center'
		}, {
			title : '等级',
			field : 'level',
			width : 100,
			align : 'center'
		} ] ],
		toolbar : "#toolbar",
		loadFilter : function(data) {
			if (data.success) {
				return data.result;
			} else {
				$.messager.alert("提示", data.error.msg, "error");
			}
		}
	});
	
	 $.fn.serializeObject = function() {  
            var o = {};  
            var a = this.serializeArray();  
            $.each(a, function() {  
                if (o[this.name]) {  
                    if (!o[this.name].push) {  
                        o[this.name] = [ o[this.name] ];  
                    }  
                    o[this.name].push(this.value || '');  
                } else {  
                    o[this.name] = this.value || '';  
                }  
            });  
            return o;  
        }  
	
	
	 $("#searchBtn").click(function () {
		
		grid.datagrid('load',$("form").serializeObject());
		grid.datagrid('clearSelections');

	});
});
</script>
	<body style="overflow:auto;">
	  <div class="easyui-layout" data-options="border:false,fit:true">
		<div region="north" class="easyui-panel"  style="height:126px;">
			<form id="searchForm">
            <table style="background-color:WhiteSmoke;width:100%">
                <tr style="height:30px;">
                    <td style="text-align:center">ID:</td>
                    <td><input name="id" class="f1 easyui-textbox"></input></td>
                    <td style="text-align:center">菜单名称:</td>
                    <td><input name="name" class="f1 easyui-textbox"></input></td>
                </tr>
               
                <tr style="height:30px;">
                    <td style="text-align:center">上级:</td>
                    <td><input name="parent" class="f1 easyui-textbox"></input></td>
                    <td style="text-align:center">等级:</td>
                    <td><input name="level" class="f1 easyui-textbox"></input></td>
                </tr>
                <tr style="height:30px;">
                  <td></td>
                  <td> 
                       <a href="javascript:void(0)" id="searchBtn"  class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
				       <a href="javascript:void(0)"  class="easyui-linkbutton"  data-options="iconCls:'icon-undo'" onclick="$('.easyui-validatebox').val('');$('#searchForm input').val('');">清空</a> 
				  </td>
				</tr>
            </table>
            </form>
            <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="show();" securityKey="CP_LIST|DESC" >查看</a>
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="update();" securityKey="CP_LIST|UPDATE">修改</a>
		</div>
		<div region="center">
		   <table id="grid"></table>
		</div>
	  </div>
	</body>
</html>