class UserStocksController < ApplicationController

    def create
        stock = Stock.check_db(params[:ticker]) # check if the stock already exists in the table
        stock = Stock.new_lookup(params[:ticker]) if stock.nil? #make the API call if it doesn't
        @user_stock = UserStock.create(user: current_user, stock: stock)
        flash[:notice] = "Stock #{stock.name} has been successfully added to your portfolio"
        redirect_to my_portfolio_path
    end

    def destroy
        stock = Stock.find(params[:id])
        user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
        if user_stock.destroy
            flash[:notice] = "Stock #{stock.name} has been successfully removed."
            redirect_to my_portfolio_path(current_user)
        else
            flash[:notice] = "Unable to remove the stock from the list."
        end
    end
end
