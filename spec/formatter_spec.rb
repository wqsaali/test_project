require_relative '../formatter'
RSpec.describe Formatter do
  let(:contents) { ["Lions 3, Snakes 3\n", "Tarantulas 1, FC Awesome 0\n", "Lions 1, FC Awesome 1\n", "Tarantulas 3, Snakes 1\n", "Lions 4, Grouches 0\n"] }
  let(:formatter_obj) { Formatter.new(contents) }

  it 'contents are array' do
    expect(formatter_obj.contents).to be_an_instance_of(Array)
  end

  it "check results is array" do
    formatter_obj.send :convert_to_hash
    expect(formatter_obj.results).to be_an_instance_of(Array)
  end

  it "check results row is hash" do
    formatter_obj.send :convert_to_hash
    expect(formatter_obj.results[0]).to be_an_instance_of(Hash)
  end

  it 'convert string to hash' do
    hash = formatter_obj.send :get_key_value, 'Lion 3'
    expect(hash).to eq({'Lion' => 3})
  end

  it 'sum up same keys value' do
    formatter_obj.send :convert_to_hash
    formatter_obj.send :sum_up_values_of_same_key
    expect(formatter_obj.results["Lions"]).to eq(8)
  end
  
end
