class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :status
      t.float :sold_price
      t.float :sale_price
      t.belongs_to :seller
      t.belongs_to :agent

      t.timestamps null: false
    end
  end
end
