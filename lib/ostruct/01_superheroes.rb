

class Superhero

  attr_reader :name, :origin, :nemesis, :nick_name

  def initialize entry  
    @name = entry[0].delete('"').rstrip
    @origin = entry[1].delete('"').rstrip
    @nemesis = entry[2].delete('"').rstrip
    @nick_name = entry[3].delete('"').rstrip
  end

  def to_s
    "#{name},#{origin},#{nemesis},#{nick_name}"
  end
end  # Superhero


class Superheroes

  def self.collection_of
    const_get "Superhero"
  end

  attr_reader :entries

  def initialize file_name
    klass = self.class.collection_of
    @entries = File.readlines( file_name ).grep( %r{^\"} ).map do |line|
      klass.new( line.split(',') )
    end
  end
end  # Superheroes
 
 
