const express = require('express');

const app = express();

const Port = 3000;

app.use(express.static('app'));

app.use(express.static('build/contracts'));

app.get('/', (req, res) => {
    res.sendFile("${__dirname}/app/index.html");
  });

  app.get('/', (req, res) => {
    res.sendFile(`${__dirname}/app/index.html`);
  });
  


  app.listen(Port, () =>  {
    console.log(`ETB Ethereum ToDo List App is running on port ${Port}...`);
  });