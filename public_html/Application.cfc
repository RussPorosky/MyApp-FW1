component extends=frameworkone {
	this.name = "MyApp";
	this.version = "1.0.0";
	this.current_path = getDirectoryFromPath( ( structKeyExists( CGI, "PATH_TRANSLATED" ) ) ? CGI.PATH_TRANSLATED : CGI.CF_TEMPLATE_PATH );
	this.mappings["/app"] = left( this.current_path, len( this.current_path ) - len( listLast( this.current_path, "/" ) ) - 1 );
	structDelete( this, "current_path" );
	this.diConfig = {
		strict = true,
		exclude = [
			"/app/framework/aop.cfc",
			"/app/framework/beanProxy.cfc",
			"/app/framework/ioc.cfc",
			"/app/framework/WireBoxAdapter.cfc",
			"/app/framework/one.cfc"
		]
	};

	cfheader(
		name = "x-ua-compatible",
		value = "ie=edge"
	);

	variables.framework = {
		applicationKey = "thumb",
		base = "/app",
		defaultItem = "index",
		maxNumContextsPreserved = 100,
		generateSES = true,
		SESOmitIndex = true,
		reloadApplicationOnEveryRequest = true,
		unhandledPaths = "/css,/fonts,/images,/js",
		diComponent = "app.framework.ioc",
		diLocations = "/app/model,/app/controllers",
		diConfig = this.diConfig
	};

	application.myapp = {
		version: "1.0.0"
	};

	function setupApplication() {
	}
}
