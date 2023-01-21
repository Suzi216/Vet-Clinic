/* Database schema to keep the structure of entire database. */


create table animals(
  id integer generated always as identity primary key,
  name varchar(100),
  date_of_birth date,
  escape_attempts integer,
  neutered boolean,
  weight_kg decimal
);

ALTER TABLE animals ADD species varchar(150);
