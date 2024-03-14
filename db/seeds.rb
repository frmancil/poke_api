# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'open-uri'
require 'json'

def fetch(url)
    JSON.parse(URI.open(url).read)
end

def pokemon_url(name)
    "https://pokeapi.co/api/v2/pokemon/#{name}"
end

def pokemon_species(name)
    "https://pokeapi.co/api/v2/pokemon-species/#{name}"
end

def pokemon_generation(name)
    "https://pokeapi.co/api/v2/generation/#{name}"
end

def pokemon_type(name)
    "https://pokeapi.co/api/v2/type/#{name}"
end

def pokemon_ability(name)
    "https://pokeapi.co/api/v2/ability/#{name}"
end

pokemon_list = fetch("https://pokeapi.co/api/v2/pokemon?limit=300")
types_list = fetch("https://pokeapi.co/api/v2/type?limit=100")
pokemon_abilities = fetch("https://pokeapi.co/api/v2/ability?limit=300")

types_list['results'].each do |type|
    new_type = Type.new
    type_recovered = fetch(pokemon_type(type['name']))
    pokemon_generation = fetch(pokemon_generation(type_recovered['generation']['name']))

    new_type.name = type_recovered['name']
    new_type.save
end

pokemon_list['results'].each do |pokemon|
    new_pokemon = Pokemon.new
    pokemon_recovered = fetch(pokemon_url(pokemon['name']))
    pokemon_species = fetch(pokemon_species(pokemon['name']))
    pokemon_generation = fetch(pokemon_generation(pokemon_species['generation']['name']))
    pokemon_types = pokemon_recovered['types']

    new_pokemon.name = pokemon_recovered['name']
    new_pokemon.height = pokemon_recovered['height']
    new_pokemon.weight = pokemon_recovered['weight']
    new_pokemon.color = pokemon_species['color']['name']
    if pokemon_species['evolves_from_species']
        new_pokemon.evolves_from = pokemon_species['evolves_from_species']['name']
    end
    new_pokemon.generation = pokemon_generation['main_region']['name']
    new_pokemon.save

    pokemon_types.each do |pokemon_type|
        poke_type = Type.find_or_create_by(name: pokemon_type['type']['name'])

        poke = Pokemon.find_or_create_by(name: pokemon_recovered['name'])
        poke_type.pokemons << poke
        poke_type.save
    end

    new_image = Image.new
    new_image.url = pokemon_recovered['sprites']['front_default']
    new_image.pokemon_name = pokemon_recovered['name']

end

pokemon_abilities['results'].each do |ability|
    new_ability = Ability.new
    ability_recovered = fetch(pokemon_ability(ability['name']))
    ability_text = ability_recovered['flavor_text_entries']
    ability_pokemon = ability_recovered['pokemon']

    new_ability.name = ability_recovered['name']

    ability_text.each do |text|
        if text['language']['name'] == 'en'
            new_ability.description = text['flavor_text']
            break
        end
    end
    new_ability.save

    ability_pokemon.each do |pokemon|
        poke_ability = Ability.find_or_create_by(name: ability_recovered['name'])

        poke = Pokemon.find_or_create_by(name: pokemon['pokemon']['name'])
        poke_ability.pokemons << poke
        poke_ability.save
    end
end