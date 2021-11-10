require './lib/atm.rb'

RSpec.describe Atm do 
    subject { Atm.new } # can be omitted
    let (:account) { instance_double('Account', pin_code: '1234', exp_date: "04/24", account_status: :active)}

    #before do
    #    allow(account).to receive(:balance).and_return(100)
    #    allow(account).to receive(:balance=)
    #end
    describe 'user has enough funds to withdraw money' do

        before do
            allow(account).to receive(:balance).and_return(100)
            allow(account).to receive(:balance=)
        end


        it 'is expected to hold $1000 when instantiated' do 
            expect(subject.funds).to eq 1000 
        end

        it 'is expected to reduce funds on withdraw' do
            subject.withdraw(50, '1234', account, :active)
            expect(subject.funds).to eq 950
        end

        it 'is expected to allow withdrawal if account has enough balance' do

            expected_output = {
                status: true,
                message: "success",
                date: Date.today,
                amount: 45
            }

            expect(subject.withdraw(45,'1234', account, :active)).to eq expected_output
        end
    end
    describe 'user is rejected a withdrawal' do
        
        before do
            allow(account).to receive(:balance).and_return(100)
            allow(account).to receive(:balance=)
        end
        
        
        
        it 'is expected to reject an withdrawal' do
            expected_output = {
                status: false,
                message: "insufficient funds in account",
                date: Date.today
            }
            expect(subject.withdraw(105, '1234', account, :active)).to eq expected_output
        
        end
        
        it 'is expected to reject withdraw if ATM has insufficient funds' do
            subject.funds = 50
            expected_output = { 
                status: false, 
                message: 'insufficient funds in ATM',
                date: Date.today
        }    
        expect(subject.withdraw(100,'1234', account, :active)).to eq expected_output
        end    

        it 'is expected to reject withdraw if the pin is wrong' do 
            expected_output = { 
                status: false, 
                message: 'wrong pin', 
                date: Date.today
             }
            expect(subject.withdraw(50, 9999, account, :active)).to eq expected_output
        end

        it 'is expected to reject withdraw if the card is expired' do
            allow(account).to receive(:exp_date).and_return('12/20')
            expected_output = {
              status: false,
              message: 'card expired',
              date: Date.today
            }
            expect(subject.withdraw(6, '1234', account, :active)).to eq expected_output
        end

        it 'is expected to reject withdrawal if the card is disabled'
            
            expected_output = {
                status: false,
                message: 'card disabled',
                date: Date.today
            }
        end
        



    end

end
