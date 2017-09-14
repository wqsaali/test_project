require_relative 'utility'
class Base
  attr_reader :file, :contents, :utility
  def initialize
    @file = 'sample-input.txt'
    load_content if file_exists?
    @utility = Utility.new
  end

  def parse_response
    if content_load?
      yield
    else
      puts "#{file} not exist"
    end
  end


  private

  def file_exists?
    File.exist?(file)
  end

  def load_content
    @contents = File.readlines(file)
  end

  def content_load?
    contents.any?
  end

end
