-- bkezxsrzqafno9klh8nq

-- CREATE TABLE books (
-- 	book_id INT UNIQUE AUTO_INCREMENT,
--     title VARCHAR(55) NOT NULL UNIQUE,
--     author VARCHAR(55) DEFAULT "no author",
--     rating INT
-- );

-- INSERT INTO books (book_id, title, author)
-- VALUES (2, 'withering heights', 'emily bronte');

-- SELECT * FROM books;

-- DROP TABLE books;

-- SELECT * FROM books;

-- CREATE TABLE `bkezxsrzqafno9klh8nq`.`books` (
--   `idbooks` INT NOT NULL AUTO_INCREMENT,
--   `title` VARCHAR(55) NOT NULL,
--   `author` VARCHAR(55) NULL DEFAULT 'no author',
--   `rating` INT NOT NULL,
--   PRIMARY KEY (`idbooks`),
--   UNIQUE INDEX `title_UNIQUE` (`title` ASC) VISIBLE);
--   
--   INSERT INTO books (title, author, rating)
--   VALUES ('mathilda', 'roald dahl', 10), ('bleak house', 'cd', 9), ('react and react native', 'some white dude', 1)
--   
--   SELECT title, rating 
--   FROM books
--   WHERE rating<10 AND author LIKE '%t';
  
-- DROP TABLE books;

-- CREATE TABLE authorz (
-- 	authorid INT AUTO_INCREMENT,
--     name VARCHAR(55) NOT NULL UNIQUE,
--     PRIMARY KEY (authorid)
-- );


--  CREATE TABLE bookz (
--  	book_id INT AUTO_INCREMENT,
-- 	title VARCHAR(55) NOT NULL UNIQUE,
-- 	rating INT,
--     authorid INT,
--     PRIMARY KEY (book_id),
--     CONSTRAINT FK_author FOREIGN KEY (authorid)
--     REFERENCES authorz(authorid)
--  );
--   
--   INSERT INTO authorz (name) VALUES ('roald dahl');
--   INSERT INTO bookz (title, rating, authorid) VALUES ('mathilda', 10, 1);
--   
--   SELECT * FROM bookz;
--   SELECT * FROM authorz

-- DROP TABLE bookz, authorz

-- day2 excercise

-- CREATE TABLE actors (
-- 	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- 	actor_name VARCHAR(255) NOT NULL
-- );
--   
-- CREATE TABLE movies (
-- 	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     title VARCHAR(255) NOT NULL UNIQUE,
--     actor_id INT,
--     FOREIGN KEY (actor_id) REFERENCES actors(id)
-- );

-- INSERT INTO actors (actor_name) VALUES ('Andrew Garfield');  
-- SELECT * FROM actors;
  
-- INSERT INTO actors (actor_name) VALUES ('Tom Holland');

-- INSERT INTO movies (title, actor_id)
-- VALUES ('Spiderman',
-- (SELECT id FROM actors WHERE actor_name='Andrew Garfield')  
-- );

-- SELECT * FROM movies;

-- INSERT INTO movies (title, actor_id)
-- VALUES ('Hackshaw Ridge',
-- (SELECT id FROM actors WHERE actor_name='Andrew Garfield')  
-- );

-- SELECT count(*) AS all_movies FROM movies;

-- SELECT title FROM movies ORDER BY title ASC LIMIT 2;

-- DROP TABLE movies, actors;


-- day2 activity2 


CREATE TABLE employee_detail (employee_id INT, name VARCHAR(255), date_of_birth INT, gender VARCHAR(1)); INSERT INTO employee_detail VALUES (1000,"Bob",20000304,"M"), (1001,"Joe",19740310,"M"), (1002,"Adam",19640312,"M"), (1003,"Debra",19910306,"F"), (1004,"Charlotte",19870307,"F"), (1005,"Katie",19960304,"F"), (1006,"Sam",19620313,"F"), (1007,"Ashley",19810308,"U"), (1008,"Robert",19680311,"M"), (1009,"Usman",19850307,"M"), (1010,"Andrea",19980304,"F"), (1011,"Vaskor",19680311,"M"), (1012,"Catherine",19890306,"F"), (1013,"Graham",19660312,"F"), (1014,"Christopher",19840307,"M"), (1015,"Laura",19780309,"F"), (1016,"Tanya",19940305,"U"), (1017,"Rachael",19910306,"F");

