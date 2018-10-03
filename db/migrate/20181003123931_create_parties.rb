class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :name
      t.string :date
      t.string :organizer

      t.timestamps
    end
  end
end
