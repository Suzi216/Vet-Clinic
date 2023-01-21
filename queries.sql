/*Queries that provide answers to the questions from all projects.*/

 SELECT * FROM animals WHERE name LIKE '%mon';
 SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
 SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
 SELECT date_of_birth FROM animals WHERE name='Agumon' or name='Pikachu';
 SELECT name, escape_attempts FROM animals WHERE weight_kg> 10.5;
 SELECT * FROM animals WHERE neutered = true;
 SELECT * FROM animals WHERE name!='Gabumon';
 SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
 
BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species is NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete_date;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO delete_date;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT *FROM animals;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered,MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-12-31' AND '2000-12-31' GROUP BY species;

SELECT animals.name FROM animals JOIN owners ON owners.id =animals.owner_id WHERE owners.full_name = 'Melody Pond';
SELECT animals.name, species.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT full_name, name FROM owners left JOIN animals ON animals.owner_id =owners.id;
SELECT species.name AS species, COUNT(animals.name) AS nb_of_animals from animals JOIN species ON animals.species_id = species.id GROUP BY species;
SELECT animals.name AS animal, species.name AS species, owners.full_name AS owner FROM animals JOIN species ON animals.species_id = species.id JOIN owners ON animals.owner_id = owners.id WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';
SELECT animals.name AS animal, animals.escape_attempts, owners.full_name AS owner  FROM animals JOIN owners ON owners.id = animals.owner_id WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';
SELECT owners.full_name, COUNT(animals.name) FROM owners JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY count(animals.name) DESC LIMIT 1;


SELECT vets.name AS vet , visits.date_of_visit AS visit_date, animals.name AS animal FROM visits JOIN vets ON vets_id = vets.id JOIN animals ON animals_id = animals.id WHERE vets_id = (SELECT id FROM vets WHERE name = 'William Tatcher') ORDER BY date_of_visit DESC LIMIT 1;
SELECT name, count(*) as different_animals FROM visits JOIN vets ON visits.vets_id = vets.id WHERE visits.vets_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez') GROUP BY vets.name;
SELECT species.name,vets.name FROM vets LEFT JOIN specializations ON vets.id = specializations.vets_id LEFT JOIN species ON species.id = specializations.species_id;
SELECT animals.name as animals from visits join vets on visits.vets_id = vets.id join animals on visits.animals_id = animals.id where visits.vets_id = (select id from vets where name = 'Stephanie Mendez') and visits.date_of_visit between '2020-04-01' and '2020-08-30';
SELECT animals.name, COUNT(*) AS num_visits FROM visits JOIN animals ON visits.animals_id = animals.id group by animals.name order by num_visits desc limit 1;
SELECT animals.name,vets.name,visits.date_of_visit FROM visits JOIN vets ON vets.id = visits.vets_id JOIN animals ON animals.id = visits.animals_id WHERE vets.name = 'Maisy Smith'ORDER BY date_of_visit limit 1;
SELECT animals.name AS animal, animals.date_of_birth AS animal_birthday, animals.escape_attempts, animals.neutered, animals.weight_kg, owners.full_name AS owner, species.name AS species, vets.name AS vet, vets.age, vets.date_of_graduation, visits.date_of_visit FROM visits JOIN animals ON visits.animals_id = animals.id JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id JOIN vets ON visits.vets_id = vets.id order by date_of_visit desc limit 1;
SELECT COUNT(vets.name) FROM visits INNER JOIN vets ON visits.vets_id = vets.id WHERE vets.name = (SELECT vets.name FROM specializations RIGHT JOIN vets ON specializations.vets_id =vets.id WHERE specializations.species_id is NULL);
SELECT species.name FROM species JOIN animals ON animals.species_id = species.id JOIN visits ON visits.animals_id = animals.id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Maisy Smith' GROUP BY vets.name, species.name ORDER BY count(species.name) DESC LIMIT 1;

                                                                                                   
                                                                                                   
