<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.io.PrintWriter"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
    
<%!
   String getScriptTag(String pStrSrcPath)
   {
     return "<script type='text/javascript' src='"+pStrSrcPath+"'></script>\n";
     
   }
   
   String getCssLinkTag(String pStrHrefPath)
   {
    return "<link rel='stylesheet' type='text/css'  href='"+pStrHrefPath+"' /> \n";
   }
   
   boolean isExist(String[] pArrPlugs,String pStrPlug)
   {
      if(pArrPlugs.length<1||pStrPlug==null)return false;
      for(int i=0;i<pArrPlugs.length;i++)
      {
        if(pArrPlugs[i].equalsIgnoreCase(pStrPlug))
         return true;
      }
      return false;  
    }
 %>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

     String lStrTheme=request.getParameter("js")==null?"":request.getParameter("js").toString();
  
     PrintWriter _PW= response.getWriter();
     StringBuffer lSbrScript=new StringBuffer("");
     String lStrPlugFloder=basePath+"/js";
     
     String lStrCommon=request.getParameter("common")==null?"":request.getParameter("common");
     if(lStrTheme.length()<1)
     {
        //lSbrScript.append(getCssLinkTag(lStrPlugFloder+"/kia-icon.css"));
        lSbrScript.append(getScriptTag(lStrPlugFloder+"/core.js"));
        lSbrScript.append(getScriptTag(lStrPlugFloder+"/custom/setting.js"));
        lSbrScript.append(getScriptTag(lStrPlugFloder+"/prototype/date.js"));
        lSbrScript.append(getScriptTag(lStrPlugFloder+"/extends/jquery.js"));
        lSbrScript.append(getScriptTag(lStrPlugFloder+"/extends/easyui.js"));
        //lSbrScript.append(getScriptTag(lStrPlugFloder+"/common/util.js"));
        lSbrScript.append(getScriptTag(lStrPlugFloder+"/ui/datagrid.js"));
     }
     
     if(lStrCommon.length()>0){
    	 
     }
 
     _PW.write(lSbrScript.toString());

%>


