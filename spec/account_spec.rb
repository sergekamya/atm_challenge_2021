require './src/account'
require 'date'

describe Account do
  let(:person) { instance_double('Person', name: 'Thomas') }

  subject { described_class.new({ owner: person }) }

  it 'is expected to have an owner' do
    expect(subject.owner).to eq person
  end

  it 'is expected to have an expiry date on initalize' do
    expected_date = Date.today.next_year(5).strftime('%m/%y')
    expect(subject.exp_date).to eq expected_date
  end

  it 'is expected to have active status on initialize' do
    expect(subject.account_status).to eq :active
  end

  it 'is expected to deactivate the account using the instance method' do
   subject.change_account_status
    expect(subject.account_status).to eq :deactivated
  end

  it 'is expected to raise error if no owner is set' do
    expect { described_class.new }.to raise_error 'An Account owner is required'
  end

  it 'is expected that the account balance will start at 0' do
    expect(subject.balance).to eq 0
  end

  it 'is expected that the account pin code is 4 digits long' do
    pin_length = Math.log10(subject.pin_code).to_i + 1
    expect(pin_length).to eq 4
  end
end
