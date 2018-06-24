# Write your code here!
require 'pry'
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },

    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  keys = game_hash.keys
  keys.each do |key|
    if game_hash[key.to_sym][:players].include?(player_name)
      return game_hash[key.to_sym][:players][player_name][:points]
    end
  end
end

def shoe_size(player_name)
  keys = game_hash.keys
  keys.each do |key|
    if game_hash[key.to_sym][:players].include?(player_name)
      return game_hash[key.to_sym][:players][player_name][:shoe]
    end
  end
end

def team_colors(team_name)
  game_hash[:home][:team_name] == team_name ? game_hash[:home][:colors] : game_hash[:away][:colors]
end

def team_names
  keys = game_hash.keys
  keys.map { |key| game_hash[key.to_sym][:team_name] }
end

def player_numbers(team_name)
  player_nums = []
  game_hash.each do |location, team|
    if game_hash[location.to_sym][:team_name] == team_name
      game_hash[location.to_sym][:players].keys.each do |player|
        player_nums << game_hash[location.to_sym][:players][player][:number]
      end
    end
  end
  player_nums
end

def player_stats(player_name)
  game_hash.each do |location, team|
    if team[:players].keys.include?(player_name)
      return game_hash[location.to_sym][:players][player_name]
    end
  end
end

def big_shoe_rebounds
  max_shoe = 0
  max_rebounds = 0
  max_person = ""

  game_hash.each do |location, team|
    team[:players].each do |player, attributes|
      if attributes[:shoe] > max_shoe
        max_rebounds = attributes[:rebounds]
        max_shoe = attributes[:shoe]
        max_person = player
      end
    end
  end
  max_rebounds
end

def most_points_scored
  max_points = 0
  max_player = ""

  game_hash.each do |location, team|
    team[:players].each do |player, attributes|
      if attributes[:points] > max_points
        max_points = attributes[:points]
        max_player = player
      end
    end
  end
  max_player
end

def team_total(location)
  total_points = 0
  game_hash[location.to_sym][:players].each do |player, attribute|
    total_points += game_hash[location.to_sym][:players][player][:points]
  end
  total_points
end

def winning_team
  team_name = ""
  total_points = 0

  game_hash.each do |location, team|
    if team_total(location) > total_points
      total_points = team_total(location)
      team_name = team[:team_name]
    end
  end
  team_name
end

def player_with_longest_name
  player_name = ""

  game_hash.each do |location, team|
    team[:players].each do |player, attributes|
      if player.length > player_name.length
        player_name = player
      end
    end
  end

  player_name
end

def long_name_steals_a_ton?
  longest = player_with_longest_name

  most_steals = 0
  steal_name = ""

  game_hash.each do |location, team|
    team[:players].each do |name, attributes|
      if attributes[:steals] > most_steals
        most_steals = attributes[:steals]
        steal_name = name
      end
      # binding.pry
    end
  end

  steal_name == longest
end
