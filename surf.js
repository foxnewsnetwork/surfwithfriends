var app = require('http').createServer( )
  , io = require('socket.io').listen(app);

// var app = require('express').createServer()

app.listen(8000);

var rooms = {};
io.sockets.on('connection', function (socket) {
	socket.emit( "query location down", socket.id ); // location packet
	
	socket.on( "query location up", function( location ) { 
		rooms[location['socketid']] = location['url'];
		socket.join( location['url'] );
		socket.broadcast.to( location['url'] ).emit( "new user join down", location['socketid'] );
		socket.to( location['url'] ).emit( "new user join down", location['socketid'] );
	} ); // query url up

	socket.on( "interaction up", function( interaction ) { 
		var url	= rooms[interaction['socketid']];
		interaction['timestamp'] = (new Date() ).getTime();
		console.log(interaction);
		socket.broadcast.to(url).emit("interaction down", interaction);
		socket.to(url).emit("interaction down", interaction);
	} ); // interaction event
}); // connection
