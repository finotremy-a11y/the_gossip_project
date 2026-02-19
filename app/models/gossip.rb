class Gossip < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  has_many :gossip_tags
  has_many :tags, through: :gossip_tags
  validates :title, presence: true, length: { minimum: 3, maximum: 14 }
  validates :content, presence: true
end
