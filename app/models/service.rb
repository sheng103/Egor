class Service < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :payments, :foreign_key => "service_id"
end
