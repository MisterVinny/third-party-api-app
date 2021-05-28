class RecipesController < ApplicationController
  require "http"

  def index
    response = HTTP.get("https://api.edamam.com/api/food-database/v2/parser?ingr=red%20apple&app_id=#{Rails.application.credentials.food_user_id}&app_key=#{Rails.application.credentials.food_api_key}").body.to_s
    render json: response
  end

  def show
    string1 = params[:string1] # Takes in first variable
    string2 = "%20" + params[:string2].to_s  # Allows user to pass a second variable, or not, without breaking code.
    params[:string2]  ? (string2 = "%20" + params[:string2]) : string2 = "" # Allows user to pass a second variable, or not, without breaking code.
    response = HTTP.get("https://api.edamam.com/api/food-database/v2/parser?ingr=#{string1}#{string2}&app_id=#{Rails.application.credentials.food_user_id}&app_key=#{Rails.application.credentials.food_api_key}").body.to_s
    render json: response
  end
  
end
