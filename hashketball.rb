require 'pry'

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson"=> {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans"=> {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez"=> {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10, 
          :steals => 3,
          :blocks => 1, 
          :slam_dunks => 15
        },
        "Mason Plumlee"=> {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6, 
          :steals => 3, 
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry"=> {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    }, 
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien"=> {
          :number => 4, 
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo"=> {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop"=> {
          :number => 2,  
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon"=> {
          :number => 8, 
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood"=> {
          :number => 33, 
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }  
    }  
  }
end

def home_team_name
  game_hash[:home][:team_name]
end

def away_team_name
  game_hash[:away][:team_name]
end

def num_points_scored(name)
  #take in argument of player's name
  #returns number of points scored for that player
  #how find a player's :points?
  #how iterate to that level?
  # remember .each returns the original collection that is being iterated over
   #players name = key
   game_hash.each do |location, team_data|
     team_data[:players].each do |player_name, data|
       if player_name == name
         return data[:points]
       end
     end
   end
 end

def shoe_size(name)
  #take in an argument of player's name
  #returns :shoe (shoe size) of that player
  #how find shoe size of correct player?
  #player_name = KEY
  game_hash.each do |location, team_data|
    team_data[:players].each do |players_name, data|
      if players_name == name
        return data[:shoe]
      end
    end
  end
end

def team_colors(team)
  #takes in an argument of team's name
  #returns array of team colors
  #team_name is KEY; color is array & is VALUE
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end

def team_names
 #operates on the game_hash to return an array of team names
  game_hash.map do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team)
  jersey_numbers=[]
  game_hash.each do |location, team_data|
      if team_data[:team_name] == team
      team_data[:players].each do |player_name, stats|
         stats.collect do |stats, value|
           if stats == :number
              jersey_numbers.push(value)
          end
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(name)
  #takes in argument of player's name
  #returns hash of of player stats
  game_hash.keys.each do |team|
    if game_hash[team][:players].keys.include?(name) # isolate team, isolate players name
      return game_hash[team][:players][name]
    end
  end
end


def big_shoe_rebounds
  #return number of rebounds associated with the player that has largest shoe
  #1. find player with largest shoe
  #2.return that player's number of rebounds
  player_big_shoes = 0
  number_rebounds = 0
  game_hash.each_value do |team|
    team[:players].each do |player_name, player_data|
      if player_data[:shoe] > player_big_shoes
          player_big_shoes = player_data[:shoe]
          number_rebounds = player_data[:rebounds]
      end
    end
  end
  number_rebounds
end


      
#BONUS QUESTIONS

#def most_points_scored
  #which player has most points scored
 # player_highest_score = ""
 # highest_score = 0
 # game_hash.each_value do |team|
 #   team[:players].each do |player_name, player_data|
 #     if player_data[:points]> highest_score
 #       player_highest_score = player_name
 #       highest_score = player_data[:points]
 #     end
 #  end
#  player_highest_score
#end
