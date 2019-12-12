require "docking_station.rb"

describe DockingStation do
  it 'responds to the method release bike' do
    expect(DockingStation.new).to respond_to(:release_bike)
  end

  it "has a default capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
  # it 'checks that release_bike methos creates a Bike class instance' do
  #   expect(DockingStation.new.release_bike).to be_a Bike
  # end

  it 'responds to docking a bike at the station method' do
    expect(DockingStation.new).to respond_to(:dock).with(1).argument
  end

  # it 'shows a bike at a docking station when not empty' do
  #   bike = Bike.new
  #   station = DockingStation.new
  #   # station.dock(bike)
  #   expect(station.bike).to eq bike
  # end
  describe "initialization" do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it "defaulrts capacity" do
      described_class::DEFAULT_CAPACITY.times { subject.dock bike}
      expect{ subject.dock(bike) }.to raise_error "Docking station full"
    end
  end

  describe '#release_bike' do
    let(:bike) { Bike.new }
    subject { DockingStation.new }
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
    it "does not release broken bikes" do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect{ subject.release_bike }.to raise_error "No bikes available"
    end
  end

  describe '#dock' do
    it 'raiases error when trying to dock in full station' do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error "Docking station full"
    end
    it 'has variable capacity' do
      station = DockingStation.new(40)
      40.times { station.dock Bike.new }
      expect{ station.dock Bike.new }.to raise_error "Docking station full"
    end
  end
end
