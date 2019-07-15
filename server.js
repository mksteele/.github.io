var express = require('express')
  , logger = require('morgan')
  , app = express()
  , template = require('jade').compileFile(__dirname + '/source/views/homepage.jade')

app.use(logger('dev'));
app.use(express.static(__dirname + '/static'));
app.set('view engine', 'jade');

app.set('views', './source/views');
app.get('/', function (req, res, next) {
  try {
    // var html = template({ title: 'Home' })
    // res.send(html)
    res.render('homepage', { title: 'Home',
        message: 'Hello there!',
        canvas_width: 600 });

  } catch (e) {
    next(e)
  }
});

app.get('/sketches', function (req, res, next) {
    try {
        // var html = template({ title: 'Home' })
        // res.send(html)
        res.render('sketches', { title: 'Home',
            message: 'Hello there!',
            canvas_width: 600 });

    } catch (e) {
        next(e)
    }
})

//app.render('homepage', {locals:{title: 'edit your blog', posts: "something"}});

app.listen(process.env.PORT || 3000, function () {
  console.log('Listening on http://localhost:' + (process.env.PORT || 3000))
})
