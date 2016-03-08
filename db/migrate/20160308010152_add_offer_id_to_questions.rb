class AddOfferIdToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :offer, index: true, foreign_key: true
  end
end
