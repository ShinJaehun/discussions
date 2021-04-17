class Discussion < ApplicationRecord
  belongs_to :channel
  belongs_to :user

  has_many :replies, dependent: :destroy

  validates :title, :content, presence: true
  resourcify #이걸 왜 하는지는 모르겠음....
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    title_changed?
  end
end
