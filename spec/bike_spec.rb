require 'bike.rb'

describe Bike do
  it 'responds to method working?' do
    expect(Bike.new).to respond_to(:working?)
  end

  it 'checks that the bike is working' do
    expect(Bike.new.working?).to be true
  end
end
