require 'rails_helper'

RSpec.describe Project, type: :model do
  # association test
  it { should have_many(:comments).dependent(:destroy) }

  # validation tests
  it { should validate_presence_of(:name)}
  it { should validate_inclusion_of(:status).in_array(%w[pending active completed]) }
end
