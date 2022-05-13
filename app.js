const express = require("express");
require("express-async-errors");

// ----------------------
const app = express();
app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use("/public", express.static("public"));

//mdw
require("./middlewares/session.mdw")(app);
require("./middlewares/view.mdw")(app);
require("./middlewares/locals.mdw")(app);

const restrict = require("./middlewares/auth.mdw");
// user--------------------------------
app.get("/", function (req, res) {
  res.render("index");
});
app.get("/admin", restrict, function (req, res) {
  res.render("admin/dashboard", {
    layout: "admin",
  });
});

app.use("/", require("./routes/upload.route"));
app.use("/", require("./routes/_account.route"));
app.use("/", require("./routes/_product.route"));



// app.use("/admin/products", restrict, require("./routes/product.route"));
// end mdw  

// router - admin--------------------------------
app.use("/admin/categories", restrict, require("./routes/category.route"));
app.use("/admin/products", restrict, require("./routes/product.route"));

//  error ---------------------------------------
app.use(function (req, res) {
  res.render("404", { layout: false });
});
app.use(function (err, req, res, next) {
  console.error(err.stack);
  res.status(500).render("500", { layout: false });
});
//--------------------------------------
const PORT = 3000;
app.listen(PORT, function () {
  console.log(`server is runing at http://localhost:${PORT}`);
});
