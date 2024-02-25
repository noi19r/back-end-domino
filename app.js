const orders = require('./data/orders.json')

const express = require('express')
const port = process.env.PORT || 3000

const app = express()
app.use(express.urlencoded({ extended: false }))

app.use('/assets', express.static('assets'))

app.get('/', (req, res) => {
	res.send('Server ok!')
})

app.get('/orders', (req, res) => {
	res.json(orders)
})

app.listen(port, () => console.log(`Server is listening on port ${port}`))
