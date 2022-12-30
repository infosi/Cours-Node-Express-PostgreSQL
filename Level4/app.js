const path = require('path');
const express = require('express');
const sessionsRoutes = require('./routes/sessions');

const app = express();

app.use(express.json());

// app.get('/', (req, res) => {
//   res.send('<h1>Salut les Devs Express</h1>');
// });

app.use('/api/sessions', sessionsRoutes)

module.exports = app;