class PokemonsController < ApplicationController
    def index
        @pokemons = Pokemon.includes(:types, :abilities).all
    end
    def show
        @pokemon = Pokemon.find(params[:id])
    end
end
