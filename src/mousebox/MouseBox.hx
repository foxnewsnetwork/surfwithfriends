package mousebox;
import js.JQuery;

class MouseBox {
	public static var Movements = new List<Vector>();
	public static var RecordFlag = true;
	public static var Ready = function( a ) { return; };
	public static function StaticInitialize( cb ) { 
		MouseBox.Ready = cb;
		tools.Stopwatch.Interval( function() { 
			MouseBox.RecordFlag = true;
		}, 31.25 ); // Interval
		(new JQuery("body") ).mousemove( function(e) { 
			if ( MouseBox.RecordFlag ) { 
				MouseBox.Movements.push( { x : e.pageX, y : e.pageY } );
				MouseBox.RecordFlag = false;
			} // RecordFlag
			if ( MouseBox.Movements.length == 64 ) { 
				MouseBox.Ready( MouseBox.Movements )
				MouseBox.Movements.clear();
			} // if
		} ); // Mousemove
	} // StaticInitialize
	
	
	
	private var mice : Hash<JQuery>;
	private var mice_data : Hash<List<MouseData>>;
	private var timer : haxe.Timer;
	
	public function new() { 
		this.mice = new Hash<JQuery>();
		this.mice_data = new Hash<List<MouseData>>();
		
		this.timer = tools.Stopwatch.Interval( function() { 
			this.p_process();
		} , 31.25 ); // 
	} // new
	
	// Updates existing mice or creates a new one if not existing
	public function Mouse( mouse_data : MouseData ) { 
		if( mice.exist( mouse_data['socketid'] + "" ) ) { 
			this.mice_data.get( mouse_data['socketid'] + "" ).push( mouse_data )
		} // if mice exist
		else { 
			MouseBox.Container.append( this.p_generatemouse() );
			var mouse = new JQuery("#mousebox-surfwith-friends-" + MouseBox.MiceCount );
			MouseBox.MiceCount += 1;
			this.mice.set( mouse_data['socketid'] + "", mouse );
			
			var mouse_list = new List<MouseData>();
			mouse_list.push( mouse_data );
			this.mice_data.set( mouse_data['socketid'] + "", mouse_list );
		} // else new mouse
	} // Mouse
	
	
	
	// Processes the mouse 
	private function p_process() { 
		for( list in this.mice_data ) { 
			if ( list.isEmpty() )
				continue;
			var mouse_data = list.pop();
			this.mice.get( mouse_data['socketid'] ).css( "top", mouse_data.position.y + "px" );
			this.mice.get( mouse_data['socketid'] ).css( "left", mouse_data.position.x + "px" );
		} // for list
	} // p_process
} // MouseBox
