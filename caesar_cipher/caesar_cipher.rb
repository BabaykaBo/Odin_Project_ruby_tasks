# frozen_string_literal: true

def caesar_cipher(message, number) # rubocop:disable Metrics/MethodLength
  cipher = ''
  message.each_byte do |byte|
    number %= 25 if number > 25

    if (65..90).include?(byte)
      byte = byte + number > 90 ? byte + number - 26 : byte + number

    elsif (97..122).include?(byte)
      byte = byte + number > 122 ? byte + number - 26 : byte + number

    end
    cipher += byte.chr
  end
  cipher
end

# puts caesar_cipher('What a string!', 5)
