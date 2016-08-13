package com.heramb.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.heramb.models.Pokemon;

public class PokemonMapper implements RowMapper<Pokemon>{

	public Pokemon mapRow(ResultSet resultSet, int rowNum) throws SQLException {
		Pokemon pokemon = new Pokemon();
		pokemon.setName(resultSet.getString("NAME"));
		pokemon.setCombatPower(resultSet.getInt("CP"));
		pokemon.setType(resultSet.getString("TYPE"));
		pokemon.setEvolution(resultSet.getString("EVOLUTION"));
		return pokemon;
	}
	
}
