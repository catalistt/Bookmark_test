class Type < ApplicationRecord
  has_many :bookmarks
  accepts_nested_attributes_for :bookmarks
  validates :name, presence: true

  def to_s
    name
  end
end
