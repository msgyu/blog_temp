class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.page(params[:page]).per(10).order("created_at DESC")
    @article.text = view_context.auto_link(@article.text)
  end
end
