DROP DATABASE craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db

CREATE TABLE regions(
   id SERIAL PRIMARY KEY,
   name VARCHAR(100)
);

CREATE TABLE users(
   id SERIAL PRIMARY KEY,
   username VARCHAR(100) NOT NULL,
   password TEXT NOT NULL,
   pref_regionid INTEGER REFERENCES regions(id)
);

CREATE TABLE categories(
   id SERIAL PRIMARY KEY,
   name VARCHAR(100)
);

CREATE TABLE posts(
   id SERIAL PRIMARY KEY,
   title TEXT NOT NULL,
   text TEXT,
   userid INTEGER REFERENCES users(id),
   regionid INTEGER REFERENCES regions(id),
   categoryid INTEGER REFERENCES categories(id)
);

INSERT INTO regions (name) VALUES ('Seattle'), ('San Francisco'), ('Los Angeles');

INSERT INTO users (username, password, pref_regionid) VALUES ('texboy12', '#######', 1), ('jamieLee', '######', 2), ('charzard22', '#######', 3);

INSERT INTO categories (name) VALUES ('Trending'), ('Photography'), ('Travel');

INSERT INTO posts (title, text, userid, regionid, categoryid) VALUES ('Italy: Top 10 must try gelato shops', 'Try these flavors!', 1, 1, 3), ('Top Gun - Miles Teller', 'Tell all of Top Gun training camp', 2, 2, 1), ('Golden Hour', 'How to capture best golden hour photos', 3,3,2);