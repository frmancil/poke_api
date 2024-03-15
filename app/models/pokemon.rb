class Pokemon < ApplicationRecord
    has_and_belongs_to_many :types
    has_and_belongs_to_many :abilities

    validates :name, presence: true
    validates :generation, presence: true

    def self.search(search)
        if search
            pokemon = Pokemon.find_by(name: search)
                if pokemon
                    self.where(id: pokemon)
                else
                    @pokemons = Pokemon.all
                end
            else
                @pokemons = Pokemon.all
            end
        end
end
