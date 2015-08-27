component accessors=true {
	property greetingService;

	function index( struct rc ) {
		param name="rc.name" default="anonymous";
		rc.name = variables.greetingService.greet( rc.name );
	}
}