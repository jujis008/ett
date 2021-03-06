<%@ page language="java" import="java.util.*" pageEncoding="UTF8"%>
<%@page import="com.smartken.kia.core.model.impl.*"%>
<%@page import="com.smartken.kia.core.util.StringUtil"%>
<%@page import="com.ett.drv.model.self.Km1PreasignRecordModel"%>
<%@page import="com.smartken.kia.core.util.EasyUiUtil"%>
<%@page import="com.ett.drv.model.admin.DictModel"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String km1ActionPath=basePath+"admin/SelfTransactKm1";
String weekPbActionPath=basePath+"booked/WeekPb";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'preasignRecord.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<jsp:include page="/plugin/index.jsp">
	   <jsp:param  name="plugin" value="jquery,easyui"/>
	</jsp:include>
    <jsp:include page="/css/index.jsp"></jsp:include>
    <jsp:include page="/js/index.jsp"></jsp:include>
    
    <%
       
        String tableDG="tableDG";
        String formSearch="formSearch";
        String aSearch="aSearch";
        
        JsListModel cols=new JsListModel();
        JsListModel c1=new JsListModel();
        
        JsMapModel rowKsccname=new JsMapModel();
        rowKsccname.put(EasyUiModel.DataGrid.ColumnProperties.FIELD,Km1PreasignRecordModel.F.Ksccname,true);
        rowKsccname.put(EasyUiModel.DataGrid.ColumnProperties.WIDTH,150);
        rowKsccname.put(EasyUiModel.DataGrid.ColumnProperties.TITLE,"考试场次",true);
        
        JsMapModel rowKsddname=new JsMapModel();
        rowKsddname.put(EasyUiModel.DataGrid.ColumnProperties.FIELD,Km1PreasignRecordModel.F.Ksddname,true);
        rowKsddname.put(EasyUiModel.DataGrid.ColumnProperties.WIDTH,150);
        rowKsddname.put(EasyUiModel.DataGrid.ColumnProperties.TITLE,"考试地点",true);
        
        JsMapModel rowSfzmhm=new JsMapModel();
        rowSfzmhm.put(EasyUiModel.DataGrid.ColumnProperties.FIELD,Km1PreasignRecordModel.F.Sfzmhm,true);
        rowSfzmhm.put(EasyUiModel.DataGrid.ColumnProperties.WIDTH,150);
        rowSfzmhm.put(EasyUiModel.DataGrid.ColumnProperties.TITLE,"身份证号码",true);
        
        JsMapModel rowXm=new JsMapModel();
        rowXm.put(EasyUiModel.DataGrid.ColumnProperties.FIELD,Km1PreasignRecordModel.F.Xm,true);
        rowXm.put(EasyUiModel.DataGrid.ColumnProperties.WIDTH,150);
        rowXm.put(EasyUiModel.DataGrid.ColumnProperties.TITLE,"姓名",true);
        
        JsMapModel rowCreatetime=EasyUiUtil.createDateTimeColumn(Km1PreasignRecordModel.F.TCreatetime.name(),true);
        rowCreatetime.put(EasyUiModel.DataGrid.ColumnProperties.TITLE,"预约时间",true);
        
        JsMapModel rowKsrq=EasyUiUtil.createDateTimeColumn(Km1PreasignRecordModel.F.Ksrq.name(),true);
        rowKsrq.put(EasyUiModel.DataGrid.ColumnProperties.TITLE,"考试时间",true);
        
        
        c1.add(rowSfzmhm);
        c1.add(rowXm);
        c1.add(rowKsccname);
        c1.add(rowKsddname);
        c1.add(rowCreatetime);
        c1.add(rowKsrq);
        cols.add(c1);
    
    
        EasyUiModel dataGrid=new EasyUiModel(JQueryModel.id(tableDG),EasyUiModel.DataGrid.NAME);
        dataGrid.appendAttrs(EasyUiModel.DataGrid.Properties.FIT,true);
        dataGrid.appendAttrs(EasyUiModel.DataGrid.Properties.URL,km1ActionPath+"/datagrid/preasignRecord.action",true);
        dataGrid.appendAttrs(EasyUiModel.DataGrid.Properties.COLUMNS,cols);
        dataGrid.appendAttrs(EasyUiModel.DataGrid.Properties.ID_FIELD,"Id",true);
        dataGrid.appendAttrs(EasyUiModel.DataGrid.Properties.PAGINATION,true);
        dataGrid.appendAttrs(EasyUiModel.DataGrid.Properties.SINGLE_SELECT,true);
        
        JsFunctionModel clickSearchHanlder= new JsFunctionModel("clickSearchHanlder",new String[]{});
        clickSearchHanlder
        .appendContext("{0}.form(\"submit\",'{'",JQueryModel.id(formSearch))
        .appendContext("url:{0}",StringUtil.quota(km1ActionPath+"/search/preasignRecord.action"))
        .appendContext(",success:function(str)'{'var json=Kia.util.strToJson(str); {0}.datagrid(\"loadData\",json); '}'",JQueryModel.id(tableDG))
        .appendContext("});")
        ;
        
        JQueryModel btnSearchClick=new JQueryModel(JQueryModel.id(aSearch),"click");
        btnSearchClick.appendParma(clickSearchHanlder.getFunName());
        
        
        JsContextModel funContext=new JsContextModel();
        funContext.appendScript(clickSearchHanlder);
        
        JsContextModel context=new JsContextModel();
        context.appendScript(dataGrid);
        context.appendScript(btnSearchClick);
    %>
   
   
    <script type="text/javascript">
       <%=funContext.toScirpt()%>
       <%=JQueryModel.DOC_READY_START%>
       <%=context.toScirpt()%>
       <%=JQueryModel.DOC_READY_END %>
    </script>
   
  </head>
  
  <body>
      <div style="height: 10%">
    <form  method="post" id="<%=formSearch %>">
    
         <table class="editTable" cellspacing="0">
            <tr>
              <td >身份证号码:<input name="sfzmhm"/></td>
              <td >姓名:<input name="xm"/></td>
              <td >考试场次:
                   <input name="<%=Km1PreasignRecordModel.F.Kscccode %>" 
                     class="<%=EasyUiModel.ComboBox.CLASS %>"
                     <%=EasyUiModel.ComboBox.Properties.URL(weekPbActionPath+"/combobox/kscc.action") %>
                      <%=EasyUiModel.ComboBox.Properties.TEXT_FIELD(DictModel.F.CDictText.name()) %>
  	                  <%=EasyUiModel.ComboBox.Properties.VALUE_FIELD(DictModel.F.CDictValue.name()) %>
  	                  <%=EasyUiModel.ComboBox.Properties.EDITABLE(false) %>
                   />
              </td>
             <td >考试地点:
                   <input name="<%=Km1PreasignRecordModel.F.Ksddcode %>" 
                     class="<%=EasyUiModel.ComboBox.CLASS %>"
                     <%=EasyUiModel.ComboBox.Properties.URL(weekPbActionPath+"/combobox/ksdd.action") %>
                      <%=EasyUiModel.ComboBox.Properties.TEXT_FIELD(DictModel.F.CDictText.name()) %>
  	                  <%=EasyUiModel.ComboBox.Properties.VALUE_FIELD(DictModel.F.CDictValue.name()) %>
  	                  <%=EasyUiModel.ComboBox.Properties.EDITABLE(false) %>
                   />
              </td>
              <td >预约时间:<input name="createtime" class="<%=EasyUiModel.DateBox.CLASS %>" /></td>
              <td style="width: 200px;">
                 <a class="<%=EasyUiModel.LinkButton.CLASS %>"  id="<%=aSearch %>"
                    <%=EasyUiModel.LinkButton.Properties.ICON_CLS(EasyUiModel.ICON_SEARCH) %>
                 >查询</a>
              </td>         
            </tr>
         </table>
       </form>
     </div>  
   <div class="innerDiv" style="height: 90%">
   <table id="<%=tableDG %>"></table>
   </div>
      
  </body>
</html>
