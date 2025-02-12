require 'rspec'
require './lib/player'
require './lib/team'

RSpec.describe Team do
  before :each do
    @team = Team.new("Dodgers", "Los Angeles")
    @player_1 = Player.new("Michael Palledorous" , 1000000, 36)
    @player_2 = Player.new("Kenny DeNunez", 500000, 24)
    @player_3 = Player.new("Alan McClennan", 750000, 48)
    @player_4 = Player.new("Hamilton Porter", 100000, 12)
  end

  it 'initialize' do
    expect(@team).to be_an_instance_of Team
  end

  it 'initialized with empty roster' do
    expect(@team.roster).to eq([])
  end

  it 'initialized with no players' do
    expect(@team.player_count).to eq(0)
  end

  it 'add players' do
    @team.add_player(@player_1)
    @team.add_player(@player_2)

    expect(@team.roster).to eq([@player_1, @player_2])
  end

  it 'count players' do
    @team.add_player(@player_1)
    @team.add_player(@player_2)

    expect(@team.player_count).to eq(2)
  end

  it 'find long term players' do
    @team.add_player(@player_1)
    @team.add_player(@player_2)
    @team.add_player(@player_3)
    @team.add_player(@player_4)

    expect(@team.long_term_players).to eq([@player_1, @player_2, @player_3])
  end

  it 'find short term players' do
    @team.add_player(@player_1)
    @team.add_player(@player_2)
    @team.add_player(@player_3)
    @team.add_player(@player_4)

    expect(@team.short_term_players).to eq([@player_4])
  end

  it 'find total value' do
    @team.add_player(@player_1)
    @team.add_player(@player_2)
    @team.add_player(@player_3)
    @team.add_player(@player_4)

    expect(@team.total_value).to eq(85200000)
  end

  it 'find details' do
    @team.add_player(@player_1)
    @team.add_player(@player_2)
    @team.add_player(@player_3)
    @team.add_player(@player_4)

    expect(@team.details).to eq({"total_value" => 85200000, "player_count" => 4})
  end

  it 'find average cost of player' do
    @team.add_player(@player_1)
    @team.add_player(@player_2)
    @team.add_player(@player_3)
    @team.add_player(@player_4)

    expect(@team.average_cost_of_player).to eq("$21,300,000")
  end

  it 'find players by last name' do
    @team.add_player(@player_1)
    @team.add_player(@player_2)
    @team.add_player(@player_3)
    @team.add_player(@player_4)

    expect(@team.players_by_last_name).to eq("DeNunez, McClennan, Palledorous, Porter")
  end

  #seperated them all into individual tests to make sure they all work as intended as we spoke about.
end