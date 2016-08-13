package com.heramb.DAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.heramb.models.Pokemon;
import com.heramb.models.Result;

@Component
public class PokemonDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public List<Pokemon> get() {
		String query = "Select * from POKEMON;";
		List<Pokemon> pokeList = null;
		try {
			pokeList = jdbcTemplate.query(query, new PokemonMapper());

		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return pokeList;
	}

	public Result insert(Pokemon pokemon) {
		String query = "insert into POKEMON values (?, ?, ?, ?)";
		try{
		jdbcTemplate.update(query, pokemon.getName(), pokemon.getCombatPower(),pokemon.getType(), pokemon.getEvolution());
		} catch(Exception exception){
			exception.printStackTrace();
			return new Result("ERROR",exception.getMessage());
		}
		
		return new Result("SUCCESS", pokemon.getName()+" was added successfully!");
	}
	
	public Result update(Pokemon pokemon) {
		String query = "update POKEMON set CP = ?, TYPE = ?, EVOLUTION = ? where NAME = ?";
		try{
		jdbcTemplate.update(query, pokemon.getCombatPower(),pokemon.getType(), pokemon.getEvolution(), pokemon.getName());
		} catch(Exception exception){
			exception.printStackTrace();
			return new Result("ERROR",exception.getMessage());
		}
		
		return new Result("SUCCESS", pokemon.getName()+" was updated successfully!");
	} 
	
	public Result delete(Pokemon pokemon) {
		String query = "delete from POKEMON where NAME = ?";
		try{
		jdbcTemplate.update(query, pokemon.getName());
		} catch(Exception exception){
			exception.printStackTrace();
			return new Result("ERROR",exception.getMessage());
		}
		
		return new Result("SUCCESS", pokemon.getName()+" was deleted successfully!");
	} 
}
