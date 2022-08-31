class RenameBooksIdColumnToFavorites < ActiveRecord::Migration[6.1]
  def change
    rename_column :favorites, :books_id, :book_id
  end
end
