class Legacy::Product < Legacy::Base
  has_many :costs
  has_many :purchases
end
