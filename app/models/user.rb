class User < ActiveRecord::Base
  has_many :payments
  has_many :purchases
  has_attached_file :avatar, styles: { large: "320x240>", small: "160x120>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def default_avatar
    "avatar/#{sprintf('%02d', id%27)}"
  end

end
