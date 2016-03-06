class AddAttachmentPhotoToOffers < ActiveRecord::Migration
  def self.up
    change_table :offers do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :offers, :photo
  end
end
