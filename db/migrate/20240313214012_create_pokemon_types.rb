class CreatePokemonTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemon_types do |t|
      t.integer :pokemon_id
      t.integer :type_id
      t.timestamps
    end
  end
end
