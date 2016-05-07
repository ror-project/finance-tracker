class CreateExpenseTrackers < ActiveRecord::Migration
  def change
    create_table :expense_trackers do |t|
      t.integer :year
      t.string :month
      t.integer :income
      t.integer :grocery
      t.integer :mortgage
      t.integer :gas
      t.integer :shopping
      t.integer :restaurant
      t.integer :utilities
      t.integer :other
      t.text :notes

      t.timestamps null: false
    end
  end
end
