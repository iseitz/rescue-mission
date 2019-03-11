class Question < ApplicationRecord
  attr_accessor :answers_attributes
  has_many :answers, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :answers
  validates :headline, presence: true , length: { minimum: 20 }
  validates :body, presence: true, length: { minimum: 50 }
  validates_associated :answers
end
