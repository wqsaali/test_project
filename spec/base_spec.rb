require_relative '../base'
RSpec.describe Base do
  let(:base_obj) { Base.new }
  it "file exists?" do
    expect(base_obj.file.length).to be > (1)
  end

  it "file name correct" do
    expect(base_obj.file).to eq('sample-input.txt')
  end

  it 'contents are array' do
    expect(base_obj.contents).to be_an_instance_of(Array)
  end
end
