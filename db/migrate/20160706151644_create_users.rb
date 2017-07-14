class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :camipro
      t.datetime :expiry

      t.timestamps null: false
    end
  end
end
