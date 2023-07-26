class User < ApplicationRecord
  has_many :user_stocks, dependent: :destroy
  has_many :stocks, through: :user_stocks, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    def under_stock_limit?
      stocks.count < 10
    end

    def stock_already_tracked? ticker_symbol
      stock = Stock.check_db ticker_symbol # In case the stock isn't present in the DB, obviously it isnt being tracked by any user.
      # return false unless stock
      return false if stock.nil?
      stocks.where(id: stock.id).exists?
    end

    def can_track_stock? ticker_symbol
      under_stock_limit? && !stock_already_tracked?(ticker_symbol)
    end

    def full_name
      return "#{first_name} #{last_name}" if first_name || last_name 
      "Anonymous"
    end

end
