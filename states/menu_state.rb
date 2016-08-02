require 'singleton'

class MenuState < GameState
  include Singleton
  attr_accessor :play_state

  def initialize
    @message = Gosu::Image.from_text(
      $window, "Galactic Strategy",
      Gosu.default_font_name, 100)
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
    text = "We need some buttons here for login/options/exit"
    @info = Gosu::Image.from_text(
      $window, text, Gosu.default_font_name, 30)
  end

  def draw
    @message.draw(
      $window.width / 2 - @message.width / 2,
      $window.height / 2 - @message.height / 2,
      10)
    @info.draw(
      $window.width / 2 - @info.width / 2,
      $window.height / 2 - @info.height / 2 + 200,
      10)
  end

  def button_down(id)
    $window.close if id == Gosu::KbQ
  end
end
