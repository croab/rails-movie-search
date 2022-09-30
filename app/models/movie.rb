class Movie < ApplicationRecord
  belongs_to :director
  has_many :show_themes, as: :show

  include PgSearch::Model
  multisearchable against: [:title, :synopsis]
end
