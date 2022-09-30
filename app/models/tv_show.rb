class TvShow < ApplicationRecord
  has_many :show_themes, as: :show, dependent: :destroy
  include PgSearch::Model
  multisearchable against: [:title, :synopsis]
end
