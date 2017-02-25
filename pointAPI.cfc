<cfcomponent hint="Handles the POINT API Calls" extends="JSONUtil">
<cffunction access="public" name="zones" returntype="any">
  <cfargument name="structform" required="no" type="any" default="">
  <cfhttp url="https://api.pointhq.com/zones" username="#request.APIusername#" password="#request.APIToken#" result="results">
    <cfhttpparam type="header" name="Content-Type" value="application/json">
    <cfif isStruct(arguments.structform) AND !StructIsEmpty(arguments.structform)>
    <cfloop collection="#arguments.structform#" item="key">
      <CFHTTPPARAM NAME="#key#" VALUE="#arguments.structform[key]#" TYPE="body">
    </cfloop>
    </cfif>
  </cfhttp>
  <cfif results.statuscode EQ '200 OK'>
  	<cfreturn DeserializeJSON(results.filecontent)>
  <cfelse>
  	<cfreturn "Error!#results.filecontent#">
  </cfif>
</cffunction>

<cffunction access="public" name="addzone" returntype="any">
  <cfargument name="structform" required="no" type="any" default="">
  <cfset stFields = StructNew()>
  <cfset stFields['zone'] = arguments.structform>
  <cfhttp method="post" url="https://api.pointhq.com/zones/" username="#request.APIusername#" password="#request.APIToken#" result="results">
    <cfhttpparam type="header" name="Content-Type" value="application/json">
    <cfif isStruct(arguments.structform) AND !StructIsEmpty(arguments.structform)>
		<CFHTTPPARAM VALUE="#serializeJson(stFields)#" TYPE="body">
    </cfif>
  </cfhttp>
  <cfif results.statuscode EQ '201 Created'>
  	<cfreturn DeserializeJSON(results.filecontent)>
  <cfelse>
  	<cfreturn "Error!#results.filecontent#">
  </cfif>
</cffunction>

<cffunction access="public" name="updatezone" returntype="any">
  <cfargument name="zoneName" default="" required="yes">
  <cfargument name="structform" required="no" type="any" default="">
  <cfset stFields = StructNew()>
  <cfset stFields['zone'] = arguments.structform>
  <cfhttp method="put" url="https://api.pointhq.com/zones/#arguments.zoneName#" username="#request.APIusername#" password="#request.APIToken#" result="results">
    <cfhttpparam type="header" name="Content-Type" value="application/json">
    <cfif isStruct(arguments.structform) AND !StructIsEmpty(arguments.structform)>
		<CFHTTPPARAM VALUE="#serializeJson(stFields)#" TYPE="body">
    </cfif>
  </cfhttp>
  <cfif results.statuscode EQ '202 Accepted'>
  	<cfreturn DeserializeJSON(results.filecontent)>
  <cfelse>
  	<cfreturn "Error!#results.filecontent#">
  </cfif>
</cffunction>

<cffunction access="public" name="deletezone" returntype="any">
  <cfargument name="zoneid" default="" required="yes">
  <cfhttp method="delete" url="https://api.pointhq.com/zones/#arguments.zoneid#" username="#request.APIusername#" password="#request.APIToken#" result="results">
    <cfhttpparam type="header" name="Content-Type" value="application/json"> 
  </cfhttp>
  <cfif results.statuscode EQ '20o OK'>
  	<cfreturn DeserializeJSON(results.filecontent)>
  <cfelse>
  	<cfreturn "Error!#results.filecontent#">
  </cfif>
</cffunction>

<cffunction access="public" name="addrecord" returntype="any">
  <cfargument name="zoneName" default="" required="yes">
  <cfargument name="structform" required="no" type="any" default="">
  <cfset stFields = StructNew()>
  <cfset stFields['zone_record'] = arguments.structform>
  <cfhttp method="post" url="https://api.pointhq.com/zones/#arguments.zoneName#/records" username="#request.APIusername#" password="#request.APIToken#" result="results">
    <cfhttpparam type="header" name="Content-Type" value="application/json">
    <cfif isStruct(arguments.structform) AND !StructIsEmpty(arguments.structform)>
		<CFHTTPPARAM VALUE="#serializeJson(stFields)#" TYPE="body">
    </cfif>
  </cfhttp>
  <cfif results.statuscode EQ '201 Created'>
  	<cfreturn DeserializeJSON(results.filecontent)>
  <cfelse>
  	<cfreturn "Error!#results.filecontent#">
  </cfif>
