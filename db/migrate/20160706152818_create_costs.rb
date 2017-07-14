class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.references :product, index: true, foreign_key: true
      t.integer :amount
      t.datetime :valid_from

      t.timestamps null: false
    end
  end
end
