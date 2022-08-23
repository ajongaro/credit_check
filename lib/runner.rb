# frozen_string_literal = true

require './lib/credit_card'


welcome = <<HEREDOC

 /$$$$$$$            /$$                 /$$$$$$$                      /$$
| $$__  $$          | $$                | $$__  $$                    | $$
| $$  \\ $$ /$$   /$$| $$$$$$$   /$$$$$$ | $$  \\ $$  /$$$$$$  /$$$$$$$ | $$   /$$
| $$$$$$$/| $$  | $$| $$__  $$ /$$__  $$| $$$$$$$  |____  $$| $$__  $$| $$  /$$/
| $$__  $$| $$  | $$| $$  \\ $$| $$  \\ $$| $$__  $$  /$$$$$$$| $$  \\ $$| $$$$$$/
| $$  \\ $$| $$  | $$| $$  | $$| $$  | $$| $$  \\ $$ /$$__  $$| $$  | $$| $$_  $$
| $$  | $$|  $$$$$$/| $$$$$$$/|  $$$$$$/| $$$$$$$/|  $$$$$$$| $$  | $$| $$ \\  $$
|__/  |__/ \\______/ |_______/  \\______/ |_______/  \\_______/|__/  |__/|__/  \\__/

HEREDOC





puts welcome

puts 'Enter card number to check:'
print ' > '
number = gets.chomp

puts 'Enter credit limit:'
print ' > '
limit = gets.chomp.to_i

credit_card = CreditCard.new(number, limit)

if credit_card.is_valid?
  puts "Valid #{credit_card.card_type} number."
else
  puts "Invalid #{credit_card.card_type} number."
end
