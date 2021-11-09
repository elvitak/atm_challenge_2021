
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
        subject.withdraw 50
        expect(subject.funds).to eq 950
    end

    it 'is expected to reduce funds on withdraw' do
        expect { subject.withdraw 50 }
        .to change { subject.funds }.from(1000).to(950)
    end

end
