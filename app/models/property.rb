class Property < ActiveRecord::Base
  belongs_to :seller
  belongs_to :agent
  has_one :address
end
