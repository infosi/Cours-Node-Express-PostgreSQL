const { Pool } = require('pg');

require('../../node-example-sessions-api level 1/node_modules/dotenv/lib/main').config()

const db = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
});

module.exports = db;
