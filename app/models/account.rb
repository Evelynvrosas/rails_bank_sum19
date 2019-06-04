class Account < ApplicationRecord
  belongs_to :user

  validates :balance, numericality: {
    greater_than_or_equal_to: 25,
    message: "Must at least be $25"
  }
end
