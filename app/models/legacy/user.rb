class Legacy::User < Legacy::Base
  has_many :purchases
  has_many :payments
end
