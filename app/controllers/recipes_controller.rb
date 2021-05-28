class RecipesController < ApplicationController
  require "http"

  def index
    response = HTTP.get("https://api.edamam.com/api/food-database/v2/parser?ingr=red%20apple&app_id=#{Rails.application.credentials.food_user_id}&app_key=#{Rails.application.credentials.food_api_key}").body.to_s
    render json: response
  end
  
end
