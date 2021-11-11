require 'date'

class Account
  STANDART_VALIDITY_YRS = 5
  attr_accessor :exp_date

  def initialize
    @exp_date = set_exp_date
  end

  def set_exp_date
    Date.today.next_year(STANDART_VALIDITY_YRS).strftime('%m/%y')
  end
end