CREATE TABLE laptop_detail (laptop_id INT, os VARCHAR(255), date_of_manufacture INT); INSERT INTO laptop_detail VALUES (9000,"Mac",20171024), (9001,"Ubuntu",20161125), (9002,"Windows",20180511), (9003,"Mac",20160618), (9004,"Mac",20170812), (9005,"Windows",20180401);

CREATE TABLE jobs_history (employee_id INT, job_title VARCHAR(255), date_start INT, date_end INT); INSERT INTO jobs_history VALUES (1000,"Payroll",20190103,20991231), (1001,"Tech Lead",20151212,20991231), (1002,"Developer",20120503,20991231), (1003,"Developer",20180716,20991231), (1004,"Payroll",20171025,20991231), (1005,"Product Lead",20161003,20991231), (1006,"Lead Developer",20110223,20991231), (1007,"Developer",20180507,20991231), (1008,"Marketing Lead",20180816,20991231), (1009,"Developer",20150725,20991231), (1010,"Developer",20111215,20991231), (1011,"Tech Lead",20180226,20991231), (1012,"Product Lead",20180607,20991231), (1013,"Lead Developer",20150516,20991231), (1014,"Marketing Lead",20111006,20991231), (1015,"Developer",20171218,20991231), (1016,"Developer",20180329,20991231), (1017,"Developer",20150307,20991231), (1001,"Developer",20051128,20151211), (1002,"Payroll",20100831,20120502), (1001,"Payroll",20050828,20051127), (1004,"Product Lead",20151228,20171024), (1009,"Payroll",20140310,20150724), (1010,"Payroll",20110330,20111214), (1011,"Payroll",20170405,20180225), (1016,"Payroll",20161207,20180328);

CREATE TABLE current_job_detail (employee_id INT, job_title VARCHAR(255), salary INT, laptop_id INT); INSERT INTO current_job_detail VALUES (1000,"Payroll",16000,9000), (1001,"Tech Lead",61000,9001), (1002,"Developer",35000,9003), (1003,"Developer",37000,9001), (1004,"Payroll",16500,9000), (1005,"Product Lead",53000,9001), (1006,"Lead Developer",52000,9000), (1007,"Developer",48000,9000), (1008,"Marketing Lead",75000,9003), (1009,"Developer",38500,9001), (1010,"Developer",39500,9004), (1011,"Tech Lead",61000,9000), (1012,"Product Lead",49500,9004), (1013,"Lead Developer",46500,9005), (1014,"Marketing Lead",61000,9000), (1015,"Developer",41000,9000), (1016,"Developer",42500,9005), (1017,"Developer",45500,9000);

SELECT * FROM employee_detail, laptop_detail, jobs_history, current_job_detail

SELECT name, gender,
CASE
	WHEN gender = "M" THEN "Is male"
    WHEN gender = "F" THEN "Is female"
    ELSE "Unspecified" 
END AS employee_gender
FROM employee_detail;

SELECT employee_detail.name, current_job_detail.job_title
FROM employee_detail 
JOIN current_job_detail ON employee_detail.employee_id = current_job_detail.employee_id

-- independent tasks

-- total no of employees
SELECT count(*) AS all_employees FROM employee_detail;

-- highest earner and their job title
SELECT employee_detail.name, current_job_detail.job_title
FROM employee_detail
JOIN current_job_detail ON employee_detail.employee_id = current_job_detail.employee_id 
ORDER BY current_job_detail.salary DESC LIMIT 1;

-- no of devs
SELECT count(employee_id) AS senior_devs FROM current_job_detail WHERE job_title="Lead Developer";

-- no of employees in roles
SELECT job_title, count(job_title) AS no_of_employees FROM current_job_detail GROUP BY job_title;

SELECT * FROM employee_detail



