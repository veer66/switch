var express = require('express'),
	nunjucks = require("nunjucks"),
	net = require("net");


var app = express();

var status = "on";

nunjucks.configure(__dirname + '/views', {
	autoescape: true,
	express: app
});

app.get('/', function(req, res) {
	if (req.query.status) {
		status = req.query.status;
	}
	res.render('index.html', {status:req.query.status});
});

var httpServer = app.listen(3000, function() {
	var host = httpServer.address().address;
	var port = httpServer.address().port;
	console.log('The app listening at http://%s:%s', host, port);
});

var tcpServer = net.createServer();
tcpServer.listen(6981, '0.0.0.0');
console.log("TCP server is running ...");
tcpServer.on('connection', function(sock) {	
    sock.on('data', function(data) {
        sock.write(status);
    });    
});


