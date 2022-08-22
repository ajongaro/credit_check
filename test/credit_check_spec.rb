require './lib/credit_card'

RSpec.describe CreditCard do
  let(:cc_number) { "5541808923795240" }
  let(:bad_number) { "5541801923795240" }

  describe '#initialize' do
    it 'takes a card number and limit' do
      credit_check = CreditCard.new(cc_number, 10_000)

      expect(credit_check.card_number).to eq("5541808923795240")
      expect(credit_check.limit).to eq(10_000)
    end
  end

  describe '#is_valid?' do
    it 'returns whether card is valid' do
      credit_check = CreditCard.new(cc_number, 10_000)

      expect(credit_check.is_valid?).to be true
    end
  end

  describe '#last_four' do
    it 'returns last four digits of card number' do
      credit_check = CreditCard.new(cc_number, 10_000)

      expect(credit_check.last_four).to eq('5240')
    end
  end
end
