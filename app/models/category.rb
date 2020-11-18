class Category < ApplicationRecord
  has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :parent_category, :class_name => "Category", optional: true
  has_many  :bookmarks

  before_save do
    if self.parent_id?
      main_category = Category.find_by(id: self.parent_id)
      self.visibility = main_category.visibility
    end
  end

  def to_s
    name
  end
end
