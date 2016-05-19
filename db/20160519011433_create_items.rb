class CreateItems < ActiveRecord::Migration
  def change
    create_table :Items do |t|
      t.string :name
      t.string :category
    end
  end
end