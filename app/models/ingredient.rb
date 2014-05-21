class Ingredient
  attr_accessor :data

  def initialize(options = {})
    self.data = options[:data]
  end

  def self.fetch(client, id)
    item = client.entry(id)
    recipe = Ingredient.new(data: item)
  end

  def method_missing(method, *args, &block)
    Hashie::Mash.new(self.data.fields).try(method) ||
    Hashie::Mash.new(self.data.properties[:items][0].fields).try(method) || super
  end
end
