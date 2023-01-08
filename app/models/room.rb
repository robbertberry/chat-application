# frozen_string_literal: true

class Room < ApplicationRecord
  validates :name, uniqueness: true
  scope :public_rooms, -> { where(is_private: false) }
  after_create_commit { broadcast_append_to 'rooms' }

  has_many :messages, dependent: :delete_all
end
