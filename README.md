# REST_CRUD
JAVA+SPRINGS+REST+MYSQL+CRUD+MAVEN+JSON+ANGULARJS+BOOTSTRAP

A simple Java web application to perform basic CRUD (CREATE, READ, UPDATE and DELETE) operations with MySql DB.
This application produces and consumes JSON data.

There are 4 REST API's:
/REST_CRUD/crud/getAllPokemons,
/REST_CRUD/crud/addNewPokemon,
/REST_CRUD/crud/updatePokemon,
/REST_CRUD/crud/deletePokemon

User interface built using Bootstrap and AngularJS. 
Angular-ui-bootstrap used to create autocomplete search component.

Build and Run using Maven embedded tomcat plugin:
1. build: mvn clean package 
2. run: mvn tomcat7:run

