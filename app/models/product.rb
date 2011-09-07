class Product < ActiveRecord::Base
  validates_presence_of :title, :description, :image_url, :message => 'Empty!!!!'
  #validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates_numericality_of   :price, :greater_than_or_equal_to => 0.01 , :message => 'Not number!!!'
  validates :title, :length => {:minimum => 10, :too_short => 'Short!!!'}
  validates_uniqueness_of :title, :message => 'Must be unique!!!'
  validates :image_url, :format => {
  :with => %r{\.(gif|jpg|png)$}i,
  :message => 'must be a URL for GIF, JPG or PNG image.'
}

end
