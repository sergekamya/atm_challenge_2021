class Person
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    @name = name
    set_name(attrs[:name])
    @cash = 0
    @account = nil
  end

  def create_account
    @account = Account.new(owner: self)
    #binding.pry
  end

  def deposit(amount)
    @account == nil ? missing_name : deposit_funds(amount)
    #binding.pry
  end

  private

  def deposit_funds(amount)
    @account.balance += amount
  end

  def set_name(obj)
    obj == nil ? missing_name : @name = obj
  end

  def missing_name
    raise "A name is required"
  end
end