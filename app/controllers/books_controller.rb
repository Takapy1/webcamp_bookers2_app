class BooksController < ApplicationController
  def index
    @books = Book.all.order(created_at: :desc)
    # 投稿用のオブジェクトを作成
    @book = Book.new
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = ""
      redirect_to @book
    else
      @books = Book.all.order(created_at: :desc)
      render :index
    end
  end

  def show

  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end
end
