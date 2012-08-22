class User < ActiveRecord::Base
  attr_accessible :email, :persistence_token, :first_name, :last_name, :gender,
                  :birthday,
                  :notify_news, :notify_offers, :notify_message, :notify_quote,
                  :notify_apppointment, :notify_photos, :notify_bill
  
  validates :email, :uniqueness => true
  validates :gender, :inclusion => %w(Male Female Other) << nil 

  # Actually, not; I think I'll just put the password in this model
  # has_one :password_credential, :as => :user, :dependant => :destroy

  acts_as_authentic

  # Create a new user and allow the protected password attributes to be
  # assigned to.
  def self.new_save_password(attrs)
    password_attrs = attrs.extract!(:password, :password_confirmation)
    user = User.new(attrs)
    user.assign_attributes password_attrs, :without_protection => true
    return user
  end
end
