class AddReferencesToTickets < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :parties, foreign_key: true
  end
end
