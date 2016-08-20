require 'singleton'

DRAW_DELAY = 1000 # ms to wait between menu draws while idling.

class MenuState < GameState
  include Singleton
  attr_accessor :play_state

  def initialize
    @needs_redraw = true
    @objects = []
    @objects << Label.new("Galactic Strategy", v_offset: -100, lineheight: 100)
    @objects << Label.new("Login Username:", h_offset: -200, v_offset: 100)
    @objects << Label.new("Login Password:", h_offset: -200, v_offset: 200)
    @objects << TextBox.new(35, 275, h_offset: 30, v_offset: 100)
    @objects << TextBox.new(35, 275, h_offset: 30, v_offset: 200)
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
    @objects.each do |obj|
      obj.update
    end
    $window.caption = Gosu.fps
  end

  def draw
    @objects.each do |obj|
      obj.draw
    end
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
