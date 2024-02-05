INSERT INTO Genre (genre_id, name_genre) 
VALUES (1, 'Поп'),
	   (2, 'Рок'),
	   (3, 'Джаз'),
	   (4, 'Блюз'),
	   (5, 'Шансон'),
	   (6, 'Хип-хоп'),
	   (7, 'Кантри');	 	  

INSERT INTO Artist  (artist_id , nickname) 
VALUES (1, 'Виктория Дайнеко'),
	   (2, 'Михаил Боярский'),
	   (3, 'Стас Михайлов'),
	   (4, 'Бьянка');
	 
INSERT INTO GenresArtists  (genre_id, artist_id) 
VALUES (1, 1),
       (5, 2),
	   (5, 3),
	   (6, 4);

INSERT INTO Album (album_id, name_album, year_of_release) 
VALUES (1, 'Вокруг света', '2024-01-02'),
	   (2, 'Конфетти', '2019-01-09'),
	   (5, 'Московский бит', '2024-01-02'),
	   (6, 'Заколдованные сны', '2020-01-08');

INSERT INTO ArtistsAlbums (artist_id, album_id) 
VALUES (1, 6),
	   (2, 1),
	   (3, 5),
	   (4, 6),
	   (1, 2),
	   (4, 2);
	
INSERT INTO Track  (track_id, name_track, duration, album_id) 
VALUES (1, 'Мой город', 120, 1),
       (2, 'Луна', 215, 2),
       (3, 'Все для тебя', 143, 5),
       (4, 'Зеленоглазое такси', 135, 6),
       (5, 'Мира мало', 238, 1),
	   (6, 'Были танцы', 97, 5);

INSERT INTO Collection (collection_id, name_collection, year_of_release) 
VALUES (1, 'Иллюзия', '2027-07-12'),
	   (2, 'Океаны', '2018-01-10'),
	   (3, 'Мир', '2020-01-24'),
	   (4, 'Космос', '2024-01-24');

INSERT INTO TracksCollections (track_id, collection_id) 
VALUES (1, 1),
       (2, 2),
       (3, 4),
       (4, 1),
       (5, 3),
	   (6, 2);