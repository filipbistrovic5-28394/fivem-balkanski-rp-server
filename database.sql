-- Kreiraj bazu podataka
CREATE DATABASE IF NOT EXISTS fivem_balkanski;
USE fivem_balkanski;

-- Tablica za igrače
CREATE TABLE IF NOT EXISTS users (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  identifier varchar(255) NOT NULL UNIQUE,
  license varchar(255) NOT NULL UNIQUE,
  name varchar(255) DEFAULT NULL,
  money int(11) DEFAULT 500,
  bank int(11) DEFAULT 5000,
  dirty_money int(11) DEFAULT 0,
  job varchar(255) DEFAULT 'unemployed',
  job_grade int(11) DEFAULT 0,
  last_login timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  whitelist int(11) DEFAULT 0,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP
);

-- Tablica za inventar
CREATE TABLE IF NOT EXISTS user_inventory (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  identifier varchar(255) NOT NULL,
  item varchar(255) NOT NULL,
  quantity int(11) DEFAULT 0,
  UNIQUE KEY unique_item (identifier, item)
);

-- Tablica za kuće/aparatmane
CREATE TABLE IF NOT EXISTS housing (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  owner varchar(255) DEFAULT NULL,
  label varchar(255) NOT NULL,
  coords_x float NOT NULL,
  coords_y float NOT NULL,
  coords_z float NOT NULL,
  price int(11) NOT NULL,
  rented int(11) DEFAULT 0
);

-- Tablica za garaže
CREATE TABLE IF NOT EXISTS garage_cars (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  identifier varchar(255) NOT NULL,
  model varchar(255) NOT NULL,
  plate varchar(255) NOT NULL UNIQUE,
  health float DEFAULT 1000,
  fuel float DEFAULT 100,
  garage_id int(11) DEFAULT 1
);

-- Tablica za bejebe
CREATE TABLE IF NOT EXISTS owned_vehicles (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  owner varchar(255) NOT NULL,
  plate varchar(255) NOT NULL UNIQUE,
  model varchar(255) NOT NULL,
  garage_id int(11) DEFAULT 1
);

-- Tablica za jobove
CREATE TABLE IF NOT EXISTS job_grades (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  job_name varchar(255) NOT NULL,
  grade int(11) NOT NULL,
  label varchar(255) NOT NULL,
  salary int(11) NOT NULL,
  skin_male varchar(255) DEFAULT NULL,
  skin_female varchar(255) DEFAULT NULL
);

-- Tablica za Policiju
CREATE TABLE IF NOT EXISTS job_police (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  identifier varchar(255) NOT NULL,
  rank varchar(255) NOT NULL,
  salary int(11) NOT NULL
);

-- Tablica za Medicinu
CREATE TABLE IF NOT EXISTS job_ambulance (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  identifier varchar(255) NOT NULL,
  rank varchar(255) NOT NULL,
  salary int(11) NOT NULL
);

-- Tablica za gathering lokacije
CREATE TABLE IF NOT EXISTS gathering_zones (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name varchar(255) NOT NULL,
  item_name varchar(255) NOT NULL,
  coords_x float NOT NULL,
  coords_y float NOT NULL,
  coords_z float NOT NULL,
  required_players int(11) DEFAULT 1,
  weapon_required int(11) DEFAULT 0,
  duration int(11) DEFAULT 5000
);

-- Tablica za trader ponude
CREATE TABLE IF NOT EXISTS trader_items (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  item_name varchar(255) NOT NULL,
  label varchar(255) NOT NULL,
  price int(11) NOT NULL,
  buy_price int(11) NOT NULL
);

-- Tablica za policijske akcije
CREATE TABLE IF NOT EXISTS police_logs (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  officer varchar(255) NOT NULL,
  action varchar(255) NOT NULL,
  target varchar(255) DEFAULT NULL,
  reason varchar(255) DEFAULT NULL,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP
);

-- Tablica za banke
CREATE TABLE IF NOT EXISTS banks (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  label varchar(255) NOT NULL,
  coords_x float NOT NULL,
  coords_y float NOT NULL,
  coords_z float NOT NULL
);

-- Tablica za pljačke
CREATE TABLE IF NOT EXISTS robberies (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  type varchar(255) NOT NULL,
  location varchar(255) NOT NULL,
  last_robbed timestamp DEFAULT NULL,
  cooldown int(11) DEFAULT 3600,
  reward int(11) DEFAULT 5000
);

-- Default jobovi
INSERT INTO job_grades (job_name, grade, label, salary) VALUES
('unemployed', 0, 'Nezaposlen', 0),
('police', 0, 'Policajac', 1500),
('police', 1, 'Višnji Policajac', 2000),
('police', 2, 'Inspektor', 2500),
('ambulance', 0, 'Sanitar', 1200),
('ambulance', 1, 'Doktor', 1800),
('mechanic', 0, 'Učenik', 800),
('mechanic', 1, 'Mehaničar', 1200),
('woodcutter', 0, 'Drvostaj', 600),
('miner', 0, 'Rudar', 700),
('fisherman', 0, 'Ribar', 550),
('taxi', 0, 'Taksiist', 700),
('trader', 0, 'Trgovac', 1000);

-- Default banke
INSERT INTO banks (label, coords_x, coords_y, coords_z) VALUES
('Glavna Banka', 150.0, -1040.0, 29.3),
('Banka Palete', 450.0, 200.0, 40.0);

-- Default pljačke
INSERT INTO robberies (type, location, reward) VALUES
('bank', 'Glavna Banka', 15000),
('store', 'Shop centar', 5000),
('store', 'Benzinska', 3000),
('store', 'Pharmacy', 4000);

-- Gathering lokacije
INSERT INTO gathering_zones (name, item_name, coords_x, coords_y, coords_z, required_players, weapon_required) VALUES
('Skupljanje Trave', 'trava', 100.5, 200.3, 70.0, 3, 1),
('Skupljanje Zlata', 'zlato', 200.5, 150.3, 75.0, 2, 0),
('Skupljanje Droga', 'kokain', 300.5, 250.3, 80.0, 4, 1),
('Rudarenje', 'mineral', 400.5, 300.3, 85.0, 1, 0),
('Ribarenje', 'riba', 500.5, 350.3, 5.0, 1, 0);
