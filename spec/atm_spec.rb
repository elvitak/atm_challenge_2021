require './lib/atm.rb'

RSpec.describe Atm do 
    subject { Atm.new } # can be omitted
    let (:account) { instance_double('Account')}

    before do
        allow(account).to receive(:balance).and_return(100)
        allow(account).to receive(:balance=)
    end
    describe 'user has enough funds to withdraw money' do

        it 'is expected to hold $1000 when instantiated' do 
            expect(subject.funds).to eq 1000 
        end

        it 'is expected to reduce funds on withdraw' do
            subject.withdraw 50, account
            expect(subject.funds).to eq 950
        end

        it 'is expected to allow withdrawal if account has enough balance' do

            expected_output = {
                status: true,
                message: "success",
                date: Date.today,
                amount: 45
            }

            expect(subject.withdraw(45, account)).to eq expected_output
        end
    end
    describe 'user has insufficient funds' do
        it 'is expected to reject an withdrawal' do
            expected_output = {
                status: false,
                message: "insufficient funds",
                date: Date.today,
            }
            expect(subject.withdraw(105, account)).to eq expected_output
        end
    end
end
