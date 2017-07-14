class Legacy::Purchase < Legacy::Base
  belongs_to :user
  belongs_to :product
end
