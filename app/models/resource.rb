class Resource
  attr_accessor :client

  def initialize
    @client = Contentful::Client.new(
      access_token: ENV['CONTENTFUL_ACCESS_TOKEN'],
      space: ENV['CONTENTFUL_SPACE'],
      dynamic_entries: :auto
    )
  end

  def fetch_recipes
    Recipe.fetch_all(@client)
  end

  def fetch_recipe(id)
    Recipe.fetch(@client, id)
  end

  def fetch_ingredient(id)
    Ingredient.fetch(@client, id)
  end
end
