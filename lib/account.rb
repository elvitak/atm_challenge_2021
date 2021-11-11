require 'date'

class Account
  STANDART_VALIDITY_YRS = 5
  attr_accessor :exp_date, :account_status

  def initialize
    @exp_date = set_exp_date
    @account_status = :active
  end

  def set_exp_date
    Date.today.next_year(STANDART_VALIDITY_YRS).strftime('%m/%y')
  end

  #def self.deactivate(account)
   # account.account_status = :deactivated 
   #end

  def deactivate
    @account_status = :deactivated
  end





end
