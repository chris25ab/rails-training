class ArticlesController < ApplicationController

before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end

  def new #Action!!!
    @article = Article.new
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article) # it needs the id to render a specific id view
    else
      render 'edit' # renders the /new page
    end
  end

  def destroy
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
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params #learn what "whitelist params" is
    params.require(:article).permit(:title, :description)
  end
end
