class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new #Action!!!
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article) # it needs the id to render a specific id view
    else
      render 'edit' # renders the /new page
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
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
    params.require(:article).permit(:title, :description)
  end
end
