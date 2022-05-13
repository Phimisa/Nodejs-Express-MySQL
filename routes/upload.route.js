const express = require("express");
const router = express.Router();
const multer = require("multer");
router.get("/upload", function (req, res) {
  res.render("upload", {
    layout: "admin",
  });
});

router.post("/upload", function (req, res) {
  const storage = multer.diskStorage({
    filename(req, file, cb) {
      cb(null, file.originalname);
      // cb(null,'main.jpg')
    },
    destination(req, file, cb) {
      cb(null, "public/imgs");
    }
  });
  const upload = multer({ storage });

  upload.array("fuMain", 3)(req, res, function (err) {
    if (!err) res.render("upload",{
        layout:'admin'
    });
    else res.send("lỗi rồi");
    console.log("chạy tới đây không");
  });
});
// -----------------------------------------------

module.exports = router;
