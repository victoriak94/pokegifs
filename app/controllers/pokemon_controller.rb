class PokemonController < ApplicationController

  def show

  res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
  body = JSON.parse(res.body)
  name  = body["name"]
  id = body["id"]
  types = body["types"]
  simple_types = []

  types.each do |obj|
    simple_types << obj["type"]["name"]
  end

  res = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}&q=pikachu&rating=g")
  body = JSON.parse(res.body)
  gif_url = body["data"][0]["url"]

  render json: { "id": id,
    "name": name,
    "types": simple_types,
    "url": gif_url
  }

  end
end
