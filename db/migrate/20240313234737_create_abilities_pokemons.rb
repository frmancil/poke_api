class CreateAbilitiesPokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :abilities_pokemons do |t|
      t.integer :pokemon_id
      t.integer :ability_id

      t.timestamps
    end
  end
end
