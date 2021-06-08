const db = require('../config/connection');

class Diver {
  getAll() {
    return db.query(`SELECT * FROM divers ORDER BY last_name`);
  }

  getOne({ id }) {
    return db.query(
      `SELECT * FROM divers WHERE id = $1`,
      [ id ]
    );
  }
}

module.exports = new Diver();
