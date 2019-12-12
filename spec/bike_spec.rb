require 'bike.rb'

describe Bike do
  it 'responds to method working?' do
    expect(Bike.new).to respond_to(:working?)
  end

  it 'checks that the bike is working' do
    expect(Bike.new.working?).to be true
  end

  it "can be reported as broken" do
    subject.report_broken
    expect(subject).to be_broken
  end
end
