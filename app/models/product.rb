class Product < ActiveRecord::Base
  validates_presence_of :title, :description, :image_url, :message => 'Empty!!!!'
  validates_numericality_of   :price, :greater_than_or_equal_to => 0.01 , :message => 'Not number!!!'
  validates :title, :length => {:minimum => 10, :too_short => 'Short!!!'}
  validates_uniqueness_of :title, :message => 'Must be unique!!!'
  validates :image_url,:uniqueness => true ,:format => {
      :with => %r{\.(gif|jpg|png)$}i,
      :message => 'must be a URL for GIF, JPG or PNG image.'
}
  default_scope :order => 'title'

  validates :price, :numericality => {:less_than_or_equal_to => 100}

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  private
  # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.count.zero?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end

end
