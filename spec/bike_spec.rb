require 'bike.rb'

describe Bike do
  it 'responds to method working?' do
    expect(Bike.new).to respond_to(:working?)
  end

  it 'checks that the bike is working' do
    faulty_bike = Bike.new
    faulty_bike.report_broken
    expect(faulty_bike.working?).to be false
  end

  it "can be reported as broken" do
    subject.report_broken
    expect(subject).to be_broken
  end
end
