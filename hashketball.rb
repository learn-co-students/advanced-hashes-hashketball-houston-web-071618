require "pry"
# Write your code here!
def game_hash
game_hash = {
 :home => { 
  :team_name => "Brooklyn Nets",
  :colors => ["Black","White"],
  :players => { 
      "Alan Anderson" => {
      :number => 0,
      :shoe  => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
      },
       "Reggie Evans" => {
      :number => 30,
      :shoe  => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
      },
       "Brook Lopez" => {
      :number => 11,
      :shoe  => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
      },
       "Mason Plumlee" => {
      :number => 1,
      :shoe  => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
      },       
      "Jason Terry" => {
      :number => 31,
      :shoe  => 15,
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
:colors => ["Turquoise","Purple"],
:players => {       
      "Jeff Adrien" => {
      :number => 4,
      :shoe  => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
      },
       "Bismak Biyombo" => {
      :number => 0,
      :shoe  => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10
      },
       "DeSagna Diop" => {
      :number => 2,
      :shoe  => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
      },
       "Ben Gordon" => {
      :number => 8,
      :shoe  => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
      },       
      "Brendan Haywood" => {
      :number => 33,
      :shoe  => 15,
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
game_hash
end   

# def num_points_scored(game_h)
#   player_name = ""
#   player_stat = ""
#   ans = ""
#   game_h.collect do | key, team_data |
#     # key is home or away
#     team_data.each do | team_attr, val_data |
#       # team_attr is name, colors, players
#       if team_attr == :players
#          val_data.each do | player, player_stat_data |
#           # player is players name
#             player_name = player
#             ans << player
#             player_stat_data.each do | stat_cat, stat |
#             if stat_cat == :points
#               player_stat = stat
#               puts "#{player_name} #{stat}"
#               ans = "#{player_name} #{stat}"
#               # ans << "#{stat}"
#             end
#           end  
#         end      
#       end
#     end
#   end  
#   ans
# end
# num_points_scored(game_hash)

def num_points_scored(player_n)
  # player_name = ""
  player_stat = nil
  ans = ""
  game_hash.each do | key, team_data |
    # key is home or away
    team_data.each do | team_attr, val_data |
      # team_attr is name, colors, players
      if team_attr == :players
         val_data.each do | player, player_stat_data |
          # player is players name
            if player == player_n
            # ans << player
            player_stat_data.collect do | stat_cat, stat |
            if stat_cat == :points
              player_stat = stat
              # puts "#{player_name} #{stat}"
              # ans = "#{player_n} #{stat}"
              ans << "#{stat}"
            end
          end
          end  
        end      
      end
    end
  end  
  ans.to_i
end
num_points_scored("Jeff Adrien")

def shoe_size(player_n)
  # player_name = ""
  player_stat = ""
  ans = ""
  game_hash.each do | key, team_data |
    # key is home or away
    team_data.each do | team_attr, val_data |
      # team_attr is name, colors, players
      if team_attr == :players
         val_data.each do | player, player_stat_data |
          # player is players name
            if player == player_n
            # ans << player
            player_stat_data.each do | stat_cat, stat |
            if stat_cat == :shoe
              player_stat = stat
              # puts "#{player_name} #{stat}"
              # ans = "#{player_n} #{stat}"
              ans << "#{stat}"
            end
          end
          end  
        end      
      end
    end
  end  
  ans.to_i
end
shoe_size("Jeff Adrien")

def team_colors(team_n)
  ans = ""
  # team_name = team_n
    game_hash.collect do | key, team_data |
    #   # key is home or away
    #   # first time home
    team_data.collect do | team_name, val_team_name|
      if team_name == :team_name && val_team_name == team_n
        team_data.collect do | color_name, val_color_name|
          if color_name == :colors 
          ans = val_color_name
        end
      end
        # ans << "#{val_team_name}"
      end  
    end  
  end 
  ans
end
team_colors("Brooklyn Nets")

def team_names
  ans = []
  game_hash.each do | key, team_data |
    # key is home or away
    # first time home
    team_data.each do | team_name, val_team_name|
      if team_name == :team_name
        ans << "#{val_team_name}"
      end  
    end  
  end 
  ans 
end
team_names

def player_numbers(team_n)
  # player_name = ""
  player_stat = ""
  ans = []
  game_hash.each do | key, team_data |
    # key is home or away
    team_data.each do | team_attr, val_data |
      # team_attr is team name, colors, players
      # hook so team_attr is team_n
      # if team_attr == team_n
        # next time on each team_attr players
        # charlotte_numbers = [0, 2, 4, 8, 33]
      # brooklyn_numbers = [0, 1, 11, 30, 31]
      if team_attr == :team_name && val_data == team_n
        team_data.each do | player, player_stat_data |
        # binding.pry
          if player == :players
            player_stat_data.each do | player_name, stat_cat |
              stat_cat.each do | stat_name, stat |
                if stat_name == :number
                  ans <<  stat
                end
              end  
            end  
          end      
        end
      end
    end   
  end  
  ans.sort
end
player_numbers("Brooklyn Nets")

def player_stats(player_n)
  player_name = player_n
  player_stat = ""
  game_hash.each do | key, team_data |
    # key is home or away
    team_data.each do | team_attr, val_data |
      # team_attr is name, colors, players
      if team_attr == :players
         val_data.each do | player, player_stat_data |
          # player is players name
            if player == player_name
              return player_stat_data
          end  
        end      
      end
    end
  end  
end  
player_stats("Jeff Adrien")

def big_shoe_rebounds
  player_name = ""
  player_stat = ""
  shoe_max = 0
  shoe = nil
  rebounds = 0
  game_hash.each do | key, team_data |
    # key is home or away
      # team_attr is team name, colors, players
        team_data.each do | player, player_stat_data |
        # binding.pry
          if player == :players
            player_stat_data.each do | player_name, stat_cat |
              stat_cat.each do | stat_name, stat |
                if stat_name == :shoe && shoe = stat
                  # puts shoe
                  if shoe_max < shoe
                    shoe_max = shoe 
                  end
                end
                if stat_name == :rebounds
                  rebounds = stat  
                end
              end  
            end  
          end      
      end
  end  
  # shoe_max
  rebounds
  # returns
end
big_shoe_rebounds



