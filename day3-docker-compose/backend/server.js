const express = require('express');
const cors = require('cors');
const app = express();
const PORT = 4000;

app.use(cors());

app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', message: 'Backend is running!' });
});

app.listen(PORT, () => {
  console.log(`Backend running on port ${PORT}`);
});
