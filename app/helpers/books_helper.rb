module BooksHelper
  def favorites_count
    favorites.where(book_id: self.id).count
  end

  def comments_count
    favorites.where(book_id: self.id).count
  end


end
