

require_relative '01_things'


# Ruby has open classes
# Open the class and define the <=> method
# <=> is also known as the spaceship operator
# Open the class and define the each method
#
class Thingy

  # <=>
  # return 0 if objects should be considered equal
  # return 1 if this object should be considered to be greater than the object being passed in for comparison
  # return -1 if this object should be considered to be less than the object being passed in for comparison
  #
  def <=> other_thingy
    # self.name <=> other_thingy.name
    # just a reminder that when comparing Strings, case matters
    self.name.downcase <=> other_thingy.name.downcase
  end


  def each
    self.instance_variables.each { |instance_variable| yield instance_variable_get instance_variable }
  end
end


if __FILE__ == $0
  t1 = Thingy.new
  t1.name = "joy"
  t1.description = "not a thing - but behaves like one"
  # puts t1.inspect

  t2 = Thingy.new
  t2.name = "Dog"
  # t2.name = "pain"
  t2.description = "an adorable puppy"
  # puts t2.inspect

  t3 = Thingy.new
  t3.name = "Joy"
  t3.description = "a person"
  # puts t3.inspect

  puts t1 <=> t2   # => 1
  puts t2 <=> t1   # => -1
  puts t1 <=> t3   # => 0
  puts

  t1.each {|attr| puts attr}

end


