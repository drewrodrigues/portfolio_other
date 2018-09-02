require "rails_helper"

RSpec.describe Project, type: :model do
  let(:project) { build(:project) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:specifications) }
  it { is_expected.to validate_presence_of(:details) }

  it "has a valid factory" do
    expect(project.valid?).to eq(true)
  end
end
