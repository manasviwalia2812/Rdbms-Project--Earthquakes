# Rdbms-Project--Earthquakes
# 🌍 Earthquake Database Management System

This project is a **Relational Database Management System** built as part of an academic assignment. The primary objective was to design and implement a comprehensive database to store and manage data related to **earthquakes**, including affected locations, damage reports, rescue efforts, and animals affected.

We started by creating and populating the database using **SQL**, running various queries to extract meaningful insights.

To enhance usability, we later integrated a **Node.js backend** and developed a **minimal, professional front-end** using **HTML**, **CSS**, and **EJS templates**, allowing users to interact with the data easily. Users can now select a place and view specific earthquake details through the web interface.

## Folder Structure

Here is an overview of the folder structure of the project:<br>

earthquake-app/<br>
├── app.js # Main Node.js server file<br>
├── views/ # Contains EJS template files for the frontend<br>
│ ├── index.ejs # Homepage where users select location and details<br>
│ └── details.ejs # Displays earthquake details based on user selection<br>
├── public/ # Static files (e.g., images, styles, scripts)<br>
│ └── css/ # Contains stylesheets for the project<br>
│ └── styles.css # CSS file for styling the frontend<br>
├── database/ # SQL scripts and database setup files<br>
│ └── create_schema.sql # SQL file to create and populate the EarthquakeDB<br>
└── package.json # Node.js dependencies and configuration<br>


## How to Run the Project

1. Clone the repository:

   ```bash
   git clone https://github.com/manasviwalia2812/Rdbms-Project--Earthquakes.git

## Installing dependencies
cd earthquake-app<br>
npm install

## Run the project
node app.js

## Tech Stack
Backend: Node.js, Express<br>
Database: MySQL (Relational Database)<br>
Frontend: HTML, CSS, EJS<br>
Dependencies: mysql2, express, ejs<br>
