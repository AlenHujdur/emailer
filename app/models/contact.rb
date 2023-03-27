class Contact < ApplicationRecord
  has_one_attached :document
  has_rich_text :message
end
