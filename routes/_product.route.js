const express = require('express');
const productModel = require('../models/product.model');
const config = require('../config/default.json');
const router = express.Router();


router.get('/grid/:catId', async function (req, res) {
    // const list = await productModel.allGrid(req.params.catId);

    const page = +req.query.page || 1;
    if (page < 0) page = 1;
    const offset = (page - 1) * config.pagination.limit;
    // const list = await productModel.pageGrid(req.params.catId, config.pagination.limit, offset);
    // const total = await productModel.countGrid(req.params.catId);
    const [list, total] = await Promise.all([
        productModel.pageGrid(req.params.catId, config.pagination.limit, offset),
        productModel.countGrid(req.params.catId)
    ]);
    const nPages = Math.ceil(total / config.pagination.limit);
    const page_items = [];
    for (let i = 1; i <= nPages; i++) {
        const item = {
            value: i,
            isActive: i === page
        }
        page_items.push(item);
    }


    res.render('user/grid', {
        products: list,
        empty: list.length === 0,
        page_items: page_items,
        prev_value: page - 1,
        next_value: page + 1,
        can_go_prev: page > 1,
        can_go_next: page < nPages,
    });
})



// -----------------------------------------------

module.exports = router;