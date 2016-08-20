class TextBox
  def initialize(height, width, h_offset: 0, v_offset: 0)
    @height = height
    @width = width
    @h_offset = h_offset
    @v_offset = v_offset
  end

  def update
    if mouse_within_boundaries?
      binding.pry
      @draw_black
    end
  end

  def draw
    # Vertical distance has + offset and - lineheight
    Gosu.draw_rect(center_h, center_v - 5, @width, @height, Gosu::Color::GRAY)
    if @draw_black
      Gosu.draw_rect(center_h, center_v - 50, @width, @height, Gosu::Color::WHITE)
    end
  end

  private

  # horizontal centering
  def center_h
    $window.width / 2 - @width / 2 + @h_offset
  end

  def center_v
    $window.height / 2 - @height / 2 + @v_offset
  end

  def mouse_within_boundaries?
    x_within, y_within = false, false
    left_boundary = center_h
    right_boundary = center_h + @width
    horizontal_range = left_boundary..right_boundary
    top_boundary = center_v - 5
    bottom_boundary = center_v - 5 + @height
    vertical_range = top_boundary..bottom_boundary
    if horizontal_range.include?($window.mouse_x)
      x_within = true
    end
    if vertical_range.include?($window.mouse_y)
      y_within = true
    end
    x_within && y_within ? true : false
  end
end
