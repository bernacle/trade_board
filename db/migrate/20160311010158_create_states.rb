class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
