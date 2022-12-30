const router = require('express').Router();

const sessionsCtrl = require('../controllers/sessions')

router.get('/', sessionsCtrl.getSessions);

module.exports = router;