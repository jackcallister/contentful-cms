class Article
  attr_accessor :data

  def initialize(options = {})
    self.data = options[:data]
  end

  def self.fetch_all(client)
    result    = client.entries('content_type' => ENV['CONTENTFUL_ARTICLES_KEY'])
    articles  = []

    result.properties[:items].each do |item|
      articles << Article.new(data: item)
    end

    articles
  end

  def self.fetch(client, id)
    item = client.entries('sys.id[in]' => id)
    Article.new(data: item)
  end

  def method_missing(method, *args, &block)
    Hashie::Mash.new(self.data.fields).try(method) ||
    Hashie::Mash.new(self.data.properties[:items][0].fields).try(method) || super
  end
end