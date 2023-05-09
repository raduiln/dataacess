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