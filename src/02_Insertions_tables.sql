DELETE FROM Pokedex;
DELETE FROM Dresseur;
DELETE FROM FacteursEspece;
DELETE FROM Specimen;
DELETE FROM Pokemon;

DROP TRIGGER specimen_values ;
DROP SEQUENCE seq_pokemon_id ;
DROP SEQUENCE seq_pokedex_id ;
DROP SEQUENCE seq_dresseur_id;


CREATE SEQUENCE seq_pokemon_id START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 30 CYCLE CACHE 20;
CREATE SEQUENCE seq_pokedex_id START WITH 1 INCREMENT BY 1 MINVALUE 1;


-- Trigger

CREATE OR REPLACE TRIGGER specimen_values
BEFORE INSERT OR UPDATE ON Specimen
FOR EACH ROW
DECLARE 
    fT FLOAT;
    fV FLOAT;
    fP FLOAT;
BEGIN
    SELECT facteurTaille INTO fT 
    FROM Pokemon JOIN FacteursEspece ON FacteursEspece.espece = Pokemon.nomEspece 
    WHERE Pokemon.idPokemon = :NEW.idPokemon;
    :NEW.taille := ROUND(:NEW.niveau * (fT));
    
    SELECT facteurVie INTO fV  
    FROM Pokemon JOIN FacteursEspece ON FacteursEspece.espece = Pokemon.nomEspece 
    WHERE Pokemon.idPokemon = :NEW.idPokemon;
    :NEW.vie := ROUND(:NEW.niveau * (fV));
    
    SELECT facteurPoids INTO fP 
    FROM Pokemon JOIN FacteursEspece ON FacteursEspece.espece = Pokemon.nomEspece 
    WHERE Pokemon.idPokemon = :NEW.idPokemon;
    :NEW.poids := ROUND(:NEW.niveau * (fP));
END specimen_values;
/


INSERT INTO Pokemon (idPokemon, Type1, Type2, nomEspece) VALUES (seq_pokemon_id.nextval, 'Plante', 'Poison', 'Graine');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval, 'Plante', 'Poison', 'Graine');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval, 'Plante', 'Poison', 'Graine');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Feu', NULL, 'Lezard');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Feu', NULL, 'Flamme');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Feu', 'Vol', 'Flamme');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Eau', NULL, 'Minitortue');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Eau', NULL, 'Tortue');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Eau', NULL, 'Carapace');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Insect', NULL, 'Ver');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Insect', NULL, 'Cocon');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Insect', 'Vol', 'Papillon');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Insect', 'Poison', 'Insectopic');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Insect', 'Poison', 'Cocon');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Insect', 'Poison', 'Guêpepoison');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Normal', 'Vol', 'Minoiseau');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Normal', 'Vol', 'Oiseau');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Normal', 'Vol', 'Oiseau');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Normal', NULL, 'Souris');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Normal', NULL, 'Souris');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Normal', 'Vol', 'Minoiseau');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Normal', 'Vol', 'Bec-Oiseau');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Poison', NULL, 'Serpent');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Poison', NULL, 'Cobra');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Electrique', NULL, 'Souris');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Electrique', NULL, 'Souris');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Sol', NULL, 'Souris');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Sol', NULL, 'Souris');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Poison', NULL, 'Vénépic');
INSERT INTO Pokemon VALUES (seq_pokemon_id.nextval,'Poison', NULL, 'Vénépic');

