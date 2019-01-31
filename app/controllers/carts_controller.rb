class CartsController < ApplicationController
	def show 
		
	end

	def add
		product = Product.find_by(id: params[:id])

		# 檢查產品是否存在
		if product.present?
			# cart = Cart.from_hash[session[:cart111]]
			# 移到 ApplicationController
			# @cart.add_item(product.id)
			current_cart.add_item(product.id)

			# 存入session
			session[:cart111] = current_cart.serialize

			redirect_to products_path, notice: '已加入購物車'
		else
			redirect_to products_path, notice: '查無此商品'
		end
	end

	def destroy
		session[:cart111] = nil
		redirect_to cart_path, notice: '購物車已清空'
	end

	def checkout
		@user = User.new
	end
end
