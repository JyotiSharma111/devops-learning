const express = require('express');
const cors = require('cors');
const { nanoid } = require('nanoid');
const client = require('prom-client');

const app = express();
app.use(cors());
app.use(express.json());

const urls = {};

// Prometheus metrics
const register = new client.Registry();
client.collectDefaultMetrics({ register });

const urlsCreated = new client.Counter({
  name: 'urls_shortened_total',
  help: 'Total number of URLs shortened',
});
register.registerMetric(urlsCreated);

app.get('/health', (req, res) => {
  res.status(200).json({ status: 'ok', uptime: process.uptime() });
});

app.get('/metrics', async (req, res) => {
  res.set('Content-Type', register.contentType);
  res.end(await register.metrics());
});

app.post('/shorten', (req, res) => {
  const { url } = req.body;
  const id = nanoid(6);
  urls[id] = url;
  urlsCreated.inc();
  const host = req.headers['x-forwarded-host'] || req.headers.host || 'localhost:4000';
  res.json({ shortUrl: `http://${host}/${id}` });
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