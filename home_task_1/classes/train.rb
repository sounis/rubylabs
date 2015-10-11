class Train
  attr_accessor :parts, :max_size

  def initialize
    @parts = [].push(FIRST_TRAIN_STATE, SECOND_TRAIN_STATE, THIRD_TRAIN_STATE, SECOND_TRAIN_STATE)
    @max_size = 0
  end

  def max_train_length
    @parts.each do |train_part|
      @max_size = train_part.map(&:length).max
    end
    @max_size
  end

  def showing_train?(position)
    COLUMNS_COUNT > position
  end

  def correct_position(part_of_train)
    part_of_train + ( ( LINES_COUNT / 2 ) - 8 )
  end

  def correct_element_for_show(train, position, part_of_train)
    train.parts[ position % TRAIN_PARTS_COUNT ][ part_of_train ][ 0..position ].to_s
  end

  def correct_element_for_hide(train, position, part_of_train)
    train.parts[ position % TRAIN_PARTS_COUNT ][ part_of_train ][ position - COLUMNS_COUNT..FIRST_TRAIN_STATE[ part_of_train ].size ].to_s
  end
end
