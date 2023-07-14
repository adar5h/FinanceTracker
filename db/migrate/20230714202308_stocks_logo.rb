class StocksLogo < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :image, :attachment
  end
end
