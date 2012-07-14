var socket = io.connect('http://localhost:8000');
var MyJoinedRoomCallback = undefined;
var MyInteractionCallback = undefined;
var suckitid = undefined;

socket.on( "query location down", function(id) { 
	suckitid = id;
	var url = window.location.hostname + window.location.pathname;
	socket.emit( "query location up", { 
		'socketid' : suckitid ,
		'url' : url
	} ); // query location up
} ); // socket.on

socket.on( "new user join down", MyJoinedRoomCallback ); 

socket.on( "interaction down", MyInteractionCallback );

function MyFireInteractionEvent( interaction ) { 
	interactin['socketid'] = suckitid;
	socket.emit( "interaction up", interaction );
}; // MyFireInteractionEvent


