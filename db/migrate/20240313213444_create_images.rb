class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.string :pokemon_name
      t.string :url

      t.timestamps
    end
  end
end
