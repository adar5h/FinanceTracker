class StocksLogoChange < ActiveRecord::Migration[6.0]
  def change
    change_column :stocks, :image, :text
  end
end
