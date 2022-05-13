const express = require('express');
const userModel = require('../models/user.model');
const config = require('../config/default.json');
const router = express.Router();
const  moment = require('moment');
const bcrypt = require('bcrypt');
const { redirect } = require('express/lib/response');

router.get('/login', async function (req, res) {
    res.render('user/login');
   
})
router.post('/login', async function (req, res) {
    const user = await userModel.singleByUserName(req.body.username);
    if(user === null){
        return res.render('user/login',{
            err: 'Bạn đã nhập sai tài khoản, vui lòng đăng nhập lại'
        })
    }
   
    const rs = bcrypt.compareSync(req.body.password,user.password);
    if(rs === false){
        return res.render('user/login',{
            err: 'Bạn đã nhập sai mật khẩu, vui lòng đăng nhập lại'
        })
    }
    delete user.password;
    req.session.isAuthenticated = true;
    req.session.authUser = user;

    const url = req.query.retUrl || '/';
    res.redirect(url);

})

router.post('/logout',  async function (req, res) {
    req.session.isAuthenticated = false;
    req.session.authUser = null;
    res.redirect(req.headers.referer);
   
})

// mdw
const restrict = require('../middlewares/auth.mdw');
// end mdw

router.get('/register',  async function (req, res) {
    res.render('user/register');
   
})
router.post('/register', async function (req, res) {
    const dob = moment(req.body.dob,'DD/MM/YYYY').format('YYYY-MM-DD');
    const  password_hash = bcrypt.hashSync(req.body.password,config.authentication.saltRounds);
    const entity = {
        username: req.body.username,
        password: password_hash,
        name: req.body.name,
        email: req.body.email,
        dob ,
        permission: 1,
    }

    await userModel.add(entity);
    res.render('user/register');
   
})




router.get('/profile', restrict, async function (req, res) {
    console.log(req.session.authUser);
    res.render('user/profile');
   
})

//validation
router.get('/is-available',  async function (req, res) {
    const user = await userModel.singleByUserName(req.query.user);
    if(!user){
        return res.json(true);
    }
    res.json(false);
})

// -----------------------------------------------

module.exports = router;