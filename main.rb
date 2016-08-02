require 'gosu'

require_relative 'game_window'
require_relative 'states/game_state'
require_relative 'states/menu_state'
require_relative 'utils'

$window = GameWindow.new
GameState.switch(MenuState.instance)
$window.show
