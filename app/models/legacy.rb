module Legacy
  class Base < ActiveRecord::Base
    self.abstract_class = true
      establish_connection :legacy
    # if Rails.env.production?
    #   establish_connection :legacy_prod
    # else
    #   establish_connection :legacy_dev
    # end
  end
end
