# def loopy
#   multiple = 0
#   found = false
#   while !found do
#     multiple += 1
#     if multiple > 250 && multiple % 7 == 0
#       found = !found
#     end
#   end
#   puts multiple
# end
#
# loopy
#
# def factors(number)
#   factors_array = []
#   1.upto(number/2) do |index|
#     if number % index == 0
#       factors_array << index
#     end
#   end
#
#   factors_array.uniq
# end
#
# (1..100).to_a.each do |element|
#   p factors(element)
# end

def bubble_sort(values)
  0.upto(values.count - 1) do |first|
    first.upto(values.count - 1) do |second|
      if values[first] > values[second]
        values[first], values[second] = values[second] , values[first]
      end
    end
  end
  values
end

# p bubble_sort([3, 2, 4, 5, 1])

def substrings(string)
  chars_array = string.split("")

  substrings_array = []
  chars_array.each_with_index do |char, index|
    substring = char
    substrings_array << substring
    #p chars_array[(index+1)..-1]
    chars_array[(index+1)..-1].each do |char2|
      substring += char2
      substrings_array << substring
    end
  end

  substrings_array
end

#p substrings("cat")

def subwords(word)
  subs = substrings(word)
  dict = []
  File.foreach("dictionary.txt") do |term|
    dict << term.chomp#.gets.chomp
  end
  #p dict
  subs.select do |substring|
    p substring
    dict.include?(substring)
  end
end

p subwords("asdfasdfd")
