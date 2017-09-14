require_relative 'base'
require_relative 'formatter'
class Parse < Base
  def initialize
    super()
  end

  def results
    parse_response do
      results = Formatter.new(contents).format
      results.each_with_index do |result, index|
        puts "#{index+1}. #{result[0]} #{utility.pluralize(result[1], 'pt')}"
      end
    end
  end
end

parser = Parse.new
parser.results
