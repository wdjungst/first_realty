class Seller < ActiveRecord::Base
  belongs_to :agent
  has_many :properties
end
