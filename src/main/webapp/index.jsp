<html ng-app="rest_crud">
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
                
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
			integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
			crossorigin="anonymous">
		
		<!-- Latest compiled and minified JavaScript -->
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
			integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
			crossorigin="anonymous">
		</script>
        <script src="http://angular-ui.github.com/bootstrap/ui-bootstrap-tpls-0.12.0.js"></script>
        
        <style>
            .result_div{
                background-color: rgb(230, 255, 204);
                overflow:scroll;
            }
            
        </style>
        
	</head>
	<body>
		<div class="container-fluid">
			<h1 class=>CRUD operations using REST services and MySQL</h1>
		</div>
		
		<div class="container" ng-controller="create_controller"> 
			<fieldset>
                <legend style="padding-top:20">CREATE</legend>
				<div class="row"><div class="form-group">
					<div class="col-md-3"><label>Pokemon Name:</label><input class="form-control" required type="text" ng-model="name" placeholder="PIKACHU" id="name"></div>
                    <div class="col-md-3"><label>Pokemon CP:</label><input class="form-control" type="text" ng-model="cp" placeholder="500" id="combatPower"></div>
                    <div class="col-md-3"><label>Pokemon Type:</label><input class="form-control" type="text" ng-model="type" placeholder="ELECTRIC" id="type"></div>
                    <div class="col-md-3"><label>Pokemon Evolution:</label><input class="form-control" type="text" ng-model="evol" placeholder="RAICHU" id="evolution"></div>
				</div></div>
                <br/>
                <div class="row" style="padding-left:15;">
                    <button ng-click="createPokemon()" class="btn btn-primary" id="create">Create Pokemon</button>
                </div>
                <br/>
                <div class="result_div" ng-show="result != null"><p>{{result | json}}</p><button class="btn pull-right" ng-click="clear()"><span class="glyphicon glyphicon-remove"></span></button></div>
            </fieldset>
		</div>
        
        <div class="container" ng-controller="read_controller">
			<fieldset>
                <legend style="padding-top:20">READ</legend>
				<div class="row" style="padding-left:15">
					<button ng-click="getPokemons()" class="btn btn-primary" id="get">Get All Pokemons</button>
				</div>
			</fieldset>
            <br/>
            <div class="result_div" ng-show="result != null">
                <table class="table table-striped">
                    <tr><th>Name</th><th>CP</th><th>Type</th><th>Evolution</th></tr>
                    <tr ng-repeat="pokemon in result"><td>{{pokemon.name}}</td><td>{{pokemon.combatPower}}</td><td>{{pokemon.type}}</td><td>{{pokemon.evolution}}</td></tr> 
                </table>
                
                <button class="btn pull-right" ng-click="clear()"><span class="glyphicon glyphicon-remove"></span></button></div>
		</div>
        
        <div class="container" ng-controller="update_controller">
			<fieldset>
                <legend style="padding-top:20">UPDATE/DELETE</legend>
				<div class="row"><div class="form-group">
                    <div class="col-md-12"><input class="form-control" type="search" ng-model="search" typeahead="suggestion.name for suggestion in pokemons($viewValue)" typeahead-editable="false" typeahead-on-select="onSelect($item, $model, $label)" placeholder="PIKACHU" id="search" width="80"></div>	
				</div></div>
                <br/>
                <div ng-show="pokemon !=null" class="row"><div class="form-group">
					<div class="col-md-3"><label>Pokemon Name:</label><input class="form-control" $scope.pokemon = null;type="text" ng-model="name" id="name"></div>
                    <div class="col-md-3"><label>Pokemon CP:</label><input class="form-control" type="text" ng-model="cp"  id="combatPower"></div>
                    <div class="col-md-3"><label>Pokemon Type:</label><input class="form-control" type="text" ng-model="type"  id="type"></div>
                    <div class="col-md-3"><label>Pokemon Evolution:</label><input class="form-control" type="text" ng-model="evol"  id="evolution"></div>
				</div><div class="row"></div><br/></div>
                <div class="row" style="padding-left:15">
                    <button class="btn btn-primary" id="update" ng-click="updatePokemon()">Update Pokemon</button>
                    <button class="btn btn-primary" id="delete" ng-click="deletePokemon()">Delete Pokemon</button>
                </div>
                <br/>
                <div class="result_div" ng-show="result != null"><p>{{result | json}}</p><button class="btn pull-right" ng-click="clear()"><span class="glyphicon glyphicon-remove"></span></button></div>
			</fieldset>
		</div>
                
        <script>
                       
            var app = angular.module("rest_crud",['ui.bootstrap']);
            
            app.controller("create_controller", function($scope, $http){
                $scope.result = null;
                
                $scope.createPokemon = function(){
                    formData = {"name":$scope.name,"combatPower":$scope.cp,"type":$scope.type,"evolution":$scope.evol};
                    $http.post("/REST_CRUD/crud/addNewPokemon",formData).then(function(response) {
                            $scope.result = response.data;
                        }, function(response) {
                            $scope.result = "Something went wrong";
                        });
                }
                
                $scope.clear = function(){
                    $scope.result = null;
                }
                        
            });
            
            app.controller("read_controller", function($scope, $http){
                $scope.result = null;    
                $scope.getPokemons = function(){
                     $http.get("/REST_CRUD/crud/getAllPokemons").then(function(response) {
                            $scope.result = response.data;
                        }, function(response) {
                            $scope.result = "Something went wrong";
                        });
                }
                
                $scope.clear = function(){
                    $scope.result = null;
                }
                        
            });
            
            app.controller("update_controller", function($scope, $http){
                $scope.data = null;
                $scope.pokemon = null;
                
                $scope.onSelect = function ($item, $model, $label) {
                    //$scope.$item = $item;
                    $scope.pokemon = $item;
                    $scope.name = $scope.pokemon.name;
                    $scope.cp = $scope.pokemon.combatPower;
                    $scope.type = $scope.pokemon.type;
                    $scope.evol = $scope.pokemon.evolution;
                    //$scope.$model = $model;
                    //$scope.$label = $label;
                };
                
                $scope.pokemons = function(pokemon) {
                    return $http.get("/REST_CRUD/crud/getAllPokemons").then(function(response) {
                        return response.data;
                    });
                };
                
                $scope.updatePokemon = function(){
                    formData = {"name":$scope.name,"combatPower":$scope.cp,"type":$scope.type,"evolution":$scope.evol};
                    $http.post("/REST_CRUD/crud/updatePokemon",formData).then(function(response) {
                            $scope.result = response.data;
                            $scope.pokemon = null;
                        }, function(response) {
                            $scope.result = "Something went wrong";
                        });
                }
                
                $scope.deletePokemon = function(){
                    formData = {"name":$scope.name,"combatPower":$scope.cp,"type":$scope.type,"evolution":$scope.evol};
                    $http.post("/REST_CRUD/crud/deletePokemon",formData).then(function(response) {
                            $scope.result = response.data;
                            $scope.pokemon = null;
                        }, function(response) {
                            $scope.result = "Something went wrong";
                        });
                }
                
                $scope.clear = function(){
                    $scope.result = null;
                }
            });
            
            
        </script>
		
	</body>
</html>
