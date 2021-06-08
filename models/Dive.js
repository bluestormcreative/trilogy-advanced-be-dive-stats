const db = require('../config/connection');

/* Create a dive class with a getLatest method to query the db
 and return the lastest entry (it will return a Promise object first) */
class Dive {
  getLatest() {
    return db.query(`SELECT * FROM dives ORDER BY dive_date DESC LIMIT 100`);
  }
}

module.exports = new Dive();