</cffunction>


<cffunction access="public" name="getRecordsfromZone" returntype="any">
  <cfargument name="zoneName" default="" required="yes" type="numeric">
  <cfhttp url="https://api.pointhq.com/zones/#arguments.zoneName#/records" username="#request.APIusername#" password="#request.APIToken#" result="results">
    <cfhttpparam type="header" name="Content-Type" value="application/json">
  </cfhttp>
  <cfif results.statuscode EQ '200 OK'>
  	<cfreturn DeserializeJSON(results.filecontent)>
  <cfelse>
  	<cfreturn "Error!#results.filecontent#">
  </cfif>
</cffunction>

<cffunction access="public" name="getRecordsfromZonebyId" returntype="any">
  <cfargument name="zoneName" default="" required="yes" type="numeric">
  <cfargument name="zoneID" required="no" type="any" default="">
  <cfhttp url="https://api.pointhq.com/zones/#arguments.zoneName#/records/#arguments.zoneID#" username="#request.APIusername#" password="#request.APIToken#" result="results">
    <cfhttpparam type="header" name="Content-Type" value="application/json">
  </cfhttp>
  <cfif results.statuscode EQ '200 OK'>
  	<cfreturn DeserializeJSON(results.filecontent)>
  <cfelse>
  	<cfreturn "Error!#results.filecontent#">
  </cfif>
</cffunction>

<cffunction access="public" name="updateRecordbyZone" returntype="any">
  <cfargument name="zoneName" default="" required="yes">
  <cfargument name="zoneID" required="no" type="any" default="">
  <cfargument name="structform" required="no" type="any" default="">
  <cfset stFields = StructNew()>
  <cfset stFields['zone_record'] = arguments.structform>
  <cfhttp method="put" url="https://api.pointhq.com/zones/#arguments.zoneName#/records/#arguments.zoneID#" username="#request.APIusername#" password="#request.APIToken#" result="results">
    <cfhttpparam type="header" name="Content-Type" value="application/json">
    <cfif isStruct(arguments.structform) AND !StructIsEmpty(arguments.structform)>
		<CFHTTPPARAM VALUE="#serializeJson(stFields)#" TYPE="body">
    </cfif>
  </cfhttp>
  <cfif results.statuscode EQ '200 OK'>
  	<cfreturn DeserializeJSON(results.filecontent)>
  <cfelse>
  	<cfreturn "Error!#results.filecontent#">
  </cfif>
</cffunction>

<cffunction access="public" name="deletzoneRecord" returntype="any">
  <cfargument name="recordname" default="" required="yes">
  <cfargument name="zoneid" default="" required="yes">
  <cfhttp method="delete" url="https://api.pointhq.com/zones/#arguments.recordname#/records/#arguments.zoneid#" username="#request.APIusername#" password="#request.APIToken#" result="results">
    <cfhttpparam type="header" name="Content-Type" value="application/json"> 
  </cfhttp>
  <cfif results.statuscode EQ '200 OK'>
  	<cfreturn DeserializeJSON(results.filecontent)>
  <cfelse>
  	<cfreturn "Error!#results.filecontent#">
  </cfif>
</cffunction>

