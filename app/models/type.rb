class Type < ApplicationRecord
  has_many :bookmarks
  accepts_nested_attributes_for :bookmarks

  def to_s
    name
  end
end
