require 'populator'
require 'faker'

namespace :populate do
  desc "Populate DB relations"
  task db: :environment do
    Agent.populate 100 do |agent|
      agent.first_name = Faker::Name.first_name
      agent.last_name = Faker::Name.last_name
      agent.email = Faker::Internet.email

      Buyer.populate Faker::Number.between(1, 50) do |buyer|
        buyer.first_name = Faker::Name.first_name
        buyer.last_name = Faker::Name.last_name
        buyer.email = Faker::Internet.email
        buyer.phone = Faker::PhoneNumber.cell_phone
        buyer.interest_level = Faker::Number.between(1, 10)
        buyer.last_contact = Faker::Date.between(6.months.ago, Date.today)
        buyer.agent_id = agent.id
      end

      Seller.populate Faker::Number.between(1, 100) do |seller|
        seller.first_name = Faker::Name.first_name
        seller.last_name = Faker::Name.last_name
        seller.email = Faker::Internet.email
        seller.phone = Faker::PhoneNumber.cell_phone
        seller.agent_id = agent.id
        Property.populate Faker::Number.between(1, 10) do |property|
          options = ["Sold", "For Sale", "Sale Pending"]
          index = Random.rand(3)
          status = options[index]
          property.status = status
          property.sold_price = Faker::Number.decimal(6,2) if status == "Sold"
          property.sale_price = Faker::Number.decimal(6, 2)
          property.seller_id = seller.id
          property.agent_id = agent.id
          Address.populate 1 do |address|
            address.street = Faker::Address.street_address
            address.city = Faker::Address.city
            address.state = Faker::Address.state
            address.zip = Faker::Number.number(5)
            address.property_id = property.id
          end
        end
      end
    end

    Agent.populate 10 do |agent|
      agent.first_name = Faker::Name.first_name
      agent.last_name = Faker::Name.last_name
      agent.email = Faker::Internet.email
    end

    Buyer.populate Faker::Number.between(1, 50) do |buyer|
      buyer.first_name = Faker::Name.first_name
      buyer.last_name = Faker::Name.last_name
      buyer.email = Faker::Internet.email
      buyer.phone = Faker::PhoneNumber.cell_phone
      buyer.interest_level = Faker::Number.between(1, 10)
      buyer.last_contact = Faker::Date.between(6.months.ago, Date.today)
    end


    Seller.populate Faker::Number.between(1, 60) do |seller|
      seller.first_name = Faker::Name.first_name
      seller.last_name = Faker::Name.last_name
      seller.email = Faker::Internet.email
      seller.phone = Faker::PhoneNumber.cell_phone
    end

    Property.populate Faker::Number.between(1, 10) do |property|
      options = ["Sold", "For Sale", "Sale Pending"]
      index = Random.rand(3)
      status = options[index]
      property.status = status
      property.sold_price = Faker::Number.decimal(6,2) if status == "Sold"
      property.sale_price = Faker::Number.decimal(6, 2)
    end
  end
end
