class AddStateIdToOffers < ActiveRecord::Migration
  def change
    add_reference :offers, :state, index: true, foreign_key: true
  end
end
