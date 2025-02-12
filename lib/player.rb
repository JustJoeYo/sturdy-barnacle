class Player 
  attr_reader :first_name, :last_name, :monthly_cost, :contract_length, :nickname

  def initialize(name, monthly_cost, contract_length)
    @first_name = name.split[0]
    @last_name = name.split[1]
    @monthly_cost = monthly_cost
    @contract_length = contract_length
    @nickname = nil # initialized as nil
  end

  def total_cost
    @monthly_cost * @contract_length
  end

  def set_nickname!(nickname)
    @nickname = nickname
  end
end