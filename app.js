const express = require("express");
const app = express();

app.get("/", function (req, res) {
  res.send("Hello Saikrishna Reddy, It worked!");
});

app.listen(3000, () => {
  console.log("Server starts listening on port : 3000");
});
