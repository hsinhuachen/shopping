class ApplicationController < ActionController::Base
	before_action :init_cart
	include CartsHelper

	private
	def init_cart
		@cart = Cart.from_hash(session[:cart111])
	end
end
