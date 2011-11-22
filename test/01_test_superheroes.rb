

# require 'minitest/unit'
require 'minitest/autorun'
require_relative '../lib/ostruct/01_superheroes'

class SuperheroTest < MiniTest::Unit::TestCase

  # MiniTest::Unit.autorun

  TEST_FILE = './fixtures/superheroes.csv'
  @@superheroes = Superheroes.new(TEST_FILE)

  def setup
    @superhero = @@superheroes.entries.first
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

  def test_to_s
    assert_equal "Batman,Gotham City,Joker,Caped Crusader", @superhero.to_s
  end

  def test_defined_public_methods
    _methods = [:name, :origin, :nemesis, :nick_name, :to_s]
    assert_equal _methods, @superhero.public_methods(false)
  end

  def teardown
    @superhero = nil
  end
end  # SuperheroTest

   
