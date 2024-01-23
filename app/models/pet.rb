class Pet < ApplicationRecord
  SPECIES = ["dog", "cat", "rabbit", "horse", "snake", "donkey"]
  validates :name, presence: true
  validates :species, inclusion: { in: SPECIES }
end
