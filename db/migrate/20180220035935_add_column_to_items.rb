class AddColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :inventory, :integer
    add_column :items, :price, :integer
    add_column :items, :category_id, :integer
  end
end
