class Bookmark < ApplicationRecord
  belongs_to :type
  belongs_to :category
  validates :url, presence: true
  validates :name, presence: true
end
