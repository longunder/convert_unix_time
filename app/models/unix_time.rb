class UnixTime
  include ActiveModel::Model
  attr_accessor :unix_time_value
  validates :unix_time_value, presence: true
end
