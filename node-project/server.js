const express = require('express');
const data = require('./globals.json');

const app = express();

app.set('view engine', 'pug');

// serve static files from the `static` folder
app.use(express.static(__dirname + '/static'));

const server = app.listen(7000, () => {
    console.log(`Express running → PORT ${server.address().port}`);
});
app.get('/', (req, res) => {
    res.render('index', {
        sitename: "Miranda Steele",
        title: "Home",
        data: data.globals
    });
});