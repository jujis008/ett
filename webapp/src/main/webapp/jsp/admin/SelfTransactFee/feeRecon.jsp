<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="com.smartken.kia.core.model.impl.*"%>
<%@page import="com.smartken.kia.core.util.StringUtil"%>
<%@page import="com.ett.drv.model.self.FeeLogModel"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String feeActionPath=basePath+"admin/SelfTransactFee";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'feeLog.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  
    <jsp:include page="/plugin/index.jsp">
	   <jsp:param  name="plugin" value="jquery,easyui"/>
	</jsp:include>
    <jsp:include page="/css/index.jsp"></jsp:include>
    <jsp:include page="/js/index.jsp"></jsp:include>
    
    <%
       
        String tableDG="tableDG";
    String aSearch="aSearch";
    String formSearch="formSearch";
    
        JsListModel cols=new JsListModel();
        JsListModel c1=new JsListModel();
        
        
        JsMapModel rowFeewaytype=new JsMapModel();
        rowFeewaytype.put(EasyUiModel.DataGrid.ColumnProperties.FIELD,FeeLogModel.F.Feewaytype,true);
        rowFeewaytype.put(EasyUiModel.DataGrid.ColumnProperties.WIDTH,150);
        rowFeewaytype.put(EasyUiModel.DataGrid.ColumnProperties.TITLE,"缴费方式",true);
        
        JsMapModel rowMoney=new JsMapModel();
        rowMoney.put(EasyUiModel.DataGrid.ColumnProperties.FIELD,FeeLogModel.F.Money,true);
        rowMoney.put(EasyUiModel.DataGrid.ColumnProperties.WIDTH,150);
        rowMoney.put(EasyUiModel.DataGrid.ColumnProperties.TITLE,"业务费用",true);
        
        JsMapModel rowCreatetime=new JsMapModel();
        rowCreatetime.put(EasyUiModel.DataGrid.ColumnProperties.FIELD,FeeLogModel.F.TCreatetime,true);
        rowCreatetime.put(EasyUiModel.DataGrid.ColumnProperties.WIDTH,150);
        rowCreatetime.put(EasyUiModel.DataGrid.ColumnProperties.TITLE,"缴费日期",true);
        //rowCreatetime.put(EasyUiModel.DataGrid.ColumnProperties.FORMATTER,"dateboxFormatter");
        
        JsMapModel rowBustype=new JsMapModel();
        rowBustype.put(EasyUiModel.DataGrid.ColumnProperties.FIELD,FeeLogModel.F.Bustype,true);
        rowBustype.put(EasyUiModel.DataGrid.ColumnProperties.WIDTH,150);
        rowBustype.put(EasyUiModel.DataGrid.ColumnProperties.TITLE,"业务类型",true);
        
        JsMapModel rowDetail=new JsMapModel();
        rowDetail.put(EasyUiModel.DataGrid.ColumnProperties.FIELD,FeeLogModel.F.Detail,true);
        rowDetail.put(EasyUiModel.DataGrid.ColumnProperties.WIDTH,150);
        rowDetail.put(EasyUiModel.DataGrid.ColumnProperties.TITLE,"明细",true);
        
        
        JsMapModel rowSfzmhm=new JsMapModel();
        rowSfzmhm.put(EasyUiModel.DataGrid.ColumnProperties.FIELD,FeeLogModel.F.Sfzmhm,true);
        rowSfzmhm.put(EasyUiModel.DataGrid.ColumnProperties.WIDTH,150);
        rowSfzmhm.put(EasyUiModel.DataGrid.ColumnProperties.TITLE,"身份证号码",true);
        
        JsMapModel rowXm=new JsMapModel();
        rowXm.put(EasyUiModel.DataGrid.ColumnProperties.FIELD,FeeLogModel.F.Xm,true);
        rowXm.put(EasyUiModel.DataGrid.ColumnProperties.WIDTH,150);
        rowXm.put(EasyUiModel.DataGrid.ColumnProperties.TITLE,"姓名",true);
        

        
        
        c1.add(rowSfzmhm);
        c1.add(rowXm);
        c1.add(rowBustype);
        c1.add(rowFeewaytype);
        c1.add(rowMoney);
        c1.add(rowDetail);
        c1.add(rowCreatetime);
        
        cols.add(c1);
    
    
        EasyUiModel dataGrid=new EasyUiModel(JQueryModel.id(tableDG),EasyUiModel.DataGrid.NAME);
        dataGrid.appendAttrs(EasyUiModel.DataGrid.Properties.FIT,true);
        //dataGrid.appendAttrs(EasyUiModel.DataGrid.Properties.URL,feeActionPath+"/datagrid/feeLog.action",true);
        dataGrid.appendAttrs(EasyUiModel.DataGrid.Properties.COLUMNS,cols);
        //dataGrid.appendAttrs(EasyUiModel.DataGrid.Properties.PAGINATION,true);
        dataGrid.appendAttrs(EasyUiModel.DataGrid.Properties.SINGLE_SELECT,true);
        
        JsFunctionModel clickSearchHanlder= new JsFunctionModel("clickSearchHanlder",new String[]{});
        clickSearchHanlder
        .appendContext("{0}.form(\"submit\",'{'",JQueryModel.id(formSearch))
        .appendContext("url:{0}",StringUtil.quota(feeActionPath+"/search/feeLog.action"))
        .appendContext(",success:function(str)'{'var json=Kia.util.strToJson(str); {0}.datagrid(\"loadData\",json); '}'",JQueryModel.id(tableDG))
        .appendContext("});")
        ;
        
        JQueryModel btnSearchClick=new JQueryModel(JQueryModel.id(aSearch),"click");
        btnSearchClick.appendParma(clickSearchHanlder.getFunName());
        
        
        JsContextModel funContext=new JsContextModel();
        funContext.appendScript(clickSearchHanlder);
        
        JsContextModel context=new JsContextModel();
        context.appendScript(dataGrid);
        //context.appendScript(btnSearchClick);
        context.appendScript("{0}.datagrid(\"loadData\",datagridFeeLog);",JQueryModel.id(tableDG));
    %>
   
   
    <script type="text/javascript">
       var datagridFeeLog=${datagridFeeLog};
       <%=funContext.toScirpt()%>
       <%=JQueryModel.DOC_READY_START%>
       <%=context.toScirpt()%>
       <%=JQueryModel.DOC_READY_END %>
    </script>
   

  </head>
  
  <body>
   <div style="height: 25%">
    <form  method="post" id="<%=formSearch %>" action="<%=feeActionPath %>/to/feeRecon.action">
    
         <table class="editTable" cellspacing="0">
            <tr>
              <td style="width: 300px;">对账日期:<input name="cTime" class="<%=EasyUiModel.DateBox.CLASS %>" /></td>
              <td>
                 <a class="<%=EasyUiModel.LinkButton.CLASS %>"  id="<%=aSearch %>"
                    <%=EasyUiModel.LinkButton.Properties.ICON_CLS(EasyUiModel.ICON_SEARCH) %>
                    onclick="document.getElementById('<%=formSearch %>').submit();"
                 >查询</a>
              </td>         
            </tr>
         </table>
      </form>
         <p/>
         
      <form  method="post" id="formSyn" action="<%=feeActionPath %>/do/feeRecon.action">
        <input name="cTime" value="${cTime }" type="hidden" />
        
        <table class="editTable" cellspacing="0">
           <tr>
             <th>总业务数 ：</th>
              <td>${feeRecon.tranCount}</td>
              <th>现金总额</th>
              <td>${feeRecon.cashTotal}</td>
              <th>银联pos总额</th>
              <td>${feeRecon.posTotal}</td>
              <th>缴费总额</th>
              <td>${feeRecon.cashTotal+feeRecon.posTotal}</td>
            </tr>
            
           <tr>
              <th>对账日期:</th>
              <td>&nbsp;${cTime }</td> 
              <th>对账状态:</th>
              <td>&nbsp;${feeRecon.syn}</td> 
              <td colspan="4">
                <a class="<%=EasyUiModel.LinkButton.CLASS %>"  
                    <%=EasyUiModel.LinkButton.Properties.ICON_CLS(EasyUiModel.ICON_OK) %>
                    onclick="document.getElementById('formSyn').submit();"
                 >对账</a>
              </td>
            </tr>
         </table>
       </form>
     </div>  
  <br />
      <div class="innerDiv" style="height: 70%">
   <table id="<%=tableDG %>"></table>
   </div>
      
  </body>
</html>
