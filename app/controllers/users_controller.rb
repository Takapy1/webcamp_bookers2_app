class UsersController < ApplicationController
  def index
    # ユーザ一覧用
    @users = User.all
    # 投稿用
    @book = Book.new
    @user = current_user
  end

  def show
    # 送られてきたユーザを特定する。
    @user = User.find(params[:id])
    # 投稿用
    @book = Book.new
    # このページから投稿する場合、current_userとURLで送られてきたユーザが同じとは限らない
    # 投稿するのはcurrent_userの投稿になるように
    # current_userのインスタンス変数を投稿フォームに渡す。
    @current_user = current_user
    # Books一覧用
    @books = Book.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)


  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

end
