package com.heramb.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.heramb.DAO.PokemonDAO;
import com.heramb.models.Pokemon;
import com.heramb.models.Result;

@Component
public class PokemonService {
	
	@Autowired
	PokemonDAO pokemonDAO;

	public List<Pokemon> getPokemons(){
		return pokemonDAO.get();
	}
	
	public Result addPokemon(Pokemon pokemon){
		return pokemonDAO.insert(pokemon);
	}
	
	public Result updatePokemon(Pokemon pokemon){
		return pokemonDAO.update(pokemon);
	}
	
	public Result deletePokemon(Pokemon pokemon){
		return pokemonDAO.delete(pokemon);
	}
	
}
