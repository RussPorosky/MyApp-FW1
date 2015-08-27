<cfset rc.title = "ERROR" />
<cfoutput>
	<h1>ERROR</h1>
	<cfif structKeyExists( request, 'failedAction' )>
		<!--- sanitize user supplied value before displaying it --->
		<b>Action:</b> #replace( request.failedAction, "<", "&lt;", "all" )#<br/>
	<cfelse>
		<b>Action:</b> unknown<br/>
	</cfif>
	<b>Error:</b> #request.exception.cause.message#<br/>
	<b>Type:</b> #request.exception.cause.type#<br/>
	<b>Details:</b> #request.exception.cause.detail#<br/>
	<cfdump var="#request.exception.cause.tagContext#" />
</cfoutput>