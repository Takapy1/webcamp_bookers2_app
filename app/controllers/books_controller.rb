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
    # Bookを特定する（URLの番号はBookモデルのid, Userじゃないから注意)
    @book = Book.find(params[:id])
    # 投稿用
    @book_new = Book.new

    # idで送られてきたBookを投稿したUserを特定する
    # 投稿の持っているuser_idが投稿者のidと一致するのでそれを元に見つける。
    @user = User.find_by(id: @book.user_id)
  end

  def edit
    # Bookを特定する
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book
  end

  def destroy
    book = Book.find(params[:id])
    if book.user_id == current_user.id
      Book.find(params[:id]).destroy
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end
end
