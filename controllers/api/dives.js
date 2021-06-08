const router = require('express').Router();
const { Dive } = require('../../models');

/* use Express.js' router object to create a GET
 endpoint for the getLatest query.
 Using async/await here means we don't need to 
 write the returned Promise as a nested callback */
router.get('/', async (req, res) => {
  const { rows } = await Dive.getLatest();
  res.json(rows);
});

module.exports = router;
