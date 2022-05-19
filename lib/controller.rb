require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # Get all the recipes from the repository
    recipes = @cookbook.list
    # Display all the recipes in the View
    @view.display(recipes)
  end

  def create
    # Ask user for a name and description
    name = @view.ask_user_for_recipe('name')
    description = @view.ask_user_for_recipe('description')
    # Create recipe
    recipe = Recipe.new(name, description)
    # Save in our Cookbook
    @cookbook.add(recipe)
    # Show user recipe list
    list
  end

  def destroy
    # Get the recipes from Cookbook
    recipes = @cookbook.list
    # list recipes
    @view.display(recipes)
    # Ask which recipes to be deleted
    index = @view.get_index
    # Remove from the Cookbook
    @cookbook.remove_at(index)
    # List all recipes
    list
  end
end
