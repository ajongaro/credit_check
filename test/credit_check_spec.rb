require './lib/credit_card'

RSpec.describe CreditCard do
  let(:cc_number) { "5541808923795240" }
  let(:bad_number) { "5541801923795240" }
  let(:good_amex) { "342804633855673" }
  let(:bad_amex) { "342801633855673" }

  describe '#initialize' do
    it 'takes a card number and limit' do
      credit_check = CreditCard.new(cc_number, 10_000)

      expect(credit_check.card_number).to eq("5541808923795240")
      expect(credit_check.limit).to eq(10_000)
    end
  end

  describe '#luhn_validator' do
    it 'returns true for valid card' do
      credit_check = CreditCard.new(cc_number, 10_000)

      expect(credit_check.is_valid?).to be true
    end

    it 'returns false for invalid standard card' do
      credit_check = CreditCard.new(bad_number, 1000)

      expect(credit_check.is_valid?).to be false
    end

    it 'returns true for valid AmEx card' do
      credit_check = CreditCard.new(good_amex, 1000)

      expect(credit_check.is_valid?).to be true
    end

    it 'returns false for invalid AmEx card' do
      credit_check = CreditCard.new(bad_amex, 1000)

      expect(credit_check.is_valid?).to be false
    end
  end

  describe '#last_four' do
    it 'returns last four digits of card number' do
      credit_check = CreditCard.new(cc_number, 10_000)

      expect(credit_check.last_four).to eq('5240')
    end
  end

  describe '#card_type' do
    it 'returns true if is amex' do
      credit_check = CreditCard.new(good_amex, 1000)

      expect(credit_check.card_type).to eq('AmEx')
    end

  end
end
