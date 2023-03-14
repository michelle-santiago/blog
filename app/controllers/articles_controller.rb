class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params["id"])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    # @article.name = params[:name]
    # @article.body = params[:body]

    if @article.save
      redirect_to articles_path
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params["id"])
  end

  def update
    @article = Article.find(params["id"])

    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
    @article = Article.find(params["id"])
    @article.destroy
    redirect_to articles_path
    # else
    #   render :edit, status: :unprocessable_entity
    # end
  end

  private

  def article_params
    params.require(:article).permit(:name,:body)
  end
end
