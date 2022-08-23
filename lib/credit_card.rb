# frozen_string_literal = true

# a credit card
class CreditCard
  attr_reader :card_number, :limit, :card_number_arr, :check_num, :validity

  def initialize(card_number, credit_limit)
    @card_number = card_number
    @card_number_arr = card_number.split("").map(&:to_i)
    @limit = credit_limit
    @validity = luhn_validator
  end

  def is_valid?
    @validity
  end

  def is_amex?
    return true if @card_number_arr[0..1].join('') == '34'
    return true if @card_number_arr[0..1].join('') == '37'
    false
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
        if is_amex?
          if index.odd?
            value *= 2
          end
        else
          if index.even?
            value *= 2
          end
        end
        if value >= 10
          value -= 9
        end
        sum += value
      end
      return (sum % 10) == 0
  end

end
