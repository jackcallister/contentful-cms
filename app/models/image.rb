class Image < Contentful::Asset

  def url
    'https:' + self.fields[:file].properties[:url]
  end
end