class Formatter
  attr_reader :contents, :results
  def initialize contents = []
    @contents = contents
  end

  def format
    convert_to_hash
    sum_up_values_of_same_key
    sort_by_value_and_key_alphabet
  end


  private

  def convert_to_hash
    @results = []
    contents.each do |content|
      content.split(', ').each do |inner_content|
        @results << get_key_value(inner_content)
      end
    end
  end

  def sum_up_values_of_same_key
    @results = results.inject{|line, el| line.merge( el ){|k, old_v, new_v| old_v + new_v}}
  end

  def sort_by_value_and_key_alphabet
    @results = results.sort_by { |k,v| [-v,k] }
  end

  def get_key_value(value)
    arr = value.split(' ')
    {arr[0..arr.length-2].join(' ') => arr.last.to_i}
  end


end
