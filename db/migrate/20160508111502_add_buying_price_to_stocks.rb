class AddBuyingPriceToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :buying_price, :integer
  end
end