<cffunction access="public" name="zonerecord" returntype="any">
  <cfargument name="zone_ID_name" required="yes" type="any">
  <cfargument name="record_type" required="yes" type="any">
  <cfargument name="recordname" required="yes" type="any">
  <cfargument name="structform" required="no" type="any" default="">
  <cfhttp url="https://api.pointhq.com/zones/#arguments.zoneID_name#/records?record_type=#arguments.record_type#&name=#arguments.recordname#" username="#request.APIusername#" password="#request.APIToken#" result="results">
    <cfhttpparam type="header" name="Content-Type" value="application/json">
    <cfif isStruct(arguments.structform) AND !StructIsEmpty(arguments.structform)>
    <cfloop collection="#arguments.structform#" item="key">
      <CFHTTPPARAM NAME="#key#" VALUE="#arguments.structform[key]#" TYPE="body">
    </cfloop>
    </cfif>
  </cfhttp>
  <cfif results.statuscode EQ '200 OK'>
  	<cfreturn DeserializeJSON(results.filecontent)>
  <cfelse>
  	<cfreturn "Error!#results.filecontent#">
  </cfif>
</cffunction>

<cffunction access="public" name="zoneredirect" returntype="any">
  <cfargument name="recordname" required="yes" type="any">
  <cfargument name="structform" required="no" type="any" default="">
  <cfhttp url="https://api.pointhq.com/zones/#arguments.recordname#/redirects" username="#request.APIusername#" password="#request.APIToken#" result="results">
    <cfhttpparam type="header" name="Content-Type" value="application/json">
    <cfif isStruct(arguments.structform) AND !StructIsEmpty(arguments.structform)>
    <cfloop collection="#arguments.structform#" item="key">
      <CFHTTPPARAM NAME="#key#" VALUE="#arguments.structform[key]#" TYPE="body">
    </cfloop>
    </cfif>
  </cfhttp>
  <cfif results.statuscode EQ '200 OK'>
  	<cfreturn DeserializeJSON(results.filecontent)>
  <cfelse>
  	<cfreturn "Error!#results.filecontent#">
  </cfif>
</cffunction>

<cffunction access="public" name="zoneredirectID" returntype="any">
  <cfargument name="recordname" required="yes" type="any">
  <cfargument name="id" required="yes" type="any">
  <cfargument name="structform" required="no" type="any" default="">
  <cfhttp url="https://api.pointhq.com/zones/#arguments.recordname#/redirects/#arguments.id#" username="#request.APIusername#" password="#request.APIToken#" result="results">
    <cfhttpparam type="header" name="Content-Type" value="application/json">
  </cfhttp>
  <cfif results.statuscode EQ '200 OK'>
  	<cfreturn DeserializeJSON(results.filecontent)>
  <cfelse>
  	<cfreturn "Error!#results.filecontent#">
  </cfif>
</cffunction>

<cffunction access="public" name="updateredirect" returntype="any">
  <cfargument name="recordname" required="yes" type="any">
  <cfargument name="id" required="yes" type="any">
  <cfargument name="structform" required="no" type="any" default="">
  <cfset stFields = StructNew()>
  <cfset stFields['zone_redirect'] = arguments.structform>
  <cfhttp url="https://api.pointhq.com/zones/#arguments.recordname#/redirects/#arguments.id#" username="#request.APIusername#" password="#request.APIToken#" result="results">
    <cfhttpparam type="header" name="Content-Type" value="application/json">
    <cfif isStruct(arguments.structform) AND !StructIsEmpty(arguments.structform)>
    <cfloop collection="#arguments.structform#" item="key">
      <CFHTTPPARAM NAME="#key#" VALUE="#arguments.structform[key]#" TYPE="body">
    </cfloop>
    </cfif>
  </cfhttp>
  <cfif results.statuscode EQ '200 OK'>
  	<cfreturn DeserializeJSON(results.filecontent)>
  <cfelse>
  	<cfreturn "Error! #results.filecontent#">
  </cfif>
</cffunction>

<cffunction access="public" name="deletzoneRedirect" returntype="any">
  <cfargument name="recordname" default="" required="yes">
  <cfargument name="id" default="" required="yes">
  <cfhttp method="delete" url="https://api.pointhq.com/zones/#arguments.recordname#/redirects/#arguments.id#" username="#request.APIusername#" password="#request.APIToken#" result="results">
    <cfhttpparam type="header" name="Content-Type" value="application/json"> 
  </cfhttp>
  <cfif results.statuscode EQ '200 OK'>
  	<cfreturn DeserializeJSON(results.filecontent)>
  <cfelse>
  	<cfreturn "Error!#results.filecontent#">
  </cfif>
