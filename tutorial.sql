CREATE TABLE STUDENTS (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  gender TEXT NULL,
  score DOUBLE NULL
);

INSERT INTO students VALUES (1, 'Ryan', 'M', 45.5);
INSERT INTO students VALUES (2, 'Joanna', 'F', 85);
INSERT INTO students VALUES (3, 'Albert', 'M', 90);
INSERT INTO students VALUES (8, 'Dubov', 'M', 99);

------------------------------------------------

--* SELECT: extracts data from a database.
-- all columns
SELECT * FROM STUDENTS; 
-- name column
SELECT NAME FROM STUDENTS; 

--* WHERE: clause is used to filter records.
-- datatable of female students
SELECT * FROM STUDENTS WHERE gender = 'F'; 
-- male student column in data table
SELECT NAME FROM STUDENTS WHERE GENDER = 'M';
-- students with id 1
SELECT * FROM STUDENTS WHERE ID = '1';
-- students whose id is greater than 2
SELECT * FROM STUDENTS WHERE ID > 2; 

--* ORDER BY: sorts the result set
-- desceding order by id.
SELECT * FROM STUDENTS ORDER BY ID DESC;
-- asceding order by gender. ASC is default.
SELECT ID, NAME FROM STUDENTS ORDER BY GENDER ASC;

--* INSERT INTO: used to insert new records in a table.
INSERT INTO students VALUES (4, 'Magnus', 'M', 100);
INSERT INTO students (id, name) VALUES (5, 'Melina');

--* OPERATORS: AND, OR, NOT, IS NULL, IS NOT NULL
SELECT * FROM STUDENTS WHERE GENDER = 'M' AND SCORE > 60;
SELECT * FROM STUDENTS WHERE GENDER = 'F' OR SCORE < 60;
SELECT * FROM STUDENTS WHERE NOT GENDER = 'M';
SELECT * FROM STUDENTS WHERE GENDER = 'M' AND (SCORE < 50 OR SCORE > 80);

SELECT * FROM STUDENTS WHERE GENDER IS NULL;
SELECT * FROM STUDENTS WHERE GENDER IS NOT NULL;

--* UPDATE: used to modify the existing records in a table.
UPDATE STUDENTS SET GENDER = 'F', SCORE = 80 WHERE ID = 5;
-- UPDATE STUDENTS SET NAME = 'ALLNAME';

--* DELETE: used to delete existing records in a table.
DELETE FROM STUDENTS WHERE ID = 3;
-- DELETE FROM STUDENTS; -- for delete all data in table.
-- DROP TABLE STUDENTS; -- for delete table.

--* MIN & MAX: smallest or largest value of the selected column.
SELECT MIN(SCORE) FROM STUDENTS;
SELECT MAX(SCORE) FROM STUDENTS WHERE GENDER = 'F';
SELECT MAX(SCORE) AS HighestScore FROM STUDENTS;

--* COUNT: returns the number of rows that matches a specified criterion.
SELECT COUNT(*) FROM STUDENTS;
SELECT COUNT(NAME) FROM STUDENTS WHERE SCORE > 80; -- NULL values will not be counted.
SELECT COUNT(DISTINCT NAME) FROM STUDENTS; -- ignore duplicates.

--* SUM: returns the total sum of a numeric column.
SELECT SUM(SCORE) FROM STUDENTS;
SELECT SUM(SCORE*2) FROM STUDENTS; -- total score x 2
SELECT SUM(SCORE) AS TotalScore FROM STUDENTS WHERE SCORE > 50;

--* AVG: returns the average value of a numeric column.
SELECT AVG(SCORE) AS ScoreAvg FROM STUDENTS;

--* LIKE: search for a specified pattern in a column.
-- %: represents zero, one, or multiple characters.
-- _: represents one, single character.
SELECT NAME FROM STUDENTS WHERE NAME LIKE 'M%';
SELECT NAME FROM STUDENTS WHERE NAME LIKE 'M_G__%';
SELECT NAME FROM STUDENTS WHERE NAME LIKE '%A%';
SELECT NAME FROM STUDENTS WHERE NAME LIKE '%A%' AND ID LIKE '2%';

