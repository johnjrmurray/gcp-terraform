'use strict';

const express = require('express');

// Constants
const PORT = process.env.PORT;
const HOST = '0.0.0.0';

// App
const app = express();

app.get('/', (req, res) => {
  res.send(`Hello we are running on ${process.env.K_SERVICE}`);
});

app.listen(PORT, HOST, () => {
  console.log(`And we are go on http://${HOST}:${PORT}`)
});