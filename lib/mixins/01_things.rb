

# a thing
class Thingy
  attr_accessor :name, :description

  # note the lack of an initialize method
  # but we can still set and get instance variables
end


# a collection of things
class Thingies
  attr_reader :all_things_great_and_small

  # note the lack of an initialize method
  # but we can still set and get instance variables

  # a method for adding to this collection of things
  def << thing
    @all_things_great_and_small ||= []
    @all_things_great_and_small << thing
  end
end


if __FILE__ == $0
  t1 = Thingy.new
  t1.name = "joy"
  t1.description = "not a thing - but behaves like one"
  # puts t1.inspect

  t2 = Thingy.new
  t2.name = "pain"
  t2.description = "the pain is no thing"
  # puts t2.inspect

  things = Thingies.new
  things << t1 
  things << t2 
  # puts things.inspect

  begin
    # is the joy greater than the pain?
    puts t1 > t2
  rescue NoMethodError => e
    puts "The #{t1.name} just can't be compared with the #{t2.name}."
  end

  begin
    puts things.sort
  rescue NoMethodError => e
    e.message =~ %r{undefined method `(.+)'}
    puts "I'm just not the sort of thing that you can #{$1}!"
  end
end


