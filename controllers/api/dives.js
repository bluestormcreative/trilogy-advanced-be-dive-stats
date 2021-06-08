const router = require('express').Router();
const { Dive } = require('../../models');

/* use Express.js' router object to create a GET
 endpoint for the getLatest query.
 Using async/await here means we don't need to 
 write the returned Promise as a nested callback. 
 Note the route is '/' which means the /dives endpoint*/
router.get('/', async (req, res) => {
  const { rows } = await Dive.getLatest();
  res.json(rows);
});

/* the stats route accepts a query param for most_active_month */
router.get('/stats', async (req, res) => {
  if (req.query.data === 'most_active_month') {
    const { rows } = await Dive.getActiveMonth();
    res.json(rows[0]);
  }
  else {
    res.status(404).end();
  }
});

module.exports = router;
