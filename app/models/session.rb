# == Schema Information
#
# Table name: sessions
#
#  id                   :integer          not null, primary key
#  authentication_token :string
#  expiry_at            :datetime
#  user_id              :integer
#

class Session < ActiveRecord::Base
  before_create :set_fields
  has_secure_token :authentication_token
  def set_fields
    self.expiry_at =  Time.current + 30.days
  end
end
