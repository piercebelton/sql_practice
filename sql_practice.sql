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













   buffer
