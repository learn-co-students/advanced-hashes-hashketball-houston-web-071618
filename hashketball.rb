# Write your code here!
def game_hash
  {:home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {
      :name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
      },
      {
      :name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
      },
      {
      :name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
      },
      {
      :name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
      },
      {
      :name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
      }
    ]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {
      :name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
      },
      {
      :name => "Bismak Biyombo", 
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10
      },
      {
      :name => "DeSagna Diop", 
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
      },
      {
      :name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
      },
      {
      :name => "Brendan Haywood",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12
      }
    ]
  }
}
end

def num_points_scored(player_name)
  score = nil 
  game_hash.each do |team, attributes| #key: home/away, attributes: name, color, players
    players_array = attributes[:players]
    players_array.each do |data_players|
      if data_players[:name] == player_name
        score = data_players[:points]
      end 
    end 
  end 
  return score 
end 

def shoe_size(player_name) #return shoe size of player
  shoe_size = nil
  game_hash.each do |team, attributes|
    players_array = attributes[:players]
    players_array.each do |data_players|
      if data_players[:name] == player_name
        shoe_size = data_players[:shoe]
      end 
    end 
  end 
  return shoe_size
end

def team_colors(team)
  colors = nil
  game_hash.each do |teams, attributes|
    if attributes[:team_name] == team 
      colors = attributes[:colors].flatten
    end 
  end
  return colors
end

def team_names
  names = game_hash.collect do |team, team_details_hash|
    team_details_hash[:team_name] 
  end
  return names
end

def player_numbers(team_name)
  jersey_numbers = [] 
  game_hash.each do |team, team_attributes_hash|
    if team_attributes_hash[:team_name] == team_name 
      team_attributes_hash[:players].each do |player|
        player.each do |data, data_value|
          if data == :number
            jersey_numbers.push(data_value)
          end 
        end 
      end
    end 
  end 
  return jersey_numbers 
end

def player_stats(player_name)
  player_stats = {}
  game_hash.each do |team, team_attributes_hash|
    team_attributes_hash[:players].each do |stats|
      
      if stats[:name] == player_name
        stats.delete(:name)
        player_stats = stats
      end 
    end 
  end 
  return player_stats 
end

def big_shoe_rebounds
  size = 0
  rebounds = 0
    game_hash.each do | team, team_details_hash|
      team_details_hash[:players].each do | stats |
        if stats[:shoe] > size
          size = stats[:shoe]
          rebounds = stats[:rebounds]
        end
      end
    end
  return rebounds
end