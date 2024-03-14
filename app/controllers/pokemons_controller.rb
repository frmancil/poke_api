class PokemonsController < ApplicationController
    def index
        @pokemons = Pokemon.all.page(params[:page])
    end
    def show
        @pokemon = Pokemon.find(params[:id])
    end
end
