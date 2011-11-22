

require_relative '02_enhanced_things'


class Thingy
  # http://www.ruby-doc.org/core-1.9.3/Comparable.html
  include Comparable
end


if __FILE__ == $0
  t1 = Thingy.new
  t1.name = "joy"
  t1.description = "not a thing - but behaves like one"

  t2 = Thingy.new
  t2.name = "Dog"
  t2.description = "an adorable puppy"

  t3 = Thingy.new
  t3.name = "Joy"
  t3.description = "a person"

  puts t1 > t2
  puts t1 >= t2
  puts

  puts t1 < t2
  puts t1 <= t2
  puts
   
  puts t1 == t3
  puts t2.between? t1, t3
  puts

  puts t1 === t3
  puts t1.eql? t3
  puts t1.equal? t3
  puts

end


