class AddTotalSharesToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :total_shares, :integer
  end
end
