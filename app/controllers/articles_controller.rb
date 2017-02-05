class ArticlesController < ApplicationController

  def new #Action!!!
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    # @article.save
    # redirect_to article_path(@article)
    if @article.save #id save is success
      #do some
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

  def article_params
    params.require(:article).permit(:title, :descrption)
  end
end
