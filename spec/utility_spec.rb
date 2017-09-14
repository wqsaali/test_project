require_relative '../utility'
RSpec.describe Utility do
  let(:utility_obj) { Utility.new }
  it "pluralize for singular" do
    expect(utility_obj.pluralize(1, 'pt')).to eq('1 pt')
  end

  it "pluralize for plural" do
    expect(utility_obj.pluralize(2, 'pt')).to eq('2 pts')
  end

  it "pluralize for plural with custom plural text" do
    expect(utility_obj.pluralize(2, 'pt', 'points')).to eq('2 points')
  end
end
