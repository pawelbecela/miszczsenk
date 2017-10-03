class Training < ApplicationRecord
  has_many :exercises

  validates :title, presence: true,
                    length: {minimum: 5},
                    uniqueness: true
end
