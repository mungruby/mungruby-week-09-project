

# require 'minitest/unit'
require 'minitest/autorun'
require 'stringio'
require_relative '../lib/ostruct/03_superheroes'

class SuperheroTest < MiniTest::Unit::TestCase

  # MiniTest::Unit.autorun

  heroes = ["Name,Origin,Nemesis,Nickname"]
  heroes << %q{"Batman","Gotham City","Joker","Caped Crusader"}
  heroes << %q{"Robin","Gotham City","Joker","Boy Wonder"}
  heroes << %q{"Superman","Krypton","Lex Luthor","Kal El"}
  heroes << %q{"Supergirl","Krypton","Bizzaro","Kara Zor-El"}

  @@superheroes = Superheroes.new( StringIO.new( heroes.join("\n") ))

  def setup
    @superhero = @@superheroes.first
  end

  def test_collection_type
    assert_equal Superhero, @@superheroes.class.collection_of
  end

  def test_member_class
    assert_equal Superhero, @superhero.class
  end

  def test_size
    assert_equal 4, @@superheroes.entries.size
  end

  def test_to_csv
    assert_equal "Batman,Gotham City,Joker,Caped Crusader", @superhero.to_csv
  end

  def test_defined_public_methods
    _methods = [:to_csv, :to_s, :name, :origin, :nemesis, :nickname]
    assert_equal _methods, @superhero.public_methods(false)
  end

  def teardown
    @superhero = nil
  end
end  # SuperheroTest

   
