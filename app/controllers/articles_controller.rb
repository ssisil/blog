class ArticlesController < ApplicationController
  def index
      @articles = Article.all
      respond_to do |format|
        format.html
        format.json do
          render json: @articles
        end
      end
  end
  
  def show
      @article = Article.find(params[:id])
      respond_to do |format|
        format.html
        format.json do
          render json: @article
        end
      end
  end
    
  def new
  end
  
  def create
    @article = Article.new(params.require(:article).permit(:title, :text))
 
    @article.save
    
     respond_to do |format|
       format.html {redirect_to @article}
       format.json {render json: @article}
     end
  end
  
end
