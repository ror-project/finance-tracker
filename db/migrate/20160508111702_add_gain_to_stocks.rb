class AddGainToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :gain, :integer
  end
end
