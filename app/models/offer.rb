class Offer < ActiveRecord::Base
  searchkick
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  belongs_to :user
  belongs_to :state
  has_many :questions
end
