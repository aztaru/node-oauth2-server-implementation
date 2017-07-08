/**
 * Created by Manjesh on 14-05-2016.
 */

module.exports = {
  sql: {
    database: 'oauth_demo',
    username: 'root',
    password: 'password',
    dialect: 'mysql', // PostgreSQL, MySQL, MariaDB, SQLite and MSSQL See more: http://docs.sequelizejs.com/en/latest/
    logging: true,
    timezone: '+05:30',
  },
  mongo: {
    uri: 'mongodb://gloryque:intranet@192.168.0.200:27017/gloryque_quarc'
  },
  seedDB:true,
  seedMongoDB:false,
  seedDBForce:false,
  db:'sql' // mongo,sql if you want to use any SQL change dialect above in sql config
}
