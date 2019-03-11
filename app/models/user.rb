class User < ApplicationRecord
  attr_writer :login

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  validates :username, presence: :true, uniqueness: {case_sensitive: false}

  def login
    @login || self.username || self.email
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]
end
