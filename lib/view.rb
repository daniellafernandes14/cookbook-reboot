class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}: #{recipe.name} #{recipe.description}"
    end
  end

  def ask_user_for_recipe(something)
    puts "#{something}?"
    print '>'
    gets.chomp
  end

  def get_index
    puts "Which one?"
    gets.chomp.to_i - 1
  end
end
