 mysql -u lrngsql -p;
  -- logs into mysql as user 'lrngsql'

 use bank;
  -- selects bank db for access

SELECT now();
  -- shows current date and time

quit;
  -- exits

SHOW CHARACTER SET;
  -- view supported character sets for my DB


CREATE TABLE person
  (person_id SMALLINT UNSIGNED,
   fname VARCHAR(20),
   lname VARCHAR(20),
   gender ENUM('M','F'),
   birth_date DATE,
   street VARCHAR(30),
   city VARCHAR(20),
   state VARCHAR(20),
   country VARCHAR(20),
   postal_code VARCHAR(20),
   CONSTRAINT pk_person PRIMARY KEY (person_id)
  );


DESC person;
  -- shows table and all information about it


CREATE TABLE favorite_food
  (person_id SMALLINT UNSIGNED,
   food VARCHAR(20),
   CONSTRAINT pk_favorite_food PRIMARY KEY (person_id, food),
   CONSTRAINT fk_fav_food_person_id FOREIGN KEY (person_id)
     REFERENCES person (person_id)
  );


ALTER TABLE person MODIFY person_id SMALLINT UNSIGNED AUTO_INCREMENT;
  -- alters the column person_id in the table person to automatically increment the primary key


INSERT INTO person
  (person_id, fname, lname, gender, birth_date)
  VALUES (null, 'William', 'Turner', 'M', '1972-05-27');
    -- creates a person in the DB with values entered into the columns selected

SELECT person_id, fname, lname, birth_date
  FROM person;
    -- prints values for selected columns for entire table

SELECT person_id, fname, lname, birth_date
  FROM person
  WHERE person_id = 1;
    -- prints values for selected columns for entries in the table where person_id = 1

SELECT person_id, fname, lname, birth_date
  FROM person
  WHERE lname = 'Turner';
    -- prints values for selected columns for entries in the table where lname = 'Turner'

INSERT INTO favorite_food (person_id, food)
  VALUES (1, 'pizza');
    -- inserts a row into the favorite_food table with a reference to the row in the 'person' table with the id of 1

INSERT INTO favorite_food (person_id, food)
  VALUES (1, 'cookies');
    -- inserts a row into the favorite_food table with a reference to the row in the 'person' table with the id of 1

INSERT INTO favorite_food (person_id, food)
  VALUES (1, 'nachos');
    -- inserts a row into the favorite_food table with a reference to the row in the 'person' table with the id of 1

SELECT food
  FROM favorite_food
  WHERE person_id = 1
  ORDER BY food;
    -- retrieves entries in the "food" column of the "fav_food" table related to the "person" with the id of 1, then ordered alphabetically by "food"

INSERT INTO person
    (person_id, fname, lname, gender, birth_date,
     street, city, state, country, postal_code)
  VALUES (null, 'Susan', 'Smith', 'F', '1975-11-02',
          '23 Maple St.', 'Arlington', 'VA', 'USA', '20220');
    -- adds another entry to person table with values into associated columns. null ensures person ID will be auto-generated

SELECT person_id, fname, lname, birth_date, street
  FROM person;
  -- retrieves the 4 columns from all entries of 'person' table

UPDATE person
  SET street = '1225 Tremont St.',
      city = 'Boston',
      state = 'MA',
      country = 'USA',
      postal_code = '02138'
  WHERE person_id = 1;
  -- updates the columns of the  'person' with id of 1 with values entered

DELETE FROM person
  WHERE person_id = 2;
  -- deletes the entry from the person table where the person_id is 2

INSERT INTO person
  (person_id, fname, lname, gender, birth_date)
  VALUES (1, 'Charles', 'Fulton', 'M', '1968-01-15');
  -- fails due to duplicate entry error, a row with an ID of 1 already exists

INSERT INTO favorite_food (person_id, food)
  VALUES (999, 'lasagna');
  -- fails due to nonexistent entry in 'person' table with a primary key of 999

UPDATE person
  SET gender = 'Z'
  WHERE person_id = 1;
  -- fails due to allowable values for 'gender' being only 'M' or 'F'

UPDATE person
  SET birth_date = 'DEC-21-1980'
  WHERE person_id = 1;
  -- fails due to invalid date format

UPDATE person
  SET birth_date = str_to_date('DEC-21-1980' , '%b-%d-%Y')
  WHERE person_id = 1;
  -- now succeeds because of a str_to_date function with 2 arguments

DROP TABLE person;
DROP TABLE favorite_food;
  -- drops the tables used in prior examples, since we will be using bank DB going forward

DESC customer;
  -- simply shows info for the customer table
