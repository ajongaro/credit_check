# frozen_string_literal = true

# a credit card
class CreditCard
  attr_reader :card_number, :limit

  def initialize(card_number, credit_limit)
    @card_number = card_number
    @card_number_arr = card_number.split("").map(&:to_i)
    @limit = credit_limit
    @valid = luhn_validator
  end

  def is_valid?
    @valid
  end

  def card_type
    case @card_number_arr[0]
    when 3 then 'AmEx'
    when 4 then 'Visa'
    when 5 then 'Mastercard'
    when 6 then 'Discover'
    end
  end

  def last_four
    @card_number.chars.last(4).join
  end

  def luhn_validator
      sum = 0
      @card_number_arr.each_with_index do |value, index|
        if card_type == 'AmEx'
          value *= 2 if index.odd?
        else
          value *= 2 if index.even?
        end
        value -= 9 if value >= 10
        sum += value
      end
      (sum % 10) == 0
  end
end
