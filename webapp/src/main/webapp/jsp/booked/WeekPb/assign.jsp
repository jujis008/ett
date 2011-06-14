<%@ page language="java" import="java.util.*,com.smartken.kia.core.model.impl.EasyUiModel" pageEncoding="UTF-8"%>
<%@page import="com.smartken.kia.core.model.impl.JQueryModel"%>
<%@page import="com.smartken.kia.core.model.impl.JsFunctionModel"%>
<%@page import="com.smartken.kia.core.util.StringUtil"%>
<%@page import="com.smartken.kia.core.model.impl.JsMapModel"%>
<%@page import="com.smartken.kia.core.model.impl.EasyUiMessager"%>
<%@page import="com.smartken.kia.core.model.impl.JsContextModel"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
    
    
    <%= JQueryModel.DOC_READY_START %>
        <%  
           String divAddLimit="divAddLimit"; 
           String divEditLimit="divEditLimit";      
           String aEditLimit="aEditLimit";
           String aRemoveLimit="aRemoveLimit";
           String aEditFpNum="aEditFpNum";
           String aAddLimit="aAddLimit";
           String aRemoveLimits="aRemoveLimits";
           String txtSearchDate="txtSearchDate";
           String aBack="aBack";
           String aSaveWeek="aSaveWeek";
           String txtLimitNum="txtLimitNum";

           EasyUiModel searchDateBox=new EasyUiModel(JQueryModel.id(txtSearchDate),EasyUiModel.DateBox.NAME);
           searchDateBox.appendAttrs(EasyUiModel.DateBox.Properties.FORMATTER,"function(date){return date.getFullYear()+\"-\"+(date.getMonth()+1)+\"-\"+date.getDate();}");
           
           EasyUiModel numspiLimitNum=new EasyUiModel(JQueryModel.cls(txtLimitNum),EasyUiModel.NumberSpinner.NAME);
           numspiLimitNum
           .appendAttrs(EasyUiModel.Spinner.Properties.MIN,-1)
           .appendAttrs(EasyUiModel.Spinner.Properties.INCREMENT,10)
           ;
           
           JsFunctionModel handlerAddLimitClick=new JsFunctionModel(null);
           handlerAddLimitClick
            .appendContext("var limitId=$(this).attr('id');")
            .appendContext("var dw=limitId.split(',')[0];")
            .appendContext("var km=limitId.split(',')[1];")   
               //.appendContext("var total=limitId.split(',')[1];")
            .appendContext("var ldate=limitId.split(',')[2];")
            .appendContext("var parma=$.param({dw:dw,km:km,ksrq:ldate});")
            .appendContext("{0}.html(\"{1}\");",JQueryModel.id(divEditLimit),JsFunctionModel.iframe(basePath+"booked/WeekPb/to/addLimit.action?\"+parma+\""))
            .appendContext(
                 new EasyUiModel(JQueryModel.id(divEditLimit),EasyUiModel.Dialog.NAME)
                   .appendAttrs(EasyUiModel.Dialog.Properties.WIDTH,400)
                   .appendAttrs(EasyUiModel.Dialog.Properties.HEIGHT,300)
                   .appendAttrs(EasyUiModel.Dialog.Properties.MODAL,true)
                   .appendAttrs(EasyUiModel.Dialog.Properties.TITLE,"\"新增分配项目-\"+ldate")
                   .appendAttrs(EasyUiModel.Dialog.Events.ON_CLOSE,new JsFunctionModel(null).appendContext("location.href='"+basePath+"booked/WeekPb/reload/assign.action';"))
               )
            .appendContext("return false;")
           ;
           
           JQueryModel btnAddLimit=new JQueryModel(JQueryModel.cls(aAddLimit),JQueryModel.Events.CLICK);
           btnAddLimit.appendParma(handlerAddLimitClick);
           
           JsFunctionModel handlerRemoveLimitsClick=new JsFunctionModel(null);
           handlerRemoveLimitsClick
            .appendContext("var limitId=$(this).attr('id');")
            .appendContext("var dw=limitId.split(',')[0];")
            .appendContext("var km=limitId.split(',')[1];")   
               //.appendContext("var total=limitId.split(',')[1];")
           // .appendContext("var ldate=limitId.split(',')[2];")
            .appendContext("$.get('"+basePath+"booked/WeekPb/do/removeLimits.action',{dw:dw,km:km},function(data){location.href='"+basePath+"booked/WeekPb/reload/assign.action';});")
           ;

           JsFunctionModel handlerBtnEditFpNumClick=new JsFunctionModel(null);
           handlerBtnEditFpNumClick
           .appendContext("$.post")
           ;
           
           JQueryModel btnEditFpNum=new JQueryModel(StringUtil.formatId(true,"#",null,aEditFpNum));

           
           JQueryModel btnRemoveLimits=new JQueryModel(JQueryModel.cls(aRemoveLimits),JQueryModel.Events.CLICK);
           btnRemoveLimits.appendParma(handlerRemoveLimitsClick);
           
          
           JQueryModel btnEditLimit=new JQueryModel(JQueryModel.cls(aEditLimit),JQueryModel.Events.CLICK);
           btnEditLimit.appendParma(
               new JsFunctionModel(null)
               .appendContext("var limitId=$(this).attr('id');")
               .appendContext("var key=limitId.split(',')[0];")
               .appendContext("var keys=key.split('_');")   
               //.appendContext("var total=limitId.split(',')[1];")
               .appendContext("var ldate=limitId.split(',')[1];")
               .appendContext("{0}.html(\"{1}\");",JQueryModel.id(divEditLimit),JsFunctionModel.iframe(basePath+"booked/WeekPb/to/editLimit.action?limitKey=\"+key+\""))
               .appendContext(
                 new EasyUiModel(JQueryModel.id(divEditLimit),EasyUiModel.Dialog.NAME)
                   .appendAttrs(EasyUiModel.Dialog.Properties.WIDTH,400)
                   .appendAttrs(EasyUiModel.Dialog.Properties.HEIGHT,300)
                   .appendAttrs(EasyUiModel.Dialog.Properties.MODAL,true)
                   .appendAttrs(EasyUiModel.Dialog.Properties.TITLE,"\"修改分配项目-\"+ldate")
                   .appendAttrs(EasyUiModel.Dialog.Events.ON_CLOSE,new JsFunctionModel(null).appendContext("location.href='"+basePath+"booked/WeekPb/reload/assign.action';"))
               )
               .appendContext("return false;")
           );
           
           JQueryModel btnRemoveLimit=new JQueryModel(JQueryModel.cls(aRemoveLimit),JQueryModel.Events.CLICK);
           btnRemoveLimit.appendParma(
                   new JsFunctionModel(null)
                   .appendContext("var limitId=$(this).attr('id');")
                   .appendContext(
                       new JQueryModel(JQueryModel.Ajax.GET)
                       .appendParma(basePath+"booked/WeekPb/do/removeLimit.action",true)
                       .appendParma("{limitKey:limitId}")
                       .appendParma(new JsFunctionModel(new String[]{"data"})
                                      .appendContext("location.href='"+basePath+"booked/WeekPb/reload/assign.action';")
                       )
                   )
           );
           
           
           EasyUiModel btnBack=new EasyUiModel(JQueryModel.id(aBack),EasyUiModel.LinkButton.NAME );
           btnBack.appendAttrs(EasyUiModel.LinkButton.Properties.ICON_CLS,EasyUiModel.ICON_BACK,true);
 
           EasyUiModel btnSaveWeek=new EasyUiModel(JQueryModel.id(aSaveWeek),EasyUiModel.LinkButton.NAME );
           btnSaveWeek.appendAttrs(EasyUiModel.LinkButton.Properties.ICON_CLS,EasyUiModel.ICON_SAVE,true);
        
 
           JsContextModel context=new JsContextModel();
           context
           .appendScript(searchDateBox)
           .appendScript(numspiLimitNum)
           .appendScript(btnBack)
           .appendScript(btnSaveWeek)
           .appendScript(btnAddLimit)
           .appendScript(btnEditLimit)
           .appendScript(btnRemoveLimit)
           .appendScript(btnRemoveLimits)
           ; 
        %>      
       
      <%= context.toScirpt() %>
   
      
    <%= JQueryModel.DOC_READY_END %>
    
    </script>
    
  </head>
  
  <body>
  	<div class="innerDiv" id="innerDiv">
  	<form action="<%=basePath %>booked/WeekPb/to/assign.action" method="post">
	  	<table  class="editTable" cellpadding="1" cellspacing="0" style="width: 100%" >
	  	  <tr>
	  	    <td style="width: 200px">排班日期： </td>
	  	    <td><input id="<%=txtSearchDate %>" name="searchDate" />
	  	    <button type="submit"><div class="kia-icon search"></div>查询</button>
	  	    </td>
	  	  </tr>
	  	</table>
  	</form>
  	
  	  
  	   <table  class="editTable" cellpadding="1" cellspacing="0" style="width:100%">
  	     <thead>
  	        <tr>
  	          <td  style="width:180px" >星期</td>
  	          <td style="width:100px">科目</td>
  	          <td style="width:250px">分配总数</td>
  	          <td style="width:150px">已分配/剩余</td>
  	          <td style="width:500px">分配明细</td>
  	        </tr>
  	        

  	     </thead>
  	     <tbody>

  	       <tr>
  	        
  	           <s:iterator value="#{'一':1,'二':2,'三':3,'四':4,'五':5,'六':6,'日':7}" id="dw" >
  	           
  	           <s:iterator value="#{'一':1,'二':2,'三':3}" id="km" >
  	           <s:if test="#km.value eq 1">
  	           <td rowspan="3">星期<s:property value="#dw.key"/> <br/>
  	             <s:if test="#dw.value eq 1"><s:date name="monday" format="yyyy-MM-dd"/></s:if>
  	             <s:elseif test="#dw.value eq 2"><s:date name="tuesday" format="yyyy-MM-dd"/></s:elseif>
  	             <s:elseif test="#dw.value eq 3"><s:date name="wednesday" format="yyyy-MM-dd"/></s:elseif>
  	             <s:elseif test="#dw.value eq 4"><s:date name="thursday" format="yyyy-MM-dd"/></s:elseif>
  	             <s:elseif test="#dw.value eq 5"><s:date name="friday" format="yyyy-MM-dd"/></s:elseif>
  	             <s:elseif test="#dw.value eq 6"><s:date name="saturday" format="yyyy-MM-dd"/></s:elseif>
  	             <s:elseif test="#dw.value eq 7"><s:date name="sunday" format="yyyy-MM-dd"/></s:elseif>
  	           </td>
  	           </s:if>
  	           <td>科目<s:property value="#km.key"/></td>
               <td>&nbsp;
               <form action="<%=basePath %>booked/WeekPb/reload/assign.action" method="post">
               <input name="<s:property value="%{'IWeek'+#dw.value+'Km'+#km.value+'Num'}" />" 
                      value="<s:property value="#request['IWeek'+#dw.value+'Km'+#km.value+'Num']" />" class="<%=txtLimitNum %>" />
                  &nbsp;<button type="submit">修改</button>
               </form>
               </td>  
               <td>&nbsp;
                  <s:if test="#request['IWeek'+#dw.value+'Km'+#km.value+'Num'] gte #request['week'+#dw.value+'Km'+#km.value+'Assgined'] ">
                     <s:property value="#request['week'+#dw.value+'Km'+#km.value+'Assgined']" />/
                     <s:property value="%{#request['IWeek'+#dw.value+'Km'+#km.value+'Num'] - #request['week'+#dw.value+'Km'+#km.value+'Assgined']}" />
                  </s:if>
                  <s:else>
                     <span style="color:red;">
                     <s:property value="#request['week'+#dw.value+'Km'+#km.value+'Assgined']" /><br/>
                     分配数已超过总数
                     </span>
                  </s:else>
                  <p/>
                   <a class="<%=EasyUiModel.LinkButton.CLASS %> <%=aAddLimit %>"  <%=EasyUiModel.Layout.Properties.ICON_CLS(EasyUiModel.ICON_ADD) %>
                     id="<s:property value="#dw.value"/>,<s:property value="#km.value"/>,<s:if test="#dw.value eq 1"><s:date name="monday" format="yyyy-MM-dd"/></s:if><s:elseif test="#dw.value eq 2"><s:date name="tuesday" format="yyyy-MM-dd"/></s:elseif><s:elseif test="#dw.value eq 3"><s:date name="wednesday" format="yyyy-MM-dd"/></s:elseif><s:elseif test="#dw.value eq 4"><s:date name="thursday" format="yyyy-MM-dd"/></s:elseif><s:elseif test="#dw.value eq 5"><s:date name="friday" format="yyyy-MM-dd"/></s:elseif><s:elseif test="#dw.value eq 6"><s:date name="saturday" format="yyyy-MM-dd"/></s:elseif><s:elseif test="#dw.value eq 7"><s:date name="sunday" format="yyyy-MM-dd"/></s:elseif>" >
                                                        新增排班
                   </a>
               </td>
               <td>
                 <table class="editTable" style="width: 80%" cellspacing="0">
                 <tbody>
                   <s:iterator value="limits" status="st">
                   <s:if test="value.IDayofweek eq #dw.value && value.IKm eq #km.value">
                   <tr>
                     <td><s:property value="value.CKsdd" /></td>
                     <td><s:property value="value.CKscc" /></td>
                     <td><s:property value="value.CSchoolName" /></td>
                     <td><s:property value="value.ITotal" /></td>
                     <td>
                        <a class="kia-icon edit <%=aEditLimit %>" name="<s:property value="key" />" id="<s:property value="key" />,<s:property value="value.DateKsrq" />" ></a>
                         <a class="kia-icon remove <%=aRemoveLimit %>" id="<s:property value="key" />" ></a>
                     </td>
                   </tr>
                   </s:if>
                   </s:iterator>
                  </tbody>
                 </table>
               </td>
  	        </tr> 
  	         </s:iterator>
           </s:iterator>
  	         
  	     </tbody>
  	     <tfoot>
  	        <tr>
  	          <td colspan="20">
  	            <a id="<%=aSaveWeek %>"
	            onclick="$.get('<%=bookedWeekPbPath %>/do/saveWeekPb.action',function(str){str.messager();});">保存</a>
	            <a id="<%=aBack %>"
	            href="booked/WeekPb/to/index.action" >返回</a>
  	          </td>
  	        </tr>
  	     </tfoot>
  	   </table>
  	   
  	   <div id="<%=divEditLimit %>"></div>
	</div>
  </body>
</html>
