def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"],  
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
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
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
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
  game_hash
  
end #game_hash

def get_player_stat_value(player_name, stat_value)
  
  game_hash.each do |location, team_data|
    #puts "team data = #{team_data}"
   
    team_data.each do |attribute, data|
        if attribute == :players
          #puts "attribute = #{attribute}"
          #puts "data = #{data}"
          data.each do |player, info|
            if player_name == player
               #puts "info = #{info}"
               info.each do |stats, value|
                 if stats == stat_value
                   #puts "stats = #{stats}"
                   #puts "value = #{value}"
                   return value
                 end
                end
            end
          end
        end
    
    end
  end  
  
end #get_player_stat_value

def num_points_scored(player_name)
  
  value = get_player_stat_value(player_name, :points)
  value
  
end #num_points_scored

def shoe_size(player_name)
 game_hash.each do |location, team_data|
    #puts "team data = #{team_data}"
   
    team_data.each do |attribute, data|
        if attribute == :players
          #puts "attribute = #{attribute}"
          #puts "data = #{data}"
          data.each do |player, info|
            if player_name == player
               #puts "info = #{info}"
               info.each do |stats, value|
                 if stats == :shoe
                   #puts "stats = #{stats}"
                   #puts "value = #{value}"
                   return value
                 end
                end
            end
          end
        end
    
    end
  end  
  
end #shoe_size

def team_colors(team_name)
  found = 0
  game_hash.each do |location, team_data|
    #puts "team data = #{team_data}"
    
     team_data.each do |attribute, data|
        if data == team_name
          found = 1
        end
        if attribute == :colors && found == 1
          #puts "attribute = #{attribute}"
          #puts "data = #{data}"
          return data
        end
    
      end
  end
end #team_colors

def team_names
  name_array = []
  game_hash.each do |location, team_data|
    #puts "team data = #{team_data}"
    
     team_data.each do |attribute, data|
        if attribute == :team_name
          name_array << data
        end
    
      end
  end
  name_array
end #team_names


def player_numbers(team_name)

number_array = []
 found = 0
 game_hash.each do |location, team_data|
    #puts "team data = #{team_data}"
   
    team_data.each do |attribute, data|

      if data == team_name
        #puts "team_name = #{team_name}"
        found = 1
      end
        if attribute == :players && found == 1
          #puts "attribute = #{attribute}"
          #puts "data = #{data}"
          data.each do |player, info|

               info.each do |stats, value|
                 if stats == :number
                   #puts "stats = #{stats}"
                   #puts "value = #{value}"
                   number_array << value
                 end
                end
          end
          found = 2
        end
    
    end
  end  
  number_array.sort   

end #player_numbers

def player_stats(player_name)

  game_hash.each do |location, team_data|
    #puts "team data = #{team_data}"
   
    team_data.each do |attribute, data|
        if attribute == :players
          #puts "attribute = #{attribute}"
          #puts "data = #{data}"
          data.each do |player, info|
            if player_name == player
               #puts "player = #{player}"
               #puts "info = #{info}"
               #puts "------------------------"
               return info
            end
          end
        end
    
    end
   end  
end #player_stats

def big_shoe_rebounds
 biggest_shoe = 0
 game_hash.each do |location, team_data|
    #puts "team data = #{team_data}"
   
    team_data.each do |attribute, data|
        if attribute == :players
          #puts "attribute = #{attribute}"
          #puts "data = #{data}"
          data.each do |player, info|
               #puts "info = #{info}"
               info.each do |stats, value|
                 if stats == :shoe
                   puts "shoe = #{value}"
                   if value > biggest_shoe
                     biggest_shoe = value
                     puts "biggest_shoe = #{biggest_shoe}"
                   end
                   #puts "stats = #{stats}"
                   #puts "value = #{value}"
                   
                 end
                end
          end
        end
    
    end
  end  


end #big_shoe_rebounds












