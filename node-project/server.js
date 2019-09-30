const express = require('express');
const data = require('./globals.json');

const app = express();

app.set('view engine', 'pug');

// serve static files from the `assets` folder
app.use(express.static(__dirname + '/assets'));

const server = app.listen(7000, () => {
    console.log(`Express running → PORT ${server.address().port}`);
});

// By default, host index
app.get('/', (req, res) => {
    res.render('index', {
        sitename: data.sitename,
        navigation: data.navigation,
        title: ""
    });
});

app.get("/:route", (req, res) => {
    res.render(req.params.route, {
        sitename: data.sitename,
        title: req.params.route,
        navigation: data.navigation
    });
});