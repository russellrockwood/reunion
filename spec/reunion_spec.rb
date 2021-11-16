require "./lib/activity"
require "./lib/reunion"

describe Reunion do
  before(:each) do
    @activity_1 = Activity.new('Brunch')
    @activity_2 = Activity.new("Drinks")

    @activity_1.add_participant('Maria', 20)
    @activity_1.add_participant("Luther", 40)

    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)

    @reunion = Reunion.new("1406 BE")
    @reunion.add_activity(@activity_1)
    @reunion.add_activity(@activity_2)
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
    expect(@reunion.activities.count).to eq(2)
  end

  it 'has a total cost' do
    expect(@reunion.total_cost).to eq(180)
  end

  it 'calculates money owed for all events' do
    expected = {
      "Maria" => -10,
      "Luther" => -30,
      "Louis" => 40
    }

    expect(@reunion.breakout).to eq(expected)
  end

  it 'returns debt summary' do
    expected = "Maria: -10\nLuther: -30\nLouis: 40"

    expect(@reunion.summary).to eq(expected)
  end
end
