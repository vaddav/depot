class StoreController < ApplicationController
  def index
    @products = Product.all
    @count = session_count
    @cart = current_cart
    if @count >= 5
      @c_display = true
    end
  end

  def session_count
     if session[:counter].nil?
      session[:counter] = 0
     end
      session[:counter] += 1
  end
end
