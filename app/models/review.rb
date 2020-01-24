class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :content_body, presence: true, length: { minimum: 50, maximum: 250 }
  validates :rating, presence: true, numericality: { less_than_or_equal_to: 5 }
end
