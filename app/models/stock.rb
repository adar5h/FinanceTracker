class Stock < ApplicationRecord

    def self.new_lookup ticker_symbol #class methods => doesn't need an instance of stock class, we can directly call on the stock class
        client = IEX::Api::Client.new(
                                        publishable_token: Rails.application.credentials.iex[:publishable_token],
                                        secret_token: Rails.application.credentials.iex[:secret_token],
                                        endpoint: 'https://cloud.iexapis.com/v1'
        )
        begin
            new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, price: client.price(ticker_symbol), percent: client.quote(ticker_symbol).change_percent_s, image: client.logo(ticker_symbol).url)
        rescue => e
            puts e.class
            puts e.message
            puts 'error'
            return 
        end
        
    end
end
