class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :bank_name
      t.string :account_type
      t.integer :start_balance
      t.integer :user_id
      t.string :account_number

      t.timestamps null: false
    end
  end
end
