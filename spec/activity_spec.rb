require "./lib/activity"

describe Activity do
  before(:each) do
    @activity = Activity.new('Brunch')
  end

  it 'exists' do
    expect(@activity).to be_a(Activity)
  end

  it 'has a name' do
    expect(@activity.name).to eq('Brunch')
  end

  it 'has participants' do
    @activity.add_participant('Maria', 20)

    expect(@activity.participants).to be_a(Hash)
    expect(@activity.participants.count).to eq(1)
  end

  it 'has a total cost' do
    @activity.add_participant("Luther", 40)
    @activity.add_participant('Maria', 20)

    expect(@activity.total_cost).to eq(60)
  end

  it 'splits total cost between participants' do
    @activity.add_participant("Luther", 40)
    @activity.add_participant('Maria', 20)

    expect(@activity.split).to eq(30)
  end

  it 'splits total cost between participants' do
    @activity.add_participant("Luther", 40)
    @activity.add_participant('Maria', 20)
    expected = {
      "Maria" => 10,
      "Luther" => -10
    }

    expect(@activity.owed).to eq(expected)
  end

end
