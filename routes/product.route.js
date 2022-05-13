const express = require('express');
const multer = require("multer");
const bodyParser = require('body-parser');
const categoryModel = require('../models/category.model');
const productModel = require('../models/product.model');
const router = express.Router();
var path = require('path');
router.use(bodyParser.urlencoded({
    extended:true
}))


var imgurl;
const storage = multer.diskStorage({
    // filename(req, file, cb) {
    // //   cb(null, file.originalname);
    // imgurl = Date.now() + '.jpg';
    //   cb(null,imgurl)
    
    // },
    // destination(req, file, cb) {
    //   cb(null, "public/imgs");
    // }
    
    destination:'public/imgs',
    filename:(req,file,cb)=>{
          imgurl = file.fieldname+"_"+Date.now()+path.extname(file.originalname);
        cb(null,imgurl);
      }

  });
  const upload = multer({
       storage:storage
     }).single('file');

//=======================================================

router.get('/list', async function(req,res,next){
    const list = await productModel.all();
  
    res.render('admin/products/list',{
        
        products : list,
      
        layout:"admin"
    });
})
// /------------------------------------------------------
router.get('/add',async function(req,res){
    const cate = await categoryModel.all();
    res.render('admin/products/add',{
        products : cate,
        layout: 'admin'
    });
})
// -------------------------------------------


router.post('/add',upload, async function(req,res,next){
    // const file =req.file;
    // if(!file){
    //     const error = new error (' file ssai');
    //     return next(error);
    // };
 


    if(req.file){
        

        var entity = {
            ProName: req.body.txtProName,
            Price: req.body.txtPrice,
            CatID: req.body.txtCatID,
            Quantity: req.body.txtQuantity,
            TinyDes: req.body.txtTinyDes,
            FullDes: req.body.txtFullDes,
            imgs :imgurl
        }
     
    }
    else{
        var entity = {
            ProName: req.body.txtProName,
            Price: req.body.txtPrice,
            CatID: req.body.txtCatID,
            Quantity: req.body.txtQuantity,
            TinyDes: req.body.txtTinyDes,
            FullDes: req.body.txtFullDes,
            
    }
  
    }
    await productModel.add(entity);
  
    console.log(entity);
    res.redirect('/admin/products/list');
})





// ----------------------------------------------


// --------------------

router.post('/del/:ProID',async function(req,res){
    await productModel.del(req.params.ProID);
    res.redirect('/admin/products/list');
})

// --------------------------------------------------
router.get('/edit', async function(req,res){
    const id = +req.query.id || -1;
    const rows = await productModel.single(id);
    const catname = await categoryModel.all();
    if(rows.length === 0)
    res.send('lỗi');
    const product = rows[0];
    res.render('admin/products/edit',{
        categorie:catname,
        product,
        layout: 'admin'
    });
})
// -------------------------------------------------------

router.post('/update',upload,async  function(req,res,next){
   
    // if(req.file){
       
    //     var condition = {
    //         ProName: req.body.txtProName,
    //         Price: req.body.txtPrice,
    //         CatID: req.body.txtCatID,
    //         Quantity: req.body.txtQuantity,
    //         TinyDes: req.body.txtTinyDes,
    //         FullDes: req.body.txtFullDes,
    //         imgs :imgurl,
    //     }

    // }
    // else{
    //     var condition = {
    //         ProName: req.body.txtProName,
    //         Price: req.body.txtPrice,
    //         CatID: req.body.txtCatID,
    //         Quantity: req.body.txtQuantity,
    //         TinyDes: req.body.txtTinyDes,
    //         FullDes: req.body.txtFullDes,
            
    // }
    // }
    
   

    // var update= productModel.patch(req.body.ProID,condition);
    // update.exec(function(err,data){
    // if(err) throw err;
    // employee.exec(function(err,data){
    //   if(err) throw err;
    //   res.redirect("/");  });
    //   });
    await productModel.patch(req.body);
   
    res.redirect('/admin/products/list');
  
console.log(imgurl);
})
// -----------------------------------------------





module.exports = router;