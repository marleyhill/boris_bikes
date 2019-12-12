require './lib/bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bike = []
  end

  def release_bike
    fail "No bikes available" if empty? or  bike.last.broken?
    # fail "No bikes available" if bike.last.broken?
    @bike.pop
  end

  def dock(bike)
    fail "Docking station full" if full?
    @bike << bike
  end

  private
  attr_reader :bike

  def full?
    @bike.count >= @capacity
  end

  def empty?
    @bike.empty?
  end
end
