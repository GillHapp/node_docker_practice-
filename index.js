const express = require('express');
const app = express();
const port = 3000; // you can change the port if needed

app.get('/', (req, res) => {
  res.send('Hello World from Express!');
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
