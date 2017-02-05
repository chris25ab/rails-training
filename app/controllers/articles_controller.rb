class ArticlesController < ApplicationController

  def new #Action!!!
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save #id save is success
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article) # it needs the id to render a specific id view
    else
      render 'new' # renders the /new page
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params #learn what "whitelist params is"
    params.require(:article).permit(:title, :descrption)
  end
end
