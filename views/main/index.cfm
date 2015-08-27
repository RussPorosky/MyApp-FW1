<cfset rc.title = "Home" />
<cfoutput>
	<p>Hello #rc.name#!</p>
	<p><a href="#buildURL('main.other')#">Go away</a>!</p>
</cfoutput>