class Exercise < ApplicationRecord
  belongs_to :training

  validates :title, presence: true,
                    length: {minimum: 5},
                    uniqueness: true
end
