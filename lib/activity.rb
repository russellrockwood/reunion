require 'pry';
class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, amount_paid)
    @participants[name] = amount_paid
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost / participants.count
  end

  def owed
    money_owed = Hash.new
    @participants.each { |name,spent|  money_owed[name] = split - spent}
    money_owed
  end
end
