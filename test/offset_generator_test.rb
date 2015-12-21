gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/offset_generator'

class OffsetGeneratorTest < Minitest::Test

  #TODO how to initialize variables for refactoring in test

  def test_keys_turn_to_abcd_format
    # skip
    message = OffsetGenerator.new("39271", "301285")
    array = message.keys_to_abcd
    assert_equal 4, array.length
  end

  def test_a_key_is_accurate
    #39271. a= 39 b=92 c=27 d=71
    # skip
    message = OffsetGenerator.new("39271", "301285")
    array = message.keys_to_abcd
    assert_equal "39", array[0]
  end

  def test_b_key_is_accurate
    # skip
    message = OffsetGenerator.new("39271", "301285")
    array = message.keys_to_abcd
    assert_equal "92", array[1]
  end

  def test_c_key_is_accurate
    # skip
    message = OffsetGenerator.new("39271", "301285")
    array = message.keys_to_abcd
    assert_equal "27", array[2]
  end

  def test_d_key_is_accurate
    # skip
    message = OffsetGenerator.new("39271", "301285")
    array = message.keys_to_abcd
    assert_equal "71", array[3]
  end

  def test_date_has_6_digits
    # skip
    message = OffsetGenerator.new("39271", "301285")
    assert_equal 6, message.todays_date.length
  end

  def test_date_is_squared
    # skip
    message = OffsetGenerator.new("39271", "301285")
    assert_equal 90772651225, message.date_squared
  end

  def test_date_has_accurate_abcd_format
    #1225
    # skip
    message = OffsetGenerator.new("39271", "301285")
    offset = message.date_becomes_abcd(90772651225)
    assert_equal "1", offset[0]
    assert_equal "2", offset[1]
    assert_equal "2", offset[2]
    assert_equal "5", offset[3]

  end

  def test_a_offsets_created_using_sum_of_date_and_key
    # skip
    message = OffsetGenerator.new("39271", "301285")
    message = message.offsets_adder(["6", "2", "2", "5"], ["39", "92", "27", "71"])
    assert_equal 45, message[0]
    assert_equal 94, message[1]
    assert_equal 29, message[2]
    assert_equal 76, message[3]
  end

  def test_addition_manager_works_properly
    message = OffsetGenerator.new("39271", "301285")
    assert_equal [45, 94, 29, 76], message.addition_manager
  end


end
