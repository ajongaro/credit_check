# frozen_string_literal = true

require './lib/credit_card'

puts 'Welcome to CreditCheck'
puts 'Enter card number to check:'
print ' > '
number = gets.chomp

puts 'Enter credit limit:'
print ' > '
limit = gets.chomp.to_i

puts CreditCard.new(number, limit).is_valid? ? "Card valid." : "Card invalid."
