const express = require('express');
const app = express();
app.use(express.static('public'));
const db = require('./db');
const port = 3000;

app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(express.urlencoded({ extended: true }));

// Get list of locations for form
app.get('/', (req, res) => {
  db.query('SELECT * FROM Locations', (err, locations) => {
    if (err) throw err;
    res.render('index', { locations });
  });
});

// Handle form submission
app.post('/view', (req, res) => {
  const { locationID, detailType } = req.body;

  const baseQuery = `
    SELECT E.ID, E.Date, E.Magnitude, E.Epicenter, E.Depth, L.Country, L.State, L.City
    FROM Earthquake E
    INNER JOIN Locations L ON E.LocationID = L.LocationID
    WHERE E.LocationID = ?
  `;

  db.query(baseQuery, [locationID], (err, earthquakes) => {
    if (err) throw err;

    if (earthquakes.length === 0) {
      return res.send('No earthquakes found for this location.');
    }

    const earthquakeID = earthquakes[0].ID;

    let detailQuery = '';
    let detailLabel = '';
    
    switch (detailType) {
      case 'damage':
        detailQuery = 'SELECT * FROM Damage WHERE EarthquakeID = ?';
        detailLabel = 'Damage Details';
        break;
      case 'rescue':
        detailQuery = 'SELECT * FROM RescueEfforts WHERE EarthquakeID = ?';
        detailLabel = 'Rescue Efforts';
        break;
      case 'animals':
        detailQuery = 'SELECT * FROM AnimalsAffected WHERE EarthquakeID = ?';
        detailLabel = 'Animals Affected';
        break;
      default:
        return res.send('Invalid detail type.');
    }

    db.query(detailQuery, [earthquakeID], (err, details) => {
      if (err) throw err;

      res.render('details', {
        earthquake: earthquakes[0],
        details,
        detailType,
        detailLabel
      });
    });
  });
});

app.listen(3000, () => {
  console.log('🚀 Server running at http://localhost:3000');
});
