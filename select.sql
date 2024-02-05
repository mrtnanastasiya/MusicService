--Задание 2
-- 1. Название и продолжительность самого длительного трека.
SELECT name_track, duration
FROM Track
WHERE duration >= (SELECT MAX(duration) FROM Track);

--2. Название треков, продолжительность которых не менее 3,5 минут(210 секунд).
SELECT name_track
FROM Track
WHERE duration >= 210;

--3. Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name_collection
FROM Collection
WHERE year_of_release BETWEEN '2018-01-01' AND '2021-01-01';

--4. Исполнители, чьё имя состоит из одного слова.
SELECT nickname 
FROM Artist
WHERE nickname NOT LIKE '% %';

--5. Название треков, которые содержат слово «мой» или «my».
SELECT name_track
FROM Track
WHERE LOWER(name_track) LIKE LOWER('%мой%')
	OR LOWER(name_track) LIKE LOWER('%my%');


--Задание 3
--1. Количество исполнителей в каждом жанре.
SELECT genre_id, COUNT(*) FROM GenresArtists
GROUP BY genre_id
ORDER BY COUNT(*) DESC;

--2. Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(*) AS tracks19_20
FROM Track t
JOIN Album a ON t.album_id = a.album_id
WHERE year_of_release BETWEEN '2019-01-01' AND '2021-01-01';

--3. Средняя продолжительность треков по каждому альбому.
SELECT a.name_album, AVG(t.duration) AS avgduration FROM Track t 
JOIN Album a on a.album_id=t.album_id GROUP BY a.album_id;

--4. Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT a.artist_id FROM Artist a
JOIN ArtistsAlbums aa ON a.artist_id=aa.artist_id 
JOIN Album al ON aa.album_id=al.album_id
GROUP BY a.artist_id
HAVING SUM(CASE WHEN al.year_of_release BETWEEN '2020-01-01' AND '2021-01-01' THEN 1 ELSE 0 END) = 0;

--5. Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT c.name_collection FROM Collection c 
JOIN TracksCollections tc on c.collection_id=tc.collection_id
JOIN Track t on tc.track_id = t.track_id
JOIN Album a on t.album_id = a.album_id
JOIN ArtistsAlbums aa on a.album_id = aa.album_id
JOIN Artist art on aa.artist_id = art.artist_id
WHERE art.artist_id = 1 ;






















