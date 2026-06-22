const express = require('express');
const cors = require('cors');
const { nanoid } = require('nanoid');

const app = express();
app.use(cors());
app.use(express.json());

const urls = {};


app.get('/health', (req, res) => {
  res.status(200).json({ status: 'ok', uptime: process.uptime() });
});

app.post('/shorten', (req, res) => {
  const { url } = req.body;
  const id = nanoid(6);
  urls[id] = url;
  res.json({ shortUrl: `http://100.51.62.42:4000/${id}` });
});

app.get('/:id', (req, res) => {
  const url = urls[req.params.id];
  if (url) {
    res.redirect(url);
  } else {
    res.status(404).json({ error: 'URL not found' });
  }
});


app.listen(4000, () => console.log('Backend running on port 4000'));
