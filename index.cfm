<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>POINT API Calls</title>
</head>
<body>
<cfset request.tools = CreateObject("component","pointAPI")>
<!---<cfset mydata = {}>
<cfset mydata["group"] = "ABC group">
<cfset zones = Request.tools.updatezone(zoneName='www.iexampleo.com',structform=mydata)>
<cfdump var="#zones#">--->
<cfset addzone = {}>
<cfset addzone["name"] = "tesaccount.com">
<cfset addzone["id"] = "2">
<cfset addzone["ttl"] = "3600">
<cfset addzone["group"] = "Default Group">
<cfset addzone["user-id"] = "3">
<cfset azone = Request.tools.addzone(addzone)>
<cfdump var="#azone#">


</body>
</html>