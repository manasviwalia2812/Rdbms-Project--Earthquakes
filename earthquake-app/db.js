const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Parman@2812', // your MySQL password
  database: 'EarthquakeDB'
});

connection.connect((err) => {
  if (err) throw err;
  console.log('✅ Connected to EarthquakeDB');
});

module.exports = connection;
