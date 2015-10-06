class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.integer :interest_level
      t.date :last_contact
      t.belongs_to :agent

      t.timestamps null: false
    end
  end
end
