require './lib/account.rb'
RSpec.describe Account do
  subject { described_class.new }
  

  it 'is expected to check the length of a number' do
    number = 1234
    number_length = Math.log10(number).to_i + 1
    expect(number_length).to eq 4
  end

  it 'is expected to have an expiry date on initialize' do
    expected_date = Date.today.next_year(5).strftime('%m/%y')
    expect(subject.set_exp_date).to eq expected_date
  end

  it 'is expected to have :active status on initialize' do 
    expect(subject.account_status).to eq :active 
    end

  #it 'is expected to deactivate the account using the class method' do
   # Account.deactivate(subject)
    #expect(subject.account_status). to eq :deactivated
  #end

  it 'is expected to deactivate the account using the instance method' do
  subject.deactivate 
  expect(subject.account_status). to eq :deactivated
  end

end
