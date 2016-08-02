require 'minitest/autorun'

require 'unit'
require 'playfield'

class TestUnits < Minitest::Test

  # In addition in initializations, we need to place our test unit somewhere. Randomly seems fun!
  def setup
    @unit = Unit.new
    @playfield = Playfield.new
    @unit.random_teleport
  end

  # We want to make sure our unit can't move outside playfield
  # This method attempts to move unit outside of playfield in all directions, using teleportation to speed the process up!
  def test_unit_within_playfield
    @unit.place(@playfield.TOP)
    @unit.move(:up)
    asssert_equal @unit.location(:top), @playfield.TOP
    # We place the unit at the top of the playfield, try to move up, and should still be at the top of the playfield!
  end

  # Our unit can be recognized as 'not dead.'
  # This is achieved using the location method.
  def test_unit_not_dead
  end

  # However, a unit should be killed and removed from the playfield when its health reaches zero (or if it is just 'killed.')
  def test_unit_can_be_killed
  end

  # A unit needs to set off its death animation when it dies.
  # It can't just disappear from the playfield.
  # The moving unit sprite should be removed and the animation of it dying should be spawned in that location.
  def test_unit_plays_death_animation
  end

  # By invincible, we mean the hero doesn't even have a health value
  # There are no battles between heroes in real SG life!
  def test_hero_is_invincible
  end

  # However, nonheroes should have a health value and a recieve damage method.
  # The method should include any armor or temporary invincibility that the unit may undergo.
  def test_nonhero_is_vulnerable
  end
end
