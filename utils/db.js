const mysql = require("mysql");
const config = require("../config/default.json");
const pick = require('lodash/pick');
const omit = require('lodash/omit');
const pool = mysql.createPool(config.mysql);
var createConnection = () => mysql.createConnection(config['mysql']);

module.exports = {
    load: function(sql) {
        return new Promise(function(resolve, reject) {
            pool.query(sql, function(error, results) {
                if (error) {
                    return reject(error);
                }
                resolve(results);
            });

        });
    },
    // * thêm
    add: function(table, entity) {
        return new Promise(function(resolve, reject) {
            const sql = `insert into ${table} set ?`;
            pool.query(sql, entity, function(error, results) {
                if (error) {
                    return reject(error);
                }
                resolve(results);
            });

        });
    },
    //* update



    patch: function(table, entity, condition) {
        return new Promise(function(resolve, reject) {
            const sql = `update ${table} set ? where ?`;
            pool.query(sql, [entity, condition], function(error, results) {
                if (error) {
                    return reject(error);
                }
                resolve(results);
            });

        });
    },



    
  update: (tableName, idField, entity) => {
    return new Promise((resolve, reject) => {

      // if (entity[idField]) {
      // const id = entity[idField];
      // delete entity[idField];
      const condition = pick(entity, [idField]);
      entity = omit(entity, [idField]);

      var connection = createConnection();
      // var sql = `update ${tableName} set ? where ${idField} = ?`;
      var sql = `update ${tableName} set ? where ?`;
      connection.connect();
      // connection.query(sql, [entity, id], (error, results, fields) => {
      connection.query(sql, [entity, condition], (error, results, fields) => {
        if (error) {
          reject(error);
        } else {
          resolve(results.changedRows);
        }
        connection.end();
      });
      // }
    });
  },
    //* del
    del: function(table, condition) {
            return new Promise(function(resolve, reject) {
                const sql = `delete from ${table} where ?`;
                pool.query(sql, condition, function(error, results) {
                    if (error) {
                        return reject(error);
                    }
                    resolve(results);
                });

            });
        }
        //*pool
        //   load: function (sql, fb_done, fn_fail) {
        //     pool.query(sql, function (error, results, fields) {
        //       if (error) {
        //         return fn_fail(error);
        //       }
        //       fb_done(results);
        //     });
        //   },
        //** callback*/
        //   load: function (sql, fb_done, fn_fail) {
        //     const cn = mysql.createConnection(config.mysql);
        //     cn.connect();
        //     cn.query(sql, function (error, results, fields) {
        //       if (error) {
        //         cn.end();
        //         fn_fail(error);
        //         return;
        //       }
        //       fb_done(results);
        //       cn.end();
        //     });
        //   },
};