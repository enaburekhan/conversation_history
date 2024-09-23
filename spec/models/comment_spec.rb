require 'rails_helper'

RSpec.describe Comment, type: :model do
  # association tests
  it { should belong_to(:user) }
  it { should belong_to(:project) }

  # validation test
  it { should validate_presence_of(:body) }
end
