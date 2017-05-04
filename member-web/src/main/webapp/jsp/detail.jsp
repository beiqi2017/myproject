<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>菜单管理</title>
		<link rel="stylesheet" type="text/css" href="./../jquery-easyui-1.4.5/themes/default/easyui.css">
		<!--引入CSS样式-->
		<link rel="stylesheet" type="text/css" href="./../jquery-easyui-1.4.5/themes/icon.css">
		<!--Icon引入-->
		<script language="JavaScript" type="text/javascript" src="./../jquery-easyui-1.4.5/jquery.min.js" charset="utf-8"></script>
		<script language="JavaScript" type="text/javascript" src="./../jquery-easyui-1.4.5/jquery.easyui.min.js" charset="utf-8"></script>
		<script language="JavaScript" type="text/javascript" src="./../jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="./detail.js"></script>
	</head>
<script>
$(document).ready(function(){
var record=parent.grid.datagrid("getSelected");
	for(var data in record){  
		$("label[name='"+data+"']").html(record[data]);
		}
})
</script>
	<body data-options='fit:true'>
<form id="cpShowForm" method="post">
    <table style="height:100%;width:95%" class="table" align="center" style="margin-top:5px" >
        <tr>
			<td style="text-align:right" width="120px"><b style="color:red">*</b>公司编码:</td>
			<td ><label name="id"></label></td>
		</tr>
		<tr>
			<td style="text-align:right"><b style="color:red">*</b>公司简称:</td>
			<td ><label name="title"></label></td>
		</tr>
		<tr>
			<td style="text-align:right"><b style="color:red">*</b>公司全称:</td>
			<td ><label name="div"></label></td>
		</tr>
		<tr>
			<td style="text-align:right"><b style="color:red">*</b>公司等级:</td>
			<td ><label name="src"></label></td>
		</tr>
		<tr>
			<td style="text-align:right"><b style="color:red">*</b>合作状态:</td>
			<td ><label name="icon"></label></td>
		</tr>
		<tr>
			<td style="text-align:right"><b style="color:red">*</b>合作开始时间:</td>
			<td ><label name="parent"></label></td>
		</tr>
		<tr>
			<td style="text-align:right"><b style="color:red">*</b>公司地址:</td>
			<td ><label name="level"></label></td>
		</tr>
		<tr align="center">
		    <td colspan="2"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo'" onclick="javascript:parent.dialog.dialog('close')">取消</a></td>
		</tr>
	</table>
</form>
</body>
</html>