</cffunction>

<cffunction access="public" name="zoneredirectmail" returntype="any">
  <cfargument name="recordname" required="yes" type="any">
  <cfargument name="structform" required="no" type="any" default="">
  <cfhttp url="https://api.pointhq.com/zones/#arguments.recordname#/mail_redirects" username="#request.APIusername#" password="#request.APIToken#" result="results">
    <cfhttpparam type="header" name="Content-Type" value="application/json">
    <cfif isStruct(arguments.structform) AND !StructIsEmpty(arguments.structform)>
    <cfloop collection="#arguments.structform#" item="key">
      <CFHTTPPARAM NAME="#key#" VALUE="#arguments.structform[key]#" TYPE="body">
    </cfloop>
    </cfif>
  </cfhttp>
  <cfif results.statuscode EQ '200 OK'>
  	<cfreturn DeserializeJSON(results.filecontent)>
  <cfelse>
  	<cfreturn "Error!#results.filecontent#">
  </cfif>
</cffunction>

<cffunction access="public" name="zoneredirectmailusingID" returntype="any">
  <cfargument name="recordname" required="yes" type="any">
  <cfargument name="id" required="yes" type="any">
  <cfargument name="structform" required="no" type="any" default="">
  <cfhttp url="https://api.pointhq.com/zones/#arguments.recordname#/mail_redirects/#arguments.id#" username="#request.APIusername#" password="#request.APIToken#" result="results">
    <cfhttpparam type="header" name="Content-Type" value="application/json">
  </cfhttp>
  <cfif results.statuscode EQ '200 OK'>
  	<cfreturn DeserializeJSON(results.filecontent)>
  <cfelse>
  	<cfreturn "Error!#results.filecontent#">
  </cfif>
</cffunction>

<cffunction access="public" name="updateredirectmail" returntype="any">
  <cfargument name="recordname" required="yes" type="any">
  <cfargument name="id" required="yes" type="any">
  <cfargument name="structform" required="no" type="any" default="">
  <cfset stFields = StructNew()>
  <cfset stFields['zone_mail_redirect'] = arguments.structform>
  <cfhttp url="https://api.pointhq.com/zones/#arguments.recordname#/mail_redirects/#arguments.id#" username="#request.APIusername#" password="#request.APIToken#" result="results">
    <cfhttpparam type="header" name="Content-Type" value="application/json">
    <cfif isStruct(arguments.structform) AND !StructIsEmpty(arguments.structform)>
    <cfloop collection="#arguments.structform#" item="key">
      <CFHTTPPARAM NAME="#key#" VALUE="#arguments.structform[key]#" TYPE="body">
    </cfloop>
    </cfif>
  </cfhttp>
  <cfif results.statuscode EQ '200 OK'>
  	<cfreturn DeserializeJSON(results.filecontent)>
  <cfelse>
  	<cfreturn "Error! #results.filecontent#">
  </cfif>
</cffunction>

<cffunction access="public" name="deletzoneMailRedirect" returntype="any">
  <cfargument name="recordname" default="" required="yes">
  <cfargument name="id" default="" required="yes">
  <cfhttp method="delete" url="https://api.pointhq.com/zones/#arguments.recordname#/mail_redirects/#arguments.id#" username="#request.APIusername#" password="#request.APIToken#" result="results">
    <cfhttpparam type="header" name="Content-Type" value="application/json"> 
  </cfhttp>
  <cfif results.statuscode EQ '200 OK'>
  	<cfreturn DeserializeJSON(results.filecontent)>
  <cfelse>
  	<cfreturn "Error!#results.filecontent#">
  </cfif>
</cffunction>

</cfcomponent>