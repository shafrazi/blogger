class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(page_params)
    @article.save
    flash.notice = "Article #{@article.title} created!"
    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article #{@article.title} deleted!"
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(page_params)
    flash.notice = "Article #{@article.title} updated!"
    redirect_to @article
  end

  private

    def page_params
      params.require(:article).permit(:title, :body)
    end
end
