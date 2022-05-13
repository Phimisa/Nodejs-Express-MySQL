const express = require('express');
const categoryModel = require('../models/category.model');
const router = express.Router();


router.get('/list', async function(req,res,next){
    // throw new Error ('not implemented');
    const list = await categoryModel.all();
    res.render('admin/categories/list',{
        categories:list,
        layout:"admin",
        empty:list.length === 0
    });
})
// -----------------------------------------------
router.get('/add',function(req,res){
    res.render('admin/categories/add',{
        layout: 'admin'
    });
})
router.post('/add',async function(req,res){
    const entity = {
        CatName: req.body.txtCatName,
    }
    await categoryModel.add(entity);
    res.redirect('/admin/categories/list');
})
// --------------------------------------------------
router.get('/edit',async function(req,res){
    const id = +req.query.id || -1;
    const rows = await categoryModel.single(id);
    if(rows.length === 0)
    res.send('lỗi');
    const category = rows[0];
    res.render('admin/categories/edit',{
        category,
        layout: 'admin'
    });
})

router.post('/del/:CatID',async function(req,res){
    await categoryModel.del(req.params.CatID);
    res.redirect('/admin/categories/list');
})



router.post('/update',async function(req,res){
    await categoryModel.patch(req.body);
    res.redirect('/admin/categories/list');
})

//------


module.exports = router;