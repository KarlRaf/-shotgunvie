class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :name
      t.integer :price
      t.string :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
