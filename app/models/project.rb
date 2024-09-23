class Project < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :name, presence: true
    validates :status, inclusion: { in: %w[pending active completed] }
end
