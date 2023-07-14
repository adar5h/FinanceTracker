class Create < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :percent, :decimal
  end
end
