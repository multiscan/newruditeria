class Cart
  def initialize(u)
    @user = u
  end
  def add(purchase)
    @purchases << [purchase.id, purchase.product_id]
  end
  def remove(purchase)
    @purchases.reject!{|v| v[1] == purchase.id}
  end
  def count(product)
    @purchases.count{|v| v[1] == product.id}
  end
end
