class RenameTypeToBookType < ActiveRecord::Migration[5.0]
  def change
    rename_column :books, :type, :book_type
  end
end