class ArticlesController < ApplicationController
  def index
    @articles = Article.order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to action: :index
  end

  private
  def article_params
    params.require(:article).permit(text: params[:text]).merge(user_id: current_user.id)
  end
end
