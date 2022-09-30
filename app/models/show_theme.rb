class ShowTheme < ApplicationRecord
  belongs_to :theme
  belongs_to :show, polymorphic: true
end
