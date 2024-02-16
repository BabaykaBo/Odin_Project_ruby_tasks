# frozen_string_literal: true

def substrings(string, dict)
  str = string.downcase

  dict.each_with_object({}) do |word, res|
    match = str.scan(word).length
    res[word] = match if match.positive?
  end
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

# puts substrings('below', dictionary)
# puts substrings("Howdy partner, sit down! How's it going?", dictionary)
