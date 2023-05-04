CREATE TABLE `mydb2023`.`produse` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT , 
    `nume_produs` VARCHAR(100) NOT NULL ,
     `descriere` TEXT NULL ,
      `pret` DECIMAL(7,2) NOT NULL , 
      `stoc` INT NOT NULL DEFAULT '0' , 
      `producator` VARCHAR(250) NOT NULL ,
       `user_at` INT NOT NULL ,
        `data_adaugare` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , 
        PRIMARY KEY (`id`)) ENGINE = InnoDB;

        CREATE USER 'mydb2023'@'localhost'IDENTIFIED VIA mysql_native_password USING '***';
         GRANT SELECT, INSERT, UPDATE, DELETE, FILE ON *.* TO 'mydb2023'@'localhost' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;


-- mydb2022

CREATE TABLE `mydb2022`.`jsuser` (
    `id` INT NOT NULL ,
     `nume` VARCHAR(20) NOT NULL ,
      `prenume` VARCHAR(30) NOT NULL ,
       `email` VARCHAR(50) NOT NULL ,
        `telefon` VARCHAR(15) NOT NULL ,
         `datanstere` DATE NOT NULL ,
          `dataadaugare` TIMESTAMP NOT NULL ,
           PRIMARY KEY (`id`)) ENGINE = InnoDB;

           ALTER TABLE `jsuser` ADD `cnp` CHAR(13) NOT NULL AFTER `dataadaugare`, ADD UNIQUE (`cnp`);
           INSERT INTO `jsuser` (`id`, `nume`, `prenume`, `email`, `telefon`, `datanstere`, `dataadaugare`, `cnp`) VALUES ('1', 'George', 'Mihai', 'george@mail.com', '0040751756234', '2000-05-05', current_timestamp(), '1200505536325');
           INSERT INTO `jsuser` (`id`, `nume`, `prenume`, `email`, `telefon`, `datanstere`, `dataadaugare`, `cnp`) VALUES ('2', 'vasile', 'popescu', 'popescu@mail.ro', '0735686239', '2003-05-07', current_timestamp(), '2200507252627');
           INSERT INTO `jsuser` (`id`, `nume`, `prenume`, `email`, `telefon`, `datanstere`, `dataadaugare`, `cnp`) VALUES ('3', 'sorin', 'mihaescu', 'sorin@mail.com', '0756348256', '1994-06-15', current_timestamp(), '1940505764738');
           INSERT INTO `jsuser` (`id`, `nume`, `prenume`, `email`, `telefon`, `datanstere`, `dataadaugare`, `cnp`) VALUES ('4', 'marian', 'ionescu', 'marian@ionescu.com', '073568625643', '2000-10-18', current_timestamp(), '1201018462857');