
/**
 * Module dependencies.
 */

require('coffee-script');
var express = require('express')
  , routes = require('./routes');
require('express-resource');


var app = module.exports = express.createServer();

// Configuration

app.configure(function(){
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(express.static(__dirname + '/public'));
});

app.configure('development', function(){
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
});

app.configure('production', function(){
  app.use(express.errorHandler());
});

// Routes

app.get('/', routes.index);

// Resources
var transactions = app.resource('transactions', require('./resources/transaction'));
var compte = require('./resources/compte');
var comptes = app.resource('comptes', compte);
comptes.map('get', 'solde', compte.solde)

app.listen(3000, function(){
  console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
});
