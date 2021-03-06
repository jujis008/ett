<%@ page language="java" import="java.util.*,com.smartken.kia.core.model.impl.*" pageEncoding="UTF-8"%>
<%@page import="com.smartken.kia.core.util.StringUtil"%>
<%@page import="com.smartken.kia.core.model.impl.EasyUiModel.DataGrid"%>
<%@page import="com.ett.drv.model.booked.BookedWeekRecordModel"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String bookedWeekPbPath=basePath+"booked/WeekPb";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  	<jsp:include page="/plugin/index.jsp">
	 <jsp:param value="jquery,easyui" name="plugin"/>
	</jsp:include>
    <jsp:include page="/css/index.jsp"></jsp:include>
    <jsp:include page="/js/index.jsp"></jsp:include>
    
    <script type="text/javascript">
    
    function operaFormatter(value,rowData,rowIndex){
    	var weekNum=rowData['IWeekNum'];
    	var href="<%=bookedWeekPbPath%>/to/assign.action?weekNum="+weekNum;
    	var a="<a class='kia-icon edit' href='"+href+"' target='_blank' ></a>";
    	return a;
    }
    
    function checkedFormatter(value,rowData,rowIndex){
    	if(value==1) 
    	{return '已审核';} 
    	else { return '未审核'; }
    }
    
    <%= JQueryModel.DOC_READY_START %>
           var innerHeight=$("#innerDiv").outerHeight(false);
	       var innerWidth=$("#innerDiv").width();
	       <% 
	    String tableWeekPb="tableWeekPb";
        EasyUiModel weekPbDG=new EasyUiModel(JQueryModel.id(tableWeekPb),EasyUiModel.DataGrid.NAME);
        weekPbDG.appendAttrs(DataGrid.Properties.TITLE,StringUtil.quota("周排班列表"))
        .appendAttrs(DataGrid.Properties.URL,"booked/WeekPb/datagrid/weekRecords.action?format=json",true)
        .appendAttrs(EasyUiModel.DataGrid.Properties.WIDTH,"innerWidth")
        .appendAttrs(EasyUiModel.DataGrid.Properties.HEIGHT,"innerHeight")
        .appendAttrs(EasyUiModel.DataGrid.Properties.PAGINATION,true)
        .appendAttrs(EasyUiModel.DataGrid.Properties.ID_FIELD,"Id",true)
        //.appendAttrs(EasyUiModel.DataGrid.Events.ON_DBL_CLICK_ROW,new JsFunctionModel(new String[]{"index,data"}).appendContext("document.location.href='"+bookedWeekPbPath+"/to/assign.action?weekNum='+data['IWeekNum']"))
        .appendAttrs(EasyUiModel.DataGrid.Properties.VIEW,EasyUiModel.VIEW_GROUP)
        .appendAttrs(EasyUiModel.DataGrid.Properties.GROUP_FIELD,BookedWeekRecordModel.F.IChecked,true)
        ;
        
        List weekPbColumns=new JsListModel();
        List weekPbR1=new JsListModel();
        JsMapModel<String,Object> weekPbR1C1=new JsMapModel<String,Object>();
        weekPbR1C1.put(EasyUiModel.DataGrid.ColumnProperties.TITLE,"编号",true);
        weekPbR1C1.put(EasyUiModel.DataGrid.ColumnProperties.FIELD,BookedWeekRecordModel.F.Id,true);
        weekPbR1C1.put(EasyUiModel.DataGrid.ColumnProperties.CHECKBOX,true);
        weekPbR1C1.put(EasyUiModel.DataGrid.ColumnProperties.WIDTH,50);
        JsMapModel<String,Object> weekPbR1C2=new JsMapModel<String,Object>();
        weekPbR1C2.put(EasyUiModel.DataGrid.ColumnProperties.TITLE,"第几周",true);
        weekPbR1C2.put(EasyUiModel.DataGrid.ColumnProperties.FIELD,BookedWeekRecordModel.F.IWeekNum,true);
        weekPbR1C2.put(EasyUiModel.DataGrid.ColumnProperties.WIDTH,50);
        JsMapModel<String,Object> weekPbR1C3=new JsMapModel<String,Object>();
        weekPbR1C3.put(EasyUiModel.DataGrid.ColumnProperties.TITLE,"时间范围",true);
        weekPbR1C3.put(EasyUiModel.DataGrid.ColumnProperties.FIELD,BookedWeekRecordModel.F.CWeekRange,true);
        weekPbR1C3.put(EasyUiModel.DataGrid.ColumnProperties.WIDTH,200);
        JsMapModel<String,Object> weekPbR1C4=new JsMapModel<String,Object>();
        weekPbR1C4.put(EasyUiModel.DataGrid.ColumnProperties.TITLE,"提交人/审核人",true);
        weekPbR1C4.put(EasyUiModel.DataGrid.ColumnProperties.FIELD,BookedWeekRecordModel.F.CCheckOperator,true);
        weekPbR1C4.put(EasyUiModel.DataGrid.ColumnProperties.WIDTH,150);
        JsMapModel<String,Object> weekPbR1C5=new JsMapModel<String,Object>();
        weekPbR1C5.put(EasyUiModel.DataGrid.ColumnProperties.TITLE,"审核结果",true);
        weekPbR1C5.put(EasyUiModel.DataGrid.ColumnProperties.FIELD,BookedWeekRecordModel.F.IChecked,true);
        weekPbR1C5.put(EasyUiModel.DataGrid.ColumnProperties.WIDTH,100);         
        weekPbR1C5.put(EasyUiModel.DataGrid.ColumnProperties.FORMATTER,"checkedFormatter");
        
        JsMapModel<String,Object> weekPbR1C6=new JsMapModel<String,Object>();
        weekPbR1C6.put(EasyUiModel.DataGrid.ColumnProperties.WIDTH,80);
        weekPbR1C6.put(EasyUiModel.DataGrid.ColumnProperties.TITLE,"操作",true);
        weekPbR1C6.put(EasyUiModel.DataGrid.ColumnProperties.FIELD,"xxx",true);
        weekPbR1C6.put(EasyUiModel.DataGrid.ColumnProperties.FORMATTER,"operaFormatter");

                 
        weekPbR1.add(weekPbR1C1);
        weekPbR1.add(weekPbR1C2);
        weekPbR1.add(weekPbR1C3);
        weekPbR1.add(weekPbR1C4);
        weekPbR1.add(weekPbR1C5);
        weekPbR1.add(weekPbR1C6);
        weekPbColumns.add(weekPbR1);
        weekPbDG.appendAttrs(EasyUiModel.DataGrid.Properties.COLUMNS,weekPbColumns);
	       %> 
            <%= weekPbDG.toScirpt() %>
            <%= JQueryModel.DOC_READY_END %>
    </script>
    
  </head>
  
  <body class="<%=EasyUiModel.Layout.CLASS %>">
    <div  <%=EasyUiModel.Layout.Properties.REGION(EasyUiModel.REGION_NORTH) %>  style="overflow: hidden;">
     <form action="<%=bookedWeekPbPath %>/to/assign.action" method="post" id="formWeekPb">
      <table class="editTable" cellspacing="0" style="width: 100%">
           <tr>
              <td style="text-align: right;">
                  <input class="<%=EasyUiModel.DateBox.CLASS %>"  name="createDate"  
                    <%=EasyUiModel.ValidateBox.Properties.REQUIRED(true) %>
                    <%=EasyUiModel.Combo.Properties.EDITABLE(false) %>
                    <%=EasyUiModel.ValidateBox.Properties.MISSING_MESSAGE("必须输入日期") %>
                  /> 
                  <a  class="<%=EasyUiModel.LinkButton.CLASS %>"  <%=EasyUiModel.LinkButton.Properties.ICON_CLS(EasyUiModel.ICON_ADD) %>
                      onclick="var isVerify=$('#formWeekPb').form('validate');if(isVerify){ $('#formWeekPb').submit();} "     
                  >创建排班</a>
              </td>
           </tr>
      </table>
      </form>
    </div>
  	<div <%=EasyUiModel.Layout.Properties.REGION(EasyUiModel.REGION_CENTER) %>>
	<table id="<%=tableWeekPb %>"></table>
	</div>
  </body>
</html>
