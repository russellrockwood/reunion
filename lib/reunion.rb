require "./lib/activity"
require 'pry'
class Reunion
  attr_reader :name, :activities
  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    activities << activity
  end

  def total_cost
    @activities.collect {|a| a.total_cost}.sum
  end

  def breakout
    debts_owed = Hash.new(0)
    @activities.each do |activity|
      activity.owed.each do |name, debt|
        debts_owed[name] += debt
      end
    end
    debts_owed
  end

  def summary
    debts_owed = breakout
    summary_statement = ''
    debts_owed.each do |name,debt|
      string = "#{name}: #{debt}\n"
      summary_statement.concat(string)
    end
    summary_statement.chomp
  end

end
