require 'curses'
require 'pry'
Dir["./constants/*.rb"].each {|file| require file }
Dir["./classes/*.rb"].each {|file| require file }

train = Train.new
max_size = train.max_train_length

Curses.init_screen
k = 0
begin
  0.upto(COLUMNS_COUNT+max_size) do |position|
    position.upto(COLUMNS_COUNT+max_size) do
       0.upto(TRAIN_HEIGTH) do |part_of_train|
        if train.showing_train?(position)
           Curses.setpos( train.correct_position( part_of_train ), COLUMNS_COUNT - position )
           Curses.addstr( train.correct_element_for_show( train, position, part_of_train ) )
        else
          Curses.setpos( train.correct_position( part_of_train ), 0 )
          Curses.addstr( train.correct_element_for_hide( train, position, part_of_train ) )
        end
      end
    end
    Curses.setpos(LINES_COUNT,0)
    sleep 0.01
    Curses.refresh
    Curses.clear
  end
ensure
    Curses.close_screen
end
