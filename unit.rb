class Unit
  attr_reader :location, :velocity, :orientation

  # We must create a unit with an initial location and orientation.
  # Locations are found in the @playfield object, because they will differ for playfields of different sizes and shapes.
  # Orientation also depends on the specific @playfield location, because if we create a new unit at a portal, for example, we want it to appear as though they've walked through the portal and be oriented with their backs toward it and front ready for battle.
  def initialize(location, orientation)
    @location = location
    @oritentation = orientation
  end
end
