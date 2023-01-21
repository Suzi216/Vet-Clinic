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


CREATE table vets(id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, name VARCHAR(150), age integer, date_of_graduation DATE);
CREATE TABLE specializations(species_id INT, vets_id INT, PRIMARY KEY(species_id), CONSTRAINT species_id  FOREIGN KEY(species_id) references species(id), CONSTRAINT vets_id FOREIGN KEY(species_id) REFERENCES vets(id));
CREATE TABLE visits(animals_id INTEGER NOT NULL, vets_id INTEGER NOT NULL, date_of_visit DATE, primary key(animals_id, vets_id, date_of_visit), CONSTRAINT animals_id FOREIGN KEY(animals_id) REFERENCES animals(id), CONSTRAINT vets_id FOREIGN KEY(vets_id) REFERENCES vets(id));
