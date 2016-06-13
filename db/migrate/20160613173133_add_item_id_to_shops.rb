class AddItemIdToShops < ActiveRecord::Migration
  def change
    add_column :shops, :item_id, :integer
  end
end
