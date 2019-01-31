require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:cart) { Cart.new }
  let(:p1) { create(:product, :dragonball, price: 80) }
  let(:p2) { create(:product, :jojo, price: 200) }

  it "每個 Cart Item 都可以計算它自己的金額(小計)" do
    3.times { cart.add_item(p1.id) }  # 加 3 次商品 1
    4.times { cart.add_item(p2.id) }  # 加 4 次商品 2
    2.times { cart.add_item(p1.id) }  # 再加 2 次商品 1

    expect(cart.items.first.price).to be 400   # 第 1 條 cart item 的價錢應該是 400 塊
    expect(cart.items.second.price).to be 800  # 第 2 條 cart item 應該是 800 塊
  end
end
