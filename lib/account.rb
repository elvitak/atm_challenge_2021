require 'date'

class Account
  STANDART_VALIDITY_YRS = 5
  attr_accessor :exp_date, :account_status, :owner, :balance

  def initialize(attrs = {})
    @exp_date = set_exp_date
    @account_status = :active
    set_owner(attrs[:owner])
    @balance = 1000
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

  private

  def set_owner(obj)
    obj == nil ? missing_owner : @owner = obj
  end

  def missing_owner
    raise 'An Account owner is required'
  end
end
