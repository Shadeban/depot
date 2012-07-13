class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
    
    def counter
      if session[:counter].nil?
        session[:counter] = 0
      end
      session[:counter]
    end
    
    def set_counter(num)
      session[:counter] = num
    end
  end
  
  

