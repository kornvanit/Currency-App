const express = require('express')
const app = express()
const members = require('./member.json')
const bodyParser = require('body-parser')

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))

app.get('/', (req, res) => {
    res.send('Hello')
})

app.get('/member', (req, res) => {
    res.json(members)
})

app.listen(4200, () => {
    console.log('Start server at port 4200.');
})