# Write your code here!
# Write your code here!
require 'pry'
def game_hash
  {
    home: {
      team_name: 'Brooklyn Nets',
      colors: %w[Black White],
      players: [
        {
          player_name: 'Alan Anderson',
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, {
          player_name: 'Reggie Evans',
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: 'Brook Lopez',
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: 'Mason Plumlee',
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
          player_name: 'Jason Terry',
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: %w[Turquoise Purple],
      players: [
        {
          player_name: 'Jeff Adrien',
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: 'Bismak Biyombo',
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: 'DeSagna Diop',
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: 'Ben Gordon',
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
          player_name: 'Brendan Haywood',
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def list_of_players
  # let us get list of all the players and have them stored in a new array
  @list_of_players ||= game_hash.values.collect do |team|
    team[:players]
  end.flatten
end

def num_points_scored(player_name)
  # let us find the name of the player that is going to be passed into this method as an argument and then return the points for the player

  list_of_players.each do |player|
    return player[:points] if player[:player_name] == player_name
  end
end

def shoe_size(player_name)
  list_of_players.each do |player|
    return player[:shoe] if player[:player_name] == player_name
  end
end

def list_of_teams
  @list_of_teams ||= game_hash.values.collect do |team|
    team[:team_name]
  end.flatten
end

def team_colors(team_name)
  game_hash.values.collect do |team|
    return team[:colors] if team[:team_name] == team_name
  end
end

def team_names
  game_hash.values.collect do |team|
    team[:team_name]
  end
end

def player_numbers(team_name)
  numbers = []
  game_hash.values.each do |team|
    next unless team_name == team[:team_name]
    team[:players].each do |player|
      numbers << player[:number]
    end
  end
  numbers
end

def player_stats(player_name)
  list_of_players.each do |players|
    if players[:player_name] == player_name
      players.delete(:player_name)
      return players
    end
  end
end

def big_shoe_rebounds
  all_rebounds = []
  list_of_players.each do |players|
    all_rebounds << players[:rebounds]
  end
  all_rebounds.max_by { |i| all_rebounds.count(i) }

end
