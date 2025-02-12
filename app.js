
/**
 * Specifying the dependencies and the libraries.
 */
var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var logger = require('morgan');
const session=require('express-session'); 

/**
 * Specifying the dependencies from our code.
 */
var indexRouter = require('./routes/index');
var sellRouter = require('./routes/sell_items')
var categoryRouter = require('./routes/view_category');
var orderRouter=require('./routes/make_order')

var app = express();

// View engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(logger('dev'));

// To treat incoming request data as JSON data
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyParser.json())

/** 
 * Create a session 
 */
app.use(session({secret:'ssshhh',saveUninitialized:true,resave:true}))
app.use('/', indexRouter);
app.use('/category', categoryRouter);
app.use('/', sellRouter);
app.use('/',orderRouter);

// Catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// Error handler
app.use(function(err, req, res, next) {
  // Set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // Render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
app.listen(3000);