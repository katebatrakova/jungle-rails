class User < ActiveRecord::Base

  #gives our User model authentication methods via bcrypt
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length:{ in: 8..20 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    # successfully authenticated? - return instance of the user
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
