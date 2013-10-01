class Post < ActiveRecord::Base
  # attr_accessible :title, :body
  validates :permalink, :format => URI::regexp(%w(http https))
  validates_uniqueness_of :permalink
end
