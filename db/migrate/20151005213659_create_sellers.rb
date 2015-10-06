class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.belongs_to :agent

      t.timestamps null: false
    end
  end
end
