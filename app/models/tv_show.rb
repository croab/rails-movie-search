class TvShow < ApplicationRecord
  has_many :show_themes, as: :show, dependent: :destroy
  has_many :themes, through: :show_themes
  include PgSearch::Model
  multisearchable against: [:title, :synopsis]
end
