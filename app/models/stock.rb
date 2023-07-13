class Stock < ApplicationRecord

    def self.new_lookup ticker_symbol #class methods => doesn't need an instance of stock class, we can directly call on the stock class
        client = IEX::Api::Client.new(
                                        publishable_token: Rails.application.credentials.iex[:publishable_token],
                                        secret_token: Rails.application.credentials.iex[:secret_token],
                                        endpoint: 'https://cloud.iexapis.com/v1'
        )

        client.price(ticker_symbol)
    end
end
