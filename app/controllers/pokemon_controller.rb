class PokemonController < ApplicationController

  def index
    key = ENV["GIPHY_KEY"]

    pokemon_response = HTTParty.get("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json")
    pokemon_body = JSON.parse(pokemon_response.body)

    @pokemon_id   = pokemon_body["pokemon"][0]["id"]
    @pokemon_name = pokemon_body["pokemon"][0]["name"]
    @pokemon_type = pokemon_body["pokemon"][0]["type"]


    gif_response = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{key}&q=bulbasaur&rating=g")
    gif_body = JSON.parse(gif_response.body)

    @pokemon_gif = gif_body["data"][0]["images"]["original"]["url"]

    respond_to do |format|
      format.html { render :index }

      format.json { render json: {
        id:    @pokemon_id,
        name:  @pokemon_name,
        type:  @pokemon_type,
        gif:   @pokemon_gif
      } }
    end

  end

  def show
    key = ENV["GIPHY_KEY"]

    pokemon_response = HTTParty.get("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json")
    pokemon_body = JSON.parse(pokemon_response.body)

    input = params[:id]

    pokemon_body["pokemon"].each do |p|
      if input.to_i == p["id"]
        @pokemon_id   = p["id"]
        @pokemon_name = p["name"]
        @pokemon_type = p["type"]
      elsif input.to_i == 0
        if input.capitalize == p["name"]
          @pokemon_id   = p["id"]
          @pokemon_name = p["name"]
          @pokemon_type = p["type"]
        end
      end
    end



    gif_response = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ key }&q=#{ @pokemon_name }&rating=g")
    gif_body = JSON.parse(gif_response.body)

    @pokemon_gif = gif_body["data"][0]["images"]["original"]["url"]

    respond_to do |format|
      format.html { render :show }
      format.json {
        render json: {
          id:   @pokemon_id,
          name: @pokemon_name,
          type: @pokemon_type,
          gif:  @pokemon_gif }
      }
    end

  end

end
