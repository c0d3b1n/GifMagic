class Gif < ApplicationRecord
  has_one_attached :file

  belongs_to :user
  has_and_belongs_to_many :tags
end
