I'm going to use the pokemon_api and their numerous endpoints to populate three tables, pokemon, types and abilities. A pokemon can have types, a type can have multiple pokemons. A pokemon can have abilities, an ability can be in multiple pokemons. To populate pokemon table I'm going to use the pokemon, pokemon-species and generation endpoints. To populate types table I'm gonna use the type endpoint. To populate abilities table I'm going to use the ability endpoint. There are two many to many associations that create the tables pokemons_types and abilities_pokemons, so you can see a list of pokemon depending their type, and a list of abilities for each pokemon.

Table Pokemon

	name: https://pokeapi.co/api/v2/pokemon?limit=300

	height: https://pokeapi.co/api/v2/pokemon/{name}
	weight: https://pokeapi.co/api/v2/pokemon/{name}
	url: https://pokeapi.co/api/v2/pokemon/{name}
	
	color: https://pokeapi.co/api/v2/pokemon-species/{name}/
	evolves_from https://pokeapi.co/api/v2/pokemon-species/{name}/
	
	generation: https://pokeapi.co/api/v2/pokemon-species/{name}/ -> https://pokeapi.co/api/v2/generation/id/


Table Types

	name: https://pokeapi.co/api/v2/type?limit=50
	
	
Table Ability

	name: https://pokeapi.co/api/v2/ability?limit=300
	
	description: https://pokeapi.co/api/v2/ability/{name}/

Table Pokemons_Types

	type_name (types)
	pokemon_name (pokemon)

Table Abilities_Pokemons	

	ability_name (ability)
	pokemon_name (pokemon)
