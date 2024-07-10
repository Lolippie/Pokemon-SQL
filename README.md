# Pokemon en SQL

## L'origine
Ce code est le résultat d'un projet fait en 3ème année de Licence informatique.
Il avait pour but de mettre en execution nos connaisances autant pour la creation de tables, 
que pour l'utilisation des triggers, fonctions ou procédures, ainsi que les droits. 

## Le projet

Pour répondre à cette demande, j'ai choisi comme sujet les pokemons.
Pour plus de precisions voici les tables :
- Pokemon : banque de pokemons
    - Leur id
    - Leurs types
    - Le nom de leur espèce 

- Dresseur : 
    - Leur id
    - Leur nom
    - Leur prénom
    - Leur adresse
    - L'id de leur Pokedex

- Pokedex : la banque de données des pokémons pour un dresseur
    - Leur id
    - L'id du Pokemon correspondant
    - L'id du Dresseur propriétaire
    - S'il est aperçu
    - S'il est capturé
    - Leur nombre de pokémons aperçu 
    - Leur nombre de pokémons capturé

- FacteursEspece : Les caractéristiques multiplicateurs d'une espece sur leur statistiques
    - Leur espece
    - Leur facteur vie
    - Leur facteur tille
    - Leur facteur Poids

- Specimen : Les statistiques d'un Pokémon capturé par un dresseur
    - Leur numero 
    - Leur niveau
    - Leur Vie
    - Leur taille
    - Leur poids 
    - L'id du pokémon correspondant
    - L'id du Dresseur qui les a capturés