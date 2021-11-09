
require './lib/atm.rb'

describe Atm do 
    subject { Atm.new } # can be omitted
    it 'is expected to hold $1000 when instantiated' do 
        expect(subject.funds).to eq 1000 
    end

end


