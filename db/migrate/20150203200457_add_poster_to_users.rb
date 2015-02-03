class AddPosterToUsers < ActiveRecord::Migration
  def change
    add_column :movies, :poster, :string
  end
end
