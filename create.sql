-- Создание БД для музыкального сервиса

CREATE TABLE IF NOT EXISTS Genre (
	genre_id SERIAL PRIMARY KEY,
	name_genre VARCHAR (60) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Artist (
	artist_id SERIAL PRIMARY KEY,
	nickname VARCHAR (40) NOT NULL
);

CREATE TABLE IF NOT EXISTS GenresArtists (
	genre_id INTEGER REFERENCES Genre(genre_id),
	artist_id INTEGER REFERENCES Artist(artist_id),
	CONSTRAINT pk PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE IF NOT EXISTS Album (
	album_id SERIAL PRIMARY KEY,
	name_album VARCHAR (80) NOT NULL,
	year_of_release date NOT NULL CHECK (year_of_release > '2017-01-01')
);

CREATE TABLE IF NOT EXISTS ArtistsAlbums (
	artist_id INTEGER REFERENCES Artist(artist_id),
	album_id INTEGER REFERENCES Album (album_id),
	CONSTRAINT pk1 PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS Track (
	track_id SERIAL PRIMARY KEY,
	name_track VARCHAR (80) NOT NULL,
	duration INTEGER CHECK (duration > 0 AND duration < 250),
	album_id INTEGER NOT NULL REFERENCES Album (album_id)
);

CREATE TABLE IF NOT EXISTS Collection (
	collection_id SERIAL PRIMARY KEY,
	name_collection VARCHAR (80) NOT NULL,
	year_of_release date NOT NULL CHECK (year_of_release > '2017-01-01')
);

CREATE TABLE IF NOT EXISTS TracksCollections (
	track_id INTEGER REFERENCES Track (track_id),
	collection_id INTEGER REFERENCES Collection (collection_id),
	CONSTRAINT pk2 PRIMARY KEY (track_id, collection_id)
);