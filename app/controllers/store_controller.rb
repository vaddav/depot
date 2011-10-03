class StoreController < ApplicationController
  def index
    @products = Product.all
    @count = session_count
    @cart = current_cart

  end

  def session_count
     if session[:counter].blank?
      session[:counter] = 0
     end
      session[:counter] += 1
  end
end
