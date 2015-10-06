class Agent < ActiveRecord::Base
  has_many :buyers
  has_many :sellers
  has_many :properties

  def self.sold_properties
    select('agents.email AS agent_email, s.email AS buyer_email, a.street, a.city, a.state, a.zip')
    .joins('INNER JOIN sellers s ON s.agent_id = agents.id
            INNER JOIN properties p ON p.seller_id = s.id
            INNER JOIN addresses a ON a.property_id = p.id')
    .where('p.status = ?', 'Sold')
  end

end
