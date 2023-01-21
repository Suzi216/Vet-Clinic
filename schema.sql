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

CREATE TABLE owners (id BIGSERIAL PRIMARY KEY, full_name VARCHAR(150), age INT);
CREATE TABLE species (id BIGSERIAL PRIMARY KEY, name VARCHAR);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id  INT references species(id);
ALTER TABLE animals ADD COLUMN owner_id INT references owners(id);
