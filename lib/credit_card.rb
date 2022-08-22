# frozen_string_literal = true

# a credit card
class CreditCard
  attr_reader :card_number, :limit

  def initialize(card_number, credit_limit)
    @card_number = card_number
    @card_number_arr = @card_number.split("").map(&:to_i)
    @limit = credit_limit
  end

  def luhn_checker
    sum = 0
    @card_number_arr.each_with_index do |value, index|
      if index.even?
        value *= 2
      end
      if value >= 10
        value -= 9
      end
      sum += value
    end
    return (sum % 10) == 0
  end

  def is_valid?
    luhn_checker
  end

  def last_four
    @card_number.chars.last(4).join
  end
end
