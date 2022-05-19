require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file)
    @recipes = []
    @csv_file = csv_file
    load_recipes
  end

  def list
    @recipes
  end

  def add(recipe)
    @recipes << recipe
    save_recipes
  end

  def remove_at(index)
    @recipes.delete_at(index)
    save_recipes
  end

  private

  def load_recipes
    CSV.foreach(@csv_file) do |csv|
      @recipes << Recipe.new(csv[0], csv[1])
    end
  end

  def save_recipes
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
