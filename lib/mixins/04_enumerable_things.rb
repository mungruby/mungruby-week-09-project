

require_relative '02_enhanced_things'


class Thingy
  # http://www.ruby-doc.org/core-1.9.3/Enumerable.html
  include Enumerable
end


class Thingies
  def each
    @all_things_great_and_small.each {|item| yield item}
  end

  # http://www.ruby-doc.org/core-1.9.3/Enumerable.html
  include Enumerable
end


if __FILE__ == $0

  things = Thingies.new

  t1 = Thingy.new
  things << t1 
  t1.name = "joy"
  t1.description = "not a thing - but behaves like one"
  #puts t1.inspect

  t2 = Thingy.new
  things << t2 
  t2.name = "Dog"
  t2.description = "an adorable puppy"
  # puts t2.inspect

  t3 = Thingy.new
  things << t3 
  t3.name = "Joy"
  t3.description = "a person"
  # puts t3.inspect

  things.sort.each {|thing| puts thing.map{|var| var.upcase}.join("...")}

end


