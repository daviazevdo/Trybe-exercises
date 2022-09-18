-- EXERCÍCIOS DO DIA 20.4

USE Pixar;

SET SQL_SAFE_UPDATES = 0;

/*
	Insira as produções da Pixar na tabela Movies:

	Monstros SA, de Pete Docter, lançado em 2001, com 92 minutos de duração.
	Procurando Nemo, de John Lasseter, lançado em 2003, com 107 minutos de duração.
	Os Incríveis, de Brad Bird, lançado em 2004, com 116 minutos de duração.
	WALL-E, de Pete Docter, lançada em 2008, com 104 minutos de duração.
*/

INSERT INTO Movies (title, director, year, length_minutes) VALUES
('Monstros SA', 'Pete Docter', 2001, 92),
('Procurando Nemo', 'John Lasseter', 2003, 107),
('Os Incríveis', 'Brad Bird', 2004, 116),
('WALL-E', 'Pete Docter', 2008, 104);

--  O filme Procurando Nemo foi classificado em 6.8, fez 450 milhões no mercado 
-- interno e 370 milhões no mercado internacional. Insira as informações à tabela BoxOffice. id 9

INSERT INTO BoxOffice (movie_id, rating, domestic_sales, international_sales) VALUES
(9, 6.8, 450000000, 370000000);

-- O nome do diretor do filme "Procurando Nemo" está incorreto, ele foi dirigido por Andrew Staton. 
-- Corrija esse dado utilizando o comando UPDATE.

UPDATE Movies
SET director = 'Andrew Staton'
WHERE title = 'Procurando Nemo';

-- O título do filme "Ratatouille" está incorreto na tabela Movies. 
-- Além disso, o filme foi lançado em 2007 e não em 2010. Corrija esses dados utilizando o comando UPDATE.

UPDATE Movies
SET title = 'Ratatouille', year = 2007
WHERE id = 3;

/*

	Insira as novas classificações abaixo na tabela BoxOffice, 
    lembre-se que a coluna movie_id é uma foreign key referente a coluna id da tabela Movies:
    
	id = 8 -- Monsters SA, classificado em 8.5, lucrou 300 milhões no mercado interno e 250 milhões no mercado internacional.
	id = 10 -- Os Incríveis, classificado em 7.4, lucrou 460 milhões no mercado interno e 510 milhões no mercado internacional.
	id = 11 -- WALL-E, classificado em 9.9, lucrou 290 milhões no mercado interno e 280 milhões no mercado internacional.

*/

INSERT INTO BoxOffice (movie_id, rating, domestic_sales, international_sales) VALUES
(8, 8.5, 300000000, 250000000),
(10, 7.4, 460000000, 510000000),
(11, 9.9, 290000000, 280000000);

-- Exclua da tabela Movies o filme "WALL-E".

-- olha aqui o delete em cascata
-- O id de WALL-E era 11, e era usado como chave estrangeira na tabela BoxOffice
-- por isso, foi necessário apagar em BoxOffice primeiro
-- depois, o id de WALL-E não estava mais sendo usado em lugar nenhum
-- e por isso deu para excluí-lo :)

DELETE FROM BoxOffice
WHERE movie_id = 11;

DELETE FROM Movies
WHERE title = 'WALL-E';

-- Exclua da tabela Movies todos os filmes dirigidos por "Andrew Staton".

SELECT * FROM Movies WHERE director = 'Andrew Staton';

-- o delete em cascata de novo!

DELETE FROM BoxOffice
WHERE movie_id = 2 OR movie_id = 9;

DELETE FROM Movies
WHERE director = 'Andrew Staton';

SELECT * FROM Movies;
SELECT * FROM BoxOffice;
