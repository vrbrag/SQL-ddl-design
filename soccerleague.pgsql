DROP DATABASE soccerleague_db;

CREATE DATABASE soccerleague_db;

\c soccerleague_db

CREATE TABLE teams(
   id SERIAL PRIMARY KEY,
   name VARCHAR(20) NOT NULL,
   city VARCHAR(20)
);

CREATE TABLE players(
   id SERIAL PRIMARY KEY,
   name VARCHAR(20) NOT NULL,
   teamid INTEGER REFERENCES teams(id)
);

CREATE TABLE refs(
   id SERIAL PRIMARY KEY,
   name VARCHAR(20) NOT NULL
);

CREATE TABLE season(
   id SERIAL PRIMARY KEY,
   start_date DATE,
   end_date DATE
);

CREATE TABLE matches(
   id SERIAL PRIMARY KEY,
   team1_id INTEGER REFERENCES teams(id),
   team2_id INTEGER REFERENCES teams(id),
   date DATE,
   seasonid INTEGER REFERENCES season(id),
   ref1_id INTEGER REFERENCES refs(id),
   ref2_id INTEGER REFERENCES refs(id)
);

CREATE TABLE goals(
   id SERIAL PRIMARY KEY,
   playerid INTEGER REFERENCES players(id),
   matchid INTEGER REFERENCES matches(id)
);

CREATE TABLE results(
   id SERIAL PRIMARY KEY,
   teamid INTEGER REFERENCES teams(id),
   matchid INTEGER REFERENCES matches(id),
   result VARCHAR(10)
);


INSERT INTO teams (name, city) VALUES ('LA Galaxy', 'Los Angeles'), ('Austin FC', 'Austin');

INSERT INTO players (name, teamid) VALUES ('Zlatan Ibrahimovic', 1), ('Maximiliano Urruti', 2);

INSERT INTO refs (name) VALUES ('Mike Wells'), ('Timothy Garfield');

INSERT INTO season (start_date, end_date) VALUES ('2020-10-10', '2021-07-18'), ('2021-10-10', '2022-07-18');

INSERT INTO matches (team1_id, team2_id, date, seasonid, ref1_id, ref2_id) VALUES (1, 2, '2020-12-12', 1, 1, 2);

INSERT INTO goals (playerid, matchid) VALUES (1, 1);

INSERT INTO results (teamid, matchid, result) VALUES (1, 1, 1);