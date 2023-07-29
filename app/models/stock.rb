class Stock < ApplicationRecord
    has_many :user_stocks, dependent: :destroy
    has_many :users, through: :user_stocks, dependent: :destroy
    validates :name, :ticker, presence:true
    before_save { self.ticker = ticker.upcase() }
    before_save { self.name = name.capitalize() }

    def self.new_lookup ticker_symbol #class methods => doesn't need an instance of stock class, we can directly call on the stock class
        client = IEX::Api::Client.new(
                                        publishable_token: Rails.application.credentials.iex[:publishable_token],
                                        secret_token: Rails.application.credentials.iex[:secret_token],
                                        endpoint: 'https://cloud.iexapis.com/v1'
        )
        begin
            new(ticker: ticker_symbol.upcase, name: client.company(ticker_symbol).company_name, price: client.quote(ticker_symbol).latest_price, percent: client.quote(ticker_symbol).change_percent_s, image: client.logo(ticker_symbol).url)
        rescue => e
            puts e.class
            puts e.message
            puts 'error'
            return 
        end
        
    end

    def self.check_db ticker_symbol
        where(ticker: ticker_symbol).first
    end

    def is_updated? symbol, price, percentage
      stock = Stock.check_db symbol
      return false if stock.percent >= percentage
      stock.update!(price: price, percent: percentage)
      return true
    end

end
