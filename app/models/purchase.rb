class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates_associated :product
  validates_associated :user
end
