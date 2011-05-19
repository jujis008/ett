<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>签到凭证打印</title>
</head>
<body>
<div
		style="height: 72px; vertical-align:middle;text-align:center;; line-height:72px; background: url('<s:url value="/images/hint2.jpg"/>')  no-repeat center; background-repeat: no-repeat;">
		<img style="margin-top: 10px;"
			src="<s:url value="/images/sureprinthint.jpg"/>" width="800"
			border="0px" height="50" alt="提示语" />

	</div>
	<div
		style="text-align: center; height: 502px; background: url('<s:url value="/images/bottom3.jpg"/>')  no-repeat center; background-repeat: no-repeat;">
		<br /> <br /> 

<table id="idprint"  cellpadding="0" cellspacing="0" style="text-align:left;width:480px" border="0">
<tr>
<td  style="text-align:center"><s:property value="printObject.glbmName"/></td>
</tr>
<tr>
<td  style="text-align:center">科目一预约签到凭证</td>
</tr>
<tr>
<td>流   水  号：*<s:property value="printObject.lsh"/>* </td>
</tr>
<tr>
<td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<s:property value="printObject.xm"/> </td>
</tr>
<tr><td>证件号码：<s:property value="printObject.sfzmhm"/> </td>
</tr>
<tr>
<td>考试日期：<s:date name="printObject.ksrq" format="yyyy-MM-dd"/> </td>
</tr>
<tr>
<td>预约日期：<s:date name="printObject.yyrq" format="yyyy-MM-dd HH:mm:ss"/>  </td>
</tr>
<tr>
<td >所需资料：身份证原件、驾校培训记录单</td>
</tr>
<tr>
<td>请提前十分钟进场等候考试。</td>
</tr>

</table>

<div style="display:none">
<s:textfield name="hotPrinter.brand"/>
<s:textfield name="hotPrinter.com"/>
<s:textfield name="hotPrinter.stopBits"/>
<s:textfield name="hotPrinter.baud"/>
</div>
<script type="text/javascript">

</script>
<br/>
<br/>
<input type="button" value="签到确认" onclick="javascript:confirmCheck();" class="btnmain" style="line-height:55px;background-position:center;width:341px;height:55px;" width="341" height="55"/>
	</div>
	<script type="text/javascript">
	function confirmCheck()
	{
		//TODO 打印凭条
		document.location.href='<s:url value="/self/preasign!confirmCheck.action"/>';
	}
	
	</script>
</body>
</html>