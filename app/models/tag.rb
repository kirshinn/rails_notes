# app/models/tag.rb
class Tag < ApplicationRecord
  has_and_belongs_to_many :notes

  validates_presence_of :name
end
