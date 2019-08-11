class ArticlesController < ApplicationController
  before_action :authenticate_user!,except: :index
  
  def index

    @articles = Article.includes(:user).page(params[:page]).per(10).order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to action: :index
  end

  def show
    @article = Article.find(params[:id])
    # agent = Mechanize.new
    # # page = agent.get("http://localhost:3000/articles/#{@article.id}")
    # text_a_url = @article.text.search('a').get_attribute('href')
    # @image = agent.get("#{text_a_url}").at('img')
    # @url_text_h1 = agent.get("#{text_a_url}").at('h1').inner_text

  end

  def edit
    @article = Article.find(params[:id]) 
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params) if article.user_id == current_user.id
    redirect_to action: :index
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy if article.user_id == current_user.id
    redirect_to action: :index
  end

  private
  def article_params
    params.require(:article).permit(:text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index
  end
end
