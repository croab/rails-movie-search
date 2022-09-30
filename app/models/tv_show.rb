class TvShow < ApplicationRecord
  has_many :show_themes, as: :show
  include PgSearch::Model
  multisearchable against: [:title, :synopsis]
end
