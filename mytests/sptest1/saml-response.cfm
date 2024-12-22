<h1>SAML Response - response.cfm</h1>


<cfset config = {
	idp = {name = "okta-identityProvider"},
	sp = {name = "test-SP"},
	relaystate = "page"
}>

<cfdump var='#config#' label='config'>

<!---
<cfset InitSAMLAuthRequest(config)>
--->

<cfset struct1 = StructNew()> 
<cfset struct1.idp = StructNew()> 
<cfset struct1.idp.name = "okta-identityProvider"> 
<cfset struct1.sp = StructNew()> 
<cfset struct1.sp.name = "test-SP"> 
<cfset authreq=XmlParse("#GetSAMLAuthRequest(struct1)#")> 
<cfdump var="#authreq#">


<cfset RespStruct = "#ProcessSAMLResponse("okta-identityProvider", "test-SP")#"> 
<cfdump var="#RespStruct#"> 
<cfif RespStruct.AUTHENTICATED> 
<cflogin> 
<cfloginuser name="#RespStruct.NAMEID#" password="" roles="#ArrayToList(RespStruct.ATTRIBUTES)#"> 
</cflogin> 
</cfif>

<!---
<cfset response = ProcessSAMLResponse("okta-identityProvider","test-SP")>

<cfdump var='#response#' label='SAML response'>
--->


