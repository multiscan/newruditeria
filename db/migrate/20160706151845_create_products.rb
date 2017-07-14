class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :image_file_name
      t.boolean :visible
      t.integer :stock
      t.text :comment

      t.timestamps null: false
    end
  end
end
