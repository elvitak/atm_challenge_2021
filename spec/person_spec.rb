require './lib/person.rb'
require './lib/atm.rb'

RSpec.describe Person do
  subject { described_class.new(name: 'Trio') }

  it 'is expected to have a :name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'is expected to raise an error if no name is set' do
    expect { described_class.new }.to raise_error 'A name is required'
  end

  it 'is expected to have a :cash attribute with the value of 0 to initialize' do
    expect(subject.cash).to eq 0
  end

  it 'is expected to have a :account attribute' do
    expect(subject.account).to be nil
  end

  describe 'can create an Account' do
    before { subject.create_account }
    it 'is expected to create an instance of Account class' do
      expect(subject.account).to be_an_instance_of Account
    end

    it 'is expected to set himself as an Account owner' do
      expect(subject.account.owner).to be subject
    end
  end

  describe 'can manage funds if an account been created' do
    let(:atm) { Atm.new }
    before { subject.create_account }
    it 'is expected to be able deposit funds' do
      expect(subject.deposit(100)).to be_truthy
    end
  end
  describe 'can not manage funds if no account been created' do
    it 'is expected to not be able deposit funds if no account been created' do
      expect { subject.deposit(100) }.to raise_error(
        RuntimeError,
        'No account present',
      )
    end
  end
end
