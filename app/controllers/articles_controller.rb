class ArticlesController < ApplicationController

  def index
    @articles = Resource.new.fetch_articles
  end

  def show
    @article = Resource.new.fetch_article(params[:id])
  end
end
