class RecipesController < ApplicationController

  def index
    @recipes = Resource.new.fetch_recipes
  end

  def show
    @recipe = Resource.new.fetch_recipe(params[:id])

    ingredients = []

    @recipe.ingredients.each do |ingredient|
      ingredients << Resource.new.fetch_ingredient(ingredient.sys.id)
    end

    @ingredients = ingredients
  end
end
