class Team
  attr_accessor :name, :roster, :location

  def initialize(name, location)
    @name = name
    @location = location
    @roster = []
  end

  def add_player(player)
    @roster << player
  end

  def player_count
    @roster.count
  end

  def long_term_players
    @roster.find_all do |player|
      player.contract_length >= 24
    end
  end

  def short_term_players
    @roster.find_all do |player|
      player.contract_length < 24
    end
  end

  def total_value
    @roster.sum do |player|
      player.total_cost
    end
  end

  def details
    {
      "total_value" => total_value, # works many different ways, all objects i guess but ill just do it the way it matches
      "player_count" => player_count, # with the readme.md tests
    }
  end

  def average_cost_of_player
    average_cost = total_value / player_count
    "$#{average_cost.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}"
    # to_s = to string, reverse = reverse the string to add commas, gsub = global substitution,
    # (\d{3})(?=\d) = 3 digits followed by another one, '\\1,' = add a comma after the first 3 digits.
    # I was missing the reverse at the beginning and end of the gsub.
  end
  
    def players_by_last_name
    @roster.map { |player| player.last_name }.sort.join(', ')
    end
end