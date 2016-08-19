require 'singleton'

DRAW_DELAY = 1000 # ms to wait between menu draws while idling.

class MenuState < GameState
  include Singleton
  attr_accessor :play_state

  def initialize
    @needs_redraw = true
    @title = Gosu::Image.from_text(
      $window, "Galactic Strategy",
      Gosu.default_font_name, 100)
    @login = Gosu::Image.from_text(
      $window, "Login Username:", Gosu.default_font_name, 30)
    @login_pass = Gosu::Image.from_text(
      $window, "Login Password:", Gosu.default_font_name, 30)
    @textinput_login = Gosu::TextInput.new
    @textinput_password = Gosu::TextInput.new
  end

  def enter
    music.play(true)
    music.volume = 1
  end

  def leave
    music.volume = 0
    music.stop
  end

  def music
    @@music ||= Gosu::Song.new(
      $window, Utils.media_path('menu_music.wav'))
  end

  def update
    x = $window.mouse_x
    y = $window.mouse_y
    $window.caption = Gosu.fps
    text = "Mouse Coords: #{x},#{y}"
    @coord_info = Gosu::Image.from_text(
      $window, text, Gosu.default_font_name, 30)

  end

  def draw
    @title.draw(
      $window.width / 2 - @title.width / 2,
      $window.height / 2 - @title.height / 2 - 100,
      10)
    @coord_info.draw(
      $window.width / 2 - @coord_info.width / 2,
      $window.height / 2 - @coord_info.height / 2 + 100,
      10)
    @login.draw(
      $window.width / 2 - @login.width / 2 - 150,
      $window.height / 2 - @login.height / 2 + 250,
      10)
    @login_pass.draw(
      $window.width / 2 - @login_pass.width / 2 - 150,
      $window.height / 2 - @login_pass.height / 2 + 350,
      10)
    @last_draw_time = Gosu.milliseconds
  end

  def needs_redraw?
    @last_draw_time ||= Gosu.milliseconds
    if (Gosu.milliseconds - @last_draw_time) < DRAW_DELAY
      true
    else
      false
    end
  end


  def button_down(id)
    $window.close if id == Gosu::KbQ
  end

end
