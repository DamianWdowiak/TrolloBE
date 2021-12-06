# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :list

  validates :title, presence: true
  validates :position, numericality: { greater_than_or_equal_to: 0 }
  validates :position, uniqueness: { scope: :list }

  has_many_attached :files
  has_many :comments

  before_validation :set_position

  private

  def set_position
    self.position = list.cards.size
  end
end
