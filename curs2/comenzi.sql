CREATE SCHEMA `universitate2023` DEFAULT CHARACTER SET utf8 ;

REATE TABLE `universitate2023`.`utilizatorii` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(45) NOT NULL,
  `prenume` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `telefon` CHAR(10) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `universitate2023`.`utilizatorii` (`id`, `nume`, `prenume`, `email`) VALUES ('1', 'Popescu', 'Dan', 'dan@mail.com');


-- magazin
CREATE TABLE `magazin2023`.`produse` (
  `idproduse` INT NOT NULL AUTO_INCREMENT,
  `numeprodus` VARCHAR(300) NOT NULL,
  `cantitate` VARCHAR(45) NOT NULL,
  `pret` DECIMAL(7) NOT NULL,
  `stoc` VARCHAR(45) NOT NULL,
  `id_firma` VARCHAR(100) NOT NULL,
  `adresa_firma` VARCHAR(200) NOT NULL,
  `descriere_produs` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`idproduse`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- facultate
CREATE SCHEMA `facultate` DEFAULT CHARACTER SET utf8 ;
CREATE TABLE `facultate`.`new_table` (
  `idstudent` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(45) NOT NULL,
  `prenume` VARCHAR(45) NOT NULL,
  `grupa` SET("1", "2", "3", "4") NULL,
  `email` VARCHAR(145) NULL,
  `data_adaugare` VARCHAR(45) NULL,
  `status` ENUM("admis", "respins", "neevaluat") NULL DEFAULT "neevaluat",
  PRIMARY KEY (`idstudent`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `nume_unic` (`nume` ASC, `prenume` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `facultate`.`new_table` (`idstudent`, `nume`, `prenume`, `grupa`, `email`, `data_adaugare`, `status`) VALUES ('1', 'popescu', 'dan', '1,2,3', 'dan@mail.ro', '2023-09-01', 'respins');
INSERT INTO `facultate`.`new_table` (`idstudent`, `nume`, `prenume`, `grupa`, `email`, `data_adaugare`) VALUES ('2', 'ionescu', 'mihai', '1', 'ionescu@mail.ro', '2023-09-02');


-- UNIVERSITATE
SELECT COUNT(id_curs) AS nr_cursuri, an FROM cursuri  GROUP BY an HAVING nr_cursuri<=5;

SELECT VERSION(),NOW();

SELECT nume,prenume FROM student;

SELECT titlu_curs FROM cursuri;

SELECT COUNT(id) AS nr,an FROM student GROUP BY an;

SELECT SUM(bursa) AS total,an FROM student WHERE bursa IS NOT NULL GROUP BY an;

UPDATE student SET status='bursier' WHERE bursa IS NOT NULL;

SELECT CONCAT(nume,' ',prenume) FULL_NAME, AN FROM universitate.student;

-- SELECT * FROM `student`WHERE data_nastere >='1991-01-01';
SELECT * FROM `student`WHERE year(data_nastere) >=1996;
-- SELECT * FROM `profesor` WHERE grad_didactic !='III';
SELECT * FROM `profesor` WHERE grad_didactic IN ('I', 'II');
SELECT * FROM `cursuri` WHERE an =2 AND semestru=2;
SELECT * FROM `student` WHERE prenume LIKE 'ion%';
SELECT * FROM `student` WHERE DATE_FORMAT(data_nastere,'%m-%d') ='09-21';
-- SELECT * FROM `student` WHERE bursa*12 >= 4000;
SELECT *,bursa*12 AS 'bursa anuala' FROM `student` WHERE bursa*12 >= 4000;
SELECT * FROM `student` ORDER BY nume DESC;
SELECT * FROM `student` ORDER BY nume ASC, prenume DESC;
SELECT * FROM `student` ORDER BY rand();
SELECT * FROM `student` ORDER BY rand() LIMIT 1;
SELECT * FROM `student` ORDER BY data_nastere DESC LIMIT 5; --PRIMI 5 CEI MAI TINERI
SELECT * FROM `student` ORDER BY data_nastere DESC LIMIT 5, 5; --URMATORII 5
SELECT * FROM `student` ORDER BY data_nastere DESC LIMIT 10, 5 --URMATORII 5 DE LA 10 LA 15

SELECT profesor.nume, profesor.prenume, cursuri.titlu_curs, note.valoare, note.id_curs FROM `profesor`
LEFT JOIN didactic ON profesor.id=didactic.id_prof 
INNER JOIN cursuri ON cursuri.id_curs=didactic.id_curs
LEFT JOIN note ON cursuri.id_curs=note.id_nota
WHERE profesor.id=6 AND note.valoare IS NOT NULL;

SELECT * FROM `profesor` AS p LEFT JOIN didactic AS d on p.id=d.id_prof WHERE d.id_prof IS NULL;

SELECT s.nume, s.prenume FROM `note` AS n INNER JOIN student AS s ON n.id_student= s.id GROUP BY n.id_student;

SELECT s.nume, s.prenume FROM `note` AS n INNER JOIN student AS s ON n.id_student= s.id WHERE s.id=111;

SELECT s.nume, s.prenume, n.valoare AVG(n.valoare) FROM `student` AS s LEFT JOIN note AS n ON s.id=n.id_student WHERE s.id=111 GROUP BY s.id;