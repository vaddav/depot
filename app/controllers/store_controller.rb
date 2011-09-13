class StoreController < ApplicationController
  def index
    @products = Product.all
    @count = session_count
  end

  def session_count
     if session[:counter].nil?
      session[:counter] = 0
     end
      session[:counter] += 1
  end
end
