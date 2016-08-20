require 'gosu'

require_relative 'game_window'
require_relative 'states/game_state'
require_relative 'states/menu_state'
require_relative 'entities/label'
require_relative 'entities/textbox'
require_relative 'utils'

require 'pry'

$window = GameWindow.new
GameState.switch(MenuState.instance)
$window.show
