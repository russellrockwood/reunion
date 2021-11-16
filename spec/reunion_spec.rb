require "./lib/activity"
require "./lib/reunion"

describe Reunion do
  before(:each) do
    @activity_1 = Activity.new('Brunch')
    @activity_1.add_participant("Luther", 40)
    @activity_1.add_participant('Maria', 20)

    @reunion = Reunion.new("1406 BE")
  end

  it 'exists' do
    expect(@reunion).to be_a(Reunion)
  end

  it 'has a name' do
    expect(@reunion.name).to eq("1406 BE")
  end

  it 'has activities' do
    expect(@reunion.activities).to be_a(Array)
  end

  it 'adds activities' do
    @reunion.add_activity(@activity_1)

    expect(@reunion.activities.count).to eq(1)
  end
end
