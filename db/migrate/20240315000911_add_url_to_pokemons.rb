class AddUrlToPokemons < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemons, :url, :string
  end
end
