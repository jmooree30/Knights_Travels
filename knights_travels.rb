class Knight 
      attr_accessor :path, :x, :y, :moves
      def initialize(position, path = [])
        @path = path + [position]
        @x = position[0]
        @y = position[1]
        @moves = [
            [-1,-2],
            [-2,-1],
            [-2,+1],
            [-1,+2],
            [+1,-2],
            [+2,-1],
            [+2,+1],
            [+1,+2]]
    end

    def possible
      move_list = Array.new
      @moves.each do |moves| 
        x = @x + moves[0] 
        y = @y + moves[1]
          if x.between?(0,7)  
            if y.between?(0,7)
            move_list << [x,y]  
            end
          end 
      end 
       move_list
      end 

    end 

    def shortest_path(position,goal)
      paths = Array.new
      @start_knight = Knight.new(position)
        until
          @start_knight.x == goal[0] and
          @start_knight.y == goal[1]
          @start_knight.possible.each do |moves| 
            paths << Knight.new(moves,@start_knight.path)
          end
          shifted = paths.shift
          @start_knight = shifted
        end 
        counter = @start_knight.path.size 
          puts "You made it in #{counter} moves! Here's your path:\n"
            @start_knight.path.each do |path| print path end 
    end

    shortest_path([0,0],[7,7])
