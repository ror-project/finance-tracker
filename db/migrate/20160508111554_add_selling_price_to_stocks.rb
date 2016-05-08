class AddSellingPriceToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :selling_price, :integer
  end
end
