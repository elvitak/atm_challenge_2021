
require './lib/atm.rb'

describe Atm do 
    subject { Atm.new } # can be omitted
    let (:account) { instance_double('Account')}

    before do
        allow(account).to receive(:balance).and_return(100)
        allow(account).to receive(:balance=)
    end

    it 'is expected to hold $1000 when instantiated' do 
        expect(subject.funds).to eq 1000 
    end

    it 'is expected to reduce funds on withdraw' do
        subject.withdraw 50, account
        expect(subject.funds).to eq 950
    end

    it 'is expected to reduce funds on withdraw' do
        expect { subject.withdraw 50, account }
        .to change { subject.funds }.from(1000).to(950)
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
