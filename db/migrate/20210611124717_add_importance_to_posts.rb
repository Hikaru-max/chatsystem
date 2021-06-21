class AddImportanceToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :importance, :numeric
  end
end
