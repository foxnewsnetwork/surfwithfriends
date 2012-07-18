package mousebox;

import js.JQuery;

class Mouse { 
	public static var MiceCount = 0;
	public static var Container = new JQuery("body");

	private var dom : JQuery;
	
	public function new() { 
		Container.append( p_generatemouse() );
		this.dom = new JQuery("#mousebox-surfwith-friends-" + Mouse.MiceCount );
		Mouse.MiceCount += 1;
	} // new
	
	public function Position( ?p : Vector ) { 
		if ( p != null ) { 
			this.dom.css( "left", p.x + "px" );
			this.dom.css( "top", p.y + "px" );
		} // if
		
	} // Position
	
	// Generates the html string for a mouse
	private function p_generatemouse( ) : String{ 
		var output = "<div class='surffriends mousebox'";
		output += " id='mousebox-surfwith-friends-" + Mouse.MiceCount + "' "
		output += "style='position : absolute;'>";
		ouput += "</div>";
		return output;
	} // p_generatemouse
} // Mouse
