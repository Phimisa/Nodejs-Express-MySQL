const db = require('../utils/db');
const TBL_PRODUCTS = 'products';
const TBL_CATEGORIES ='categories';

module.exports = {
    all: function(){
        return db.load(`select * from ${TBL_PRODUCTS} inner join ${TBL_CATEGORIES} on ${TBL_PRODUCTS}.CatID = ${TBL_CATEGORIES}.CatID `);
},
    add: function(entity){
        return db.add(TBL_PRODUCTS,entity);
},
    del: function(id){
        const condition = {
            ProID : id,
        }
        return db.del(TBL_PRODUCTS,condition);
 },
    single: function(id){
        return db.load(`select * from ${TBL_PRODUCTS} where ProID = ${id}  `);
},
    patch: function(entity){
        const condition = {
            ProID : entity.ProID,
        }
        delete entity.ProID;

        return db.patch(TBL_PRODUCTS,entity,condition);
    },

//    patch: function (){
//        return db.patch(`UPDATE products SET ProName='${req.body}'`);
//    },


  











// ============================================================================================================
    allGrid: function(catId){
        return db.load(`select * from ${TBL_PRODUCTS} where ProID = ${catId}`);
},
    pageGrid: function(catId,limit,offset){
        return db.load(`select * from ${TBL_PRODUCTS} where CatID = ${catId} limit ${limit} offset ${offset}`);
},
    countGrid: async function(catId){
       const rows = await db.load(`select count(*) as total from ${TBL_PRODUCTS} where CatID = ${catId}`);
       return rows[0].total;
},

};