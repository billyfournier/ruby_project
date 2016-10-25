class Group < ActiveRecord::Base
  belongs_to :user
  has_many :members
  validates :name, :description, presence: true
  validates :name, length: { in: 5..100 }
  validates :description, length: { in: 10..80 }
end
