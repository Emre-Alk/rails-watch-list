class RenameColumnToMovies < ActiveRecord::Migration[7.1]
  def change
    rename_column :movies, :titre, :title
  end
end
