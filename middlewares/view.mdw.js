
const exphbs = require('express-handlebars');
const express_handlebars_sections = require('express-handlebars-sections');
const numeral = require('numeral');

module.exports = function (app) {
    app.engine('.hbs', exphbs({
        extname: '.hbs',
        helpers: {
            section: express_handlebars_sections(),
            format_number: function (value) {
                return numeral(value).format('0,0');
            }
        }
    }));
    app.set('view engine', 'hbs');
    app.locals.layout = 'main';
}