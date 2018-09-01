# title                   string
# description             text
# specifications          text
# details                 text
class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :specifications, presence: true
  validates :details, presence: true
end
