package com.heramb.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.heramb.models.Pokemon;
import com.heramb.models.Result;
import com.heramb.services.PokemonService;

@RestController
@RequestMapping("/crud")
public class PokemonController {

	@Autowired
	PokemonService pokemonService;
	
	@RequestMapping(value = "/getAllPokemons", method = RequestMethod.GET, produces = "application/json")
	public List<Pokemon> getAllPokemons() {
		return pokemonService.getPokemons();
	}

	@RequestMapping(value = "/addNewPokemon", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	public Result addNewPokemon(@RequestBody Pokemon pokemon) {
		return pokemonService.addPokemon(pokemon);
	}

	@RequestMapping(value = "/updatePokemon", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	public Result updatePokemon(@RequestBody Pokemon pokemon) {
		return pokemonService.updatePokemon(pokemon);
	}

	@RequestMapping(value = "/deletePokemon", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	public Result deletePokemon(@RequestBody Pokemon pokemon) {
		return pokemonService.deletePokemon(pokemon);
	}
}