INSERT INTO FacteursEspece (espece, facteurVie, facteurTaille, facteurPoids) VALUES ('Graine', 1.15, ROUND(DBMS_RANDOM.value(1.05, 1.10), 2),ROUND(DBMS_RANDOM.value(1.05, 1.10)));
INSERT INTO FacteursEspece VALUES ('Lezard',    1.20, ROUND(DBMS_RANDOM.value(1.05, 1.15), 2),ROUND(DBMS_RANDOM.value(1.05, 1.15)));
INSERT INTO FacteursEspece VALUES ('Flamme',    1.25, ROUND(DBMS_RANDOM.value(1.10, 1.25), 2),ROUND(DBMS_RANDOM.value(1.10, 1.25)));
INSERT INTO FacteursEspece VALUES ('Minitortue',1.15, ROUND(DBMS_RANDOM.value(1.05, 1.10), 2),ROUND(DBMS_RANDOM.value(1.05, 1.10)));
INSERT INTO FacteursEspece VALUES ('Tortue',    1.20, ROUND(DBMS_RANDOM.value(1.10, 1.15), 2),ROUND(DBMS_RANDOM.value(1.10, 1.15)));
INSERT INTO FacteursEspece VALUES ('Carapace',  1.25, ROUND(DBMS_RANDOM.value(1.10, 1.25), 2),ROUND(DBMS_RANDOM.value(1.10, 1.25)));
INSERT INTO FacteursEspece VALUES ('Ver',       1.10, ROUND(DBMS_RANDOM.value(1.05, 1.07), 2),ROUND(DBMS_RANDOM.value(1.05, 1.07)));
INSERT INTO FacteursEspece VALUES ('Cocon',     1.15, ROUND(DBMS_RANDOM.value(1.06, 1.09), 2),ROUND(DBMS_RANDOM.value(1.06, 1.09)));
INSERT INTO FacteursEspece VALUES ('Papillon',  1.19, ROUND(DBMS_RANDOM.value(1.08, 1.09), 2),ROUND(DBMS_RANDOM.value(1.08, 1.09)));
INSERT INTO FacteursEspece VALUES ('Insectopic',1.10, ROUND(DBMS_RANDOM.value(1.10, 1.13), 2),ROUND(DBMS_RANDOM.value(1.10, 1.13)));
INSERT INTO FacteursEspece VALUES ('Guêpepoison', 1.16, ROUND(DBMS_RANDOM.value(1.12, 1.14), 2),ROUND(DBMS_RANDOM.value(1.12, 1.14)));
INSERT INTO FacteursEspece VALUES ('Minoiseau', 1.15, ROUND(DBMS_RANDOM.value(1.05, 1.10), 2),ROUND(DBMS_RANDOM.value(1.05, 1.10)));
INSERT INTO FacteursEspece VALUES ('Oiseau',    1.20, ROUND(DBMS_RANDOM.value(1.10, 1.15), 2),ROUND(DBMS_RANDOM.value(1.10, 1.15)));
INSERT INTO FacteursEspece VALUES ('Souris',    1.09, ROUND(DBMS_RANDOM.value(1.05, 1.10), 2),ROUND(DBMS_RANDOM.value(1.05, 1.10)));
INSERT INTO FacteursEspece VALUES ('Bec-Oiseau',1.21, ROUND(DBMS_RANDOM.value(1.10, 1.15), 2),ROUND(DBMS_RANDOM.value(1.10, 1.15)));
INSERT INTO FacteursEspece VALUES ('Serpent',   1.16, ROUND(DBMS_RANDOM.value(1.05, 1.10), 2),ROUND(DBMS_RANDOM.value(1.05, 1.10)));
INSERT INTO FacteursEspece VALUES ('Cobra',     1.25, ROUND(DBMS_RANDOM.value(1.08, 1.13), 2),ROUND(DBMS_RANDOM.value(1.08, 1.13)));
INSERT INTO FacteursEspece VALUES ('Vénépic',   1.30, ROUND(DBMS_RANDOM.value(1.20, 1.30), 2),ROUND(DBMS_RANDOM.value(1.20, 1.30)));

INSERT INTO Dresseur (idDresseur, nom, prenom, adresse) VALUES (25, 'KETCHUM', 'Sacha', '5 rue du Bourg Palette, Kanto');
INSERT INTO Dresseur (idDresseur, nom, prenom, adresse) VALUES  (40, 'MAY', 'Flora', '46 avenue d Oliville, Johto');
INSERT INTO Dresseur (idDresseur, nom, prenom, adresse) VALUES  (56, 'CHEN', 'Regis', '11 rue d Argenta, Johto');
INSERT INTO Dresseur (idDresseur, nom, prenom, adresse) VALUES  (108, 'MISTY', 'Ondine', '102 ArÃƒÂ¨ne Azuria, Kanto');


INSERT INTO Pokedex (idPokedex, idPokemon, idDresseur, apercu, capture, nbPokemonApercu, nbPokemonCapture) VALUES (seq_pokedex_id.nextval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 0 , 0 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 0 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 0 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 0 , 0 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 0 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 25, 1 , 1 , 27, 24);

INSERT INTO Pokedex (idPokedex, idPokemon, idDresseur, apercu, capture, nbPokemonApercu, nbPokemonCapture) VALUES (seq_pokedex_id.nextval, seq_pokemon_id.nextval, 40, 1 , 0 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 0 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 0 , 0 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 1 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 1 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 1 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 1 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 0 , 0 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 1 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 1 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 0 , 0 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 1 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 1 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 0 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 1 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 1 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 0 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 1 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 0 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 1 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 1 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 1 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 1 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 0 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 0 , 0 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 1 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 1 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 1 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 1 , 25, 19);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 40, 1 , 0 , 25, 19);



