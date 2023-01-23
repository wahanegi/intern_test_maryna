class Twitt < ApplicationRecord

  validates :body, presence: true, length: {maximum: 255}
  scope :latest, -> { order(created_at: :desc) }

  def showed_created_at
    created_at.strftime('%Y-%m-%d %H:%M')
  end
end
