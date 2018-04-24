

  FINAL_ARRAY = [2, 3, 1, 1, 0, 4]

  def can_reach_end(index = 0)
    array_length = (FINAL_ARRAY.length - 1)
    if index == array_length
      return true
    end

    current_position_value = FINAL_ARRAY[index]
    if current_position_value + index >= array_length
      return true
    end

    while current_position_value > 0 do 
      value = can_reach_end(index + current_position_value)
      if value
        return true
      end
      current_position_value = current_position_value - 1
    end
    false

  end

  puts can_reach_end