INSERT INTO Pokedex (idPokedex, idPokemon, idDresseur, apercu, capture,nbPokemonApercu, nbPokemonCapture) VALUES (seq_pokedex_id.nextval, seq_pokemon_id.nextval,56, 1, 1, 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 1 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 1 , 1 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 1 , 1 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 1 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 1 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 1 , 1 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 1 , 1 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 1 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 56, 0 , 0 , 9, 5);


INSERT INTO Pokedex (idPokedex, idPokemon, idDresseur, apercu, capture, nbPokemonApercu, nbPokemonCapture) VALUES (seq_pokedex_id.nextval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 1 , 1 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 1 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 1 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 1 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 1 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 1 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 1 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 0 , 0 , 8, 7);
INSERT INTO Pokedex VALUES (seq_pokedex_id.currval, seq_pokemon_id.nextval, 108, 1 , 1 , 8, 7);


INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (01, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 01);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (02, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 02);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (03, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 03);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (04, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 04);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (05, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 05);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (06, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 07);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (07, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 08);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (08, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 10);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (09, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 12);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (10, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 13);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (11, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 14);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (12, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 15);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (13, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 16);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (14, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 17);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (15, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 18);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (16, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 19);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (17, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 20);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (18, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 21);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (19, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 22);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (20, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 24);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (21, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 25);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (22, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 27);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (23, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 28);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (24, ROUND(DBMS_RANDOM.value(1, 100),2), 01, 29);

INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (01, ROUND(DBMS_RANDOM.value(1, 100),2), 02, 01);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (02, ROUND(DBMS_RANDOM.value(1, 100),2), 02, 04);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (03, ROUND(DBMS_RANDOM.value(1, 100),2), 02, 05);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (04, ROUND(DBMS_RANDOM.value(1, 100),2), 02, 07);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (05, ROUND(DBMS_RANDOM.value(1, 100),2), 02, 09);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (06, ROUND(DBMS_RANDOM.value(1, 100),2), 02, 10);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (07, ROUND(DBMS_RANDOM.value(1, 100),2), 02, 12);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (08, ROUND(DBMS_RANDOM.value(1, 100),2), 02, 13);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (09, ROUND(DBMS_RANDOM.value(1, 100),2), 02, 15);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (10, ROUND(DBMS_RANDOM.value(1, 100),2), 02, 16);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (11, ROUND(DBMS_RANDOM.value(1, 100),2), 02, 18);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (12, ROUND(DBMS_RANDOM.value(1, 100),2), 02, 20);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (13, ROUND(DBMS_RANDOM.value(1, 100),2), 02, 21);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (14, ROUND(DBMS_RANDOM.value(1, 100),2), 02, 22);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (15, ROUND(DBMS_RANDOM.value(1, 100),2), 02, 23);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (16, ROUND(DBMS_RANDOM.value(1, 100),2), 02, 26);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (17, ROUND(DBMS_RANDOM.value(1, 100),2), 02, 27);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (18, ROUND(DBMS_RANDOM.value(1, 100),2), 02, 28);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (19, ROUND(DBMS_RANDOM.value(1, 100),2), 02, 29);

INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (01, ROUND(DBMS_RANDOM.value(1, 100),2), 03, 01);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (02, ROUND(DBMS_RANDOM.value(1, 100),2), 03, 08);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (03, ROUND(DBMS_RANDOM.value(1, 100),2), 03, 09);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (04, ROUND(DBMS_RANDOM.value(1, 100),2), 03, 19);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (05, ROUND(DBMS_RANDOM.value(1, 100),2), 03, 21);

INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon)VALUES (01, ROUND(DBMS_RANDOM.value(1, 100),2), 04, 02);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (02, ROUND(DBMS_RANDOM.value(1, 100),2), 04, 30);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (03, ROUND(DBMS_RANDOM.value(1, 100),2), 04, 30);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (04, ROUND(DBMS_RANDOM.value(1, 100),2), 04, 30);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (05, ROUND(DBMS_RANDOM.value(1, 100),2), 04, 30);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (06, ROUND(DBMS_RANDOM.value(1, 100),2), 04, 30);
INSERT INTO Specimen (numSpecimen, niveau, idPokedex, idPokemon) VALUES (07, ROUND(DBMS_RANDOM.value(1, 100),2), 04, 30);


