class Resource
  attr_accessor :client

  def initialize
    @client = Contentful::Client.new(
      access_token: ENV['CONTENTFUL_ACCESS_TOKEN'],
      space: ENV['CONTENTFUL_SPACE'],
      dynamic_entries: :auto,
      resource_mapping: {
        'Asset' => Image
      }
    )
  end

  def fetch_articles
    Article.fetch_all(@client)
  end

  def fetch_article(id)
    Article.fetch(@client, id)
  end
end
