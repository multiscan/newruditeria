class UsersController < ApplicationController
  def index
    @users = User.where('expiry IS NULL').order("name")
  end

  def show
    uid = params[:id]
    @user = User.find(uid)
    @products = Product.where(:visible => 1)
    suid = session[:user_id]
    unless suid == uid && session[:expire_at] < Time.now
      session[:user_id] = uid
      session[:cart] = Cart.new(@user)
    end
    @cart = session[:cart]
    session[:expire_at] = Time.now
  end
end
