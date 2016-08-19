# Wow so basically this class handles drawing but we set the coordinate system origin to the center of the screen and you have to do all positioning with offsets.
# Why? Because I'm evil.
class Label
  # text: string to be displayed
  # h_offset (OPTIONAL): Signed horizontal offset from center location
  # v_offset (OPTIONAL): Signed vertical offset from center location,
  # lineheight (OPTIONAL): Defaults to 30
  def initialize(text, h_offset: 0, v_offset: 0, lineheight: 30)
    @image = Gosu::Image.from_text($window,
      text, Gosu.default_font_name, lineheight)
    @h_offset = h_offset
    @v_offset = v_offset
  end

  def update
  end

  def draw
    @image.draw(center_horizontal + @h_offset,
     center_vertical + @v_offset, 10)
  end

  private

  def center_horizontal
    $window.width / 2 - @image.width / 2
  end

  def center_vertical
    $window.height / 2 - @image.height / 2
  end
end
