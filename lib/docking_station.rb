require './lib/bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail "No bikes available" if empty? or bikes.last.broken?
    # fail "No bikes available" if bike.last.broken?
    @bikes.pop
  end

  def dock(bike)
    fail "Docking station full" if full?
    if bike.broken?
      @bikes.unshift(bike)
    else
      @bikes << bike
    end
  end

  private
  attr_reader :bikes

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
