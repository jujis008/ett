<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.smartken.kia.core.model.impl.EasyUiModel"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'menuConfig-success.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<jsp:include page="/plugin/index.jsp">
	 <jsp:param value="jquery,easyui" name="plugin"/>
	</jsp:include>
	<jsp:include page="/js/index.jsp"></jsp:include>
   <jsp:include page="/css/index.jsp"></jsp:include>
   
   
   <script type="text/javascript">
    
   function clickSave(){
	   
	   $.messager.confirm('操作提示','确认保存',function(yes){
		   if(yes){
			   $("#formUser").form('submit',{
				   url:"http://localhost:8080/webapp/admin/User/do/editUser.action"
				   ,
				   success:function(str){
					   var json=Kia.util.strToJson(str);
					   Kia.util.handleJsonResult(json);
				   }
			   });
		   }
	   })
   }
   
   </script>
   
  </head>
 
  <body><%--
   修改用户页面 ${fullName}
   <form name="form">
   		<input name="name" type="text" value="${loginName}">
   </form>
   --%><div class="innerDiv">
     <form id="formUser"  method="post">
       <table class="editTable" cellspacing="0">
         <tbody>
           <tr>
             <th>用户名</th>
             <td style="width: 35%">
               <input name="CLoginName" type="text"  value="${CLoginName}" />
             </td>
            <th>密码</th>
             <td style="width: 35%">
               <input name="CPwd" type="text"  value="${CPwd}" />
             </td>
           </tr>
           <tr>
            <th>工作号</th>
             <td style="width: 35%">
               <input name="CWorkid" type="text" value="${CWorkid}" />
             </td>
            <th>角色号</th>
             <td style="width: 35%">
              <input name="IRoleid" value="${IRoleid}" />
             </td>
           </tr>
           <tr>
            <th>状态</th>
             <td style="width: 35%">
               <input name="CState"  type="text" value="${CState}" />
             </td>
            <th>卡号</th>
             <td style="width: 35%">
               <input name="CIdcard"  type="text" value="${CIdcard}" />
             </td>
           </tr>
           <tr>
            <th>部门编号</th>
             <td style="width: 35%">
               <input name="CWorkid"  type="text" value="${CWorkid}" />
             </td>
            <th>全名</th>
             <td style="width: 35%">
               <input name="CFullName" value="${CFullName}" />
             </td>
           </tr>
           <tr>
           <th>开始IP</th>
             <td style="width: 35%">
               <input name="CBeginip" type="text" value="${CBeginip}" />
             </td>
              <th>结束IP</th> 
             <td style="width: 35%">
               <input name="CEndip" type="text" value="${CEndip}" />
             </td>
           </tr>
           <tr>
             <td colspan="4" style="text-align: right">
             <a class="<%=EasyUiModel.LinkButton.CLASS %>"
                <%=EasyUiModel.LinkButton.Properties.ICON_CLS(EasyUiModel.ICON_SAVE) %>
                onclick="clickSave()" 
             >保存</a>
           </tr>
         </tbody>
       </table>
      </form>
    </div>
</body>
</html>