--* IN & NOT IN & BETWEEN & NOT BETWEEN
SELECT * FROM STUDENTS WHERE SCORE IN (85,90,95,100);
SELECT * FROM STUDENTS WHERE SCORE NOT IN (85,100);
SELECT * FROM STUDENTS WHERE SCORE BETWEEN 0 AND 50;
SELECT * FROM STUDENTS WHERE SCORE NOT BETWEEN 0 AND 50;
-- SELECT * FROM Orders WHERE OrderDate BETWEEN #07/01/1996# AND #07/31/1996#;
-- SELECT * FROM Orders WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

--* AS: 
-- SELECT CustomerName, CONCAT(Address,', ',PostalCode,', ',City,', ',Country) AS Address FROM Customers; 

CREATE TABLE SCORES(
    id INTEGER PRIMARY KEY,
    score DOUBLE NULL,
    blitz DOUBLE NULL,
    rapid DOUBLE NULL,
    classic DOUBLE NULL
);

INSERT INTO SCORES VALUES (1, 1650, 1200, 1500, 1500);
INSERT INTO SCORES VALUES (2, 1650, 1200, 1500, 1650);
INSERT INTO SCORES VALUES (3, 1650, 1200, 1500, 1600);
INSERT INTO SCORES VALUES (8, 3200, 2850, 3250, 2720);


--* JOINs: used to combine rows from two or more tables, based on a related column between them.
-- INNER JOIN: Returns common columns from tables.
-- LEFT JOIN: Returns all records from the left table, and the matched records from the right table.
-- RIGHT JOIN: Returns all records from the right table, and the matched records from the left table.
-- FULL JOIN: Returns all records when there is a match in either left or right table.

SELECT STUDENTS.NAME, SCORES.CLASSIC FROM SCORES INNER JOIN STUDENTS ON SCORES.ID = STUDENTS.ID;
-- SELECT NAME, CLASSIC FROM SCORES INNER JOIN STUDENTS ON SCORES.ID = STUDENTS.ID; -- same 
-- SELECT NAME, CLASSIC FROM SCORES INNER JOIN STUDENTS ON SCORES.ID = STUDENTS.ID; -- same
-- SELECT NAME, CLASSIC FROM (INNER JOIN TABLE1 ON ... , INNER JOIN TABLE2 ON ...) -- three table

SELECT STUDENTS.GENDER, STUDENTS.NAME FROM SCORES LEFT JOIN STUDENTS ON NOT STUDENTS.ID = SCORES.ID;
SELECT STUDENTS.GENDER, STUDENTS.NAME FROM SCORES RIGHT JOIN STUDENTS ON NOT STUDENTS.ID = SCORES.ID;
SELECT STUDENTS.NAME FROM SCORES FULL OUTER JOIN STUDENTS;

--* UNION: used to combine the result-set of two or more SELECT statements.
SELECT ID FROM STUDENTS UNION SELECT ID FROM SCORES;
-- UNION ALL: to allow duplicate values.
--SELECT ID FROM STUDENTS UNION ALL SELECT ID FROM SCORES;

--* GROUP BY:  groups rows that have the same values into summary rows.
SELECT * FROM STUDENTS GROUP BY GENDER; -- return: 2 row cuz 2 gender exist.
SELECT * FROM STUDENTS WHERE SCORE > 79 GROUP BY SCORE ORDER BY ID ASC;

--* EXIST: used to test for the existence of any record in a subquery.
SELECT GENDER, NAME FROM STUDENTS WHERE EXISTS (SELECT ID FROM SCORES WHERE CLASSIC > 1600 AND SCORES.ID = STUDENTS.ID);

--* ANY:
SELECT NAME FROM STUDENTS WHERE ID = ANY (SELECT ID FROM SCORES WHERE CLASSIC = 2720);

--* missing topics

--* SELECT TOP
--* SELECT INTO:
--* INSERT INTO SELECT:
--* CASE:
--* NULL FUNCTIONS:
--* STORED PROCEDURE:
