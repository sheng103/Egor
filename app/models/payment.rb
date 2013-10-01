class Payment < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :service, :foreign_key => "service_id"
end
