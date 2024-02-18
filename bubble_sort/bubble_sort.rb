# frozen_string_literal: true

def bubble_sort(numbers) # rubocop:disable Metrics/AbcSize
  bubble_numbers = numbers.clone

  bubble_numbers.length.times do |i|
    (bubble_numbers.length - i - 1).times do |j|
      next unless bubble_numbers[j] > bubble_numbers[j + 1]

      temp = bubble_numbers[j]
      bubble_numbers[j] = bubble_numbers[j + 1]
      bubble_numbers[j + 1] = temp
    end
  end

  bubble_numbers
end

arr = [4, 3, 78, 2, 0, 2]
p bubble_sort(arr)
