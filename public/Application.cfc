component extends=frameworkone {
	this.name = "MyApp";
	this.version = "1.0.0";
	this.mappings["/app"] = getDirectoryFromPath( CGI.PATH_TRANSLATED ).replaceFirst( "/public", "" );

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
		diEngine = "app.framework.ioc",
		diLocations = "/app/model,/app/controllers",
		diConfig = this.diConfig
	};

	application.myapp = {
		version: "1.0.0"
	};

	function setupApplication() {
		var beanFactory = new "#variables.framework.diEngine#"( "/app/model", this.diConfig );
		setBeanFactory( beanFactory );
	}
}
