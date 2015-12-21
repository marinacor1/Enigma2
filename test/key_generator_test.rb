gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def test_key_generator_is_random
    # skip
    key_array = KeyGenerator.new
    key_array2 = KeyGenerator.new
    key_array3 = KeyGenerator.new
    key_array4 = KeyGenerator.new
    refute key_array == key_array2
    refute key_array4 == key_array3
  end

  def test_key_generator_is_four_numbers_long
    # skip
    keys = KeyGenerator.new
    assert_equal 4, keys.random_keys.length
  end



end
