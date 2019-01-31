class OrdersController < ApplicationController
	def create
	    # 建立訂單
	    user = User.new(user_params)

	    order = user.build_order(state: "pending")

	    # 購物車轉訂單
	    current_cart.items.each do |item|
	    	order.order_items.build(product: item.product, quantity: item.quantity)
	    end

	    if user.save
	    	# 送出到刷卡API
			result = paypal_gateway.transaction.sale(
				:amount => current_cart.total_price,
				:payment_method_nonce => params[:payment_method_nonce],
			)
			
    		redirect_to products_path, notice: "感謝大爺賞飯吃!"
	    else
    		redirect_to products_path, notice: "ERROR"
	    end

	    # 刷卡
	    # payment_method_nonce


	    # 清空購物車
	    # session[:cart111] = nil
	    
	    # 走!
	end

	private
	def user_params
		params.require(:user).permit(:name, :tel, :address)
	end
end
