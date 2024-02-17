# frozen_string_literal: true

def stock_picker(prices) # rubocop:disable Metrics/MethodLength
  max_profit = 0
  days = []

  prices.each_with_index do |buy_day, buy_index|
    prices[buy_index + 1..].each_with_index do |sell_day, sell_index|
      next unless  max_profit < sell_day - buy_day

      max_profit = sell_day - buy_day
      days[0] = buy_index
      days[1] = sell_index + buy_index + 1
    end
  end

  days
end

# p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
