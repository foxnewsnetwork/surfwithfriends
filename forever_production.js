// Daemons are for production use
var forever = require( "forever" );

var child = new (forever.Monitor)('surf.js', {
    max: 3,
    silent: false,
    options: []
});

child.on('exit', function(){ console.log( "We fucked up"); });
child.start();
