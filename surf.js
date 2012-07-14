var app = require('http').createServer( )
  , io = require('socket.io').listen(app);

// var app = require('express').createServer()

app.listen(8000);

io.sockets.on('connection', function (socket) {
	socket.emit( "query location down", socket.id ); // location packet
	
	socket.on( "query location up", function( location ) { 
		socket.set( location['socketid'], location['url'], function() { 
			socket.join( location['url'] );
			socket.broadcast.to( location['url'] ).emit( "new user join down", location['socketid'] );
		} ); // socket.set
	} ); // query url up
	
	socket.on( "interaction up", function( interaction ) { 
		socket.get( interaction['socketid'], function( url ) { 
			socket.broadcast.to( url ).emit( "interaction down",  interaction );
		} ); // socket.get
	} ); // interaction event
}); // connection
