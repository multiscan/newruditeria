require 'open-uri'

Legacy::Product.all.each do |lp|
  p=Product.new(name: lp.name, visible: lp.visible, stock: lp.stock, comment: lp.comment, image_file_name: lp.picture)
  p.id = lp.id
  p.save
end

Legacy::User.all.each do |lu|
  if lu.name =~ /^(z|zz|xx|yy|yj)$/
    puts "-- Skipping user #{lu.id} (#{lu.name})"
    next
  end
  puts "-- Importing user #{lu.id} (#{lu.name})"
  u=User.new(name: lu.name, email: lu.email, camipro: lu.camipro, expiry: lu.expiry)
  u.created_at = lu.created_at
  # u.id = lu.id
  u.save

  np = 0
  lu.payments.each do |lp|
    p=u.payments.new(amount: (lp.amount * 100).to_i)
    p.created_at = lp.date
    p.save
    np = np + 1
  end
  puts "   #{np} payments"

  np = 0
  lu.purchases.each do |lp|
    p=u.purchases.new(product_id: lp.product_id, value: (lp.value * 100).to_i)
    p.created_at = lp.date
    p.save
    np = np + 1
  end
  puts "   #{np} purchases"

  next unless lu.picture =~ /^\/images/
  purl="http://lthcoffee.epfl.ch#{lu.picture}"
  begin
    open(purl) do |f|
      u.avatar = f
      u.save
      puts "   avatar"
    end
  rescue
    puts "   !! invalid avatar #{purl}"
  end
end

# Legacy::Payment.all.each do |lp|
#   p=Payment.new(user_id: lp.user_id, amount: (lp.amount * 100).to_i)
#   p.created_at = lp.date
#   p.id = lp.id
#   p.save
# end

# Legacy::Purchase.all.each do |lp|
#   p=Purchase.new(user_id: lp.user_id, product_id: lp.product_id, value: (lp.value * 100).to_i)
#   p.created_at = lp.date
#   p.id = lp.id
#   begin
#     p.save
#   rescue
#     puts "Purchase not saved: #{p.inspect}"
#   end
# end

# Legacy::User.all.each do |lu|
#   u = User.find lu.id
#   next unless u
#   next unless u.avatar_file_name.nil?
#   purl="http://lthcoffee.epfl.ch#{lu.picture}"
#   begin
#     open(purl) do |f|
#       u.avatar = f
#       u.save
#     end
#   rescue
#     puts "Image for user #{u.id} #{u.name} #{purl} not found"
#   end
# end

