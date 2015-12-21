gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypter'

class EncrypterTest < Minitest::Test

  def test_message_is_turned_into_number_alternative
     message = Encrypter.new([45, 94, 29, 76], "wint")
    assert_equal [22, 8, 13, 19], message.number_translate("wint")
  end

  def test_message_is_rotated
    #skip
    message = Encrypter.new([45, 94, 29, 76], "wint")
    assert_equal [67, 102, 42, 95] , message.rotate([45, 94, 29, 76], [22, 8, 13, 19] )
  end

  def test_modulo_is_found
    # skip
    message = Encrypter.new([45, 94, 29, 76], "wint")
    assert_equal [28, 24, 3, 17], message.find_modulo([67, 102, 42, 95])
  end

  def test_encrypted_message_is_output
  #  skip
   message = Encrypter.new([45, 94, 29, 76], "wint")
   assert_equal "2ydr", message.encrypt([28, 24, 3, 17])
  end

  def test_character_map_exists
    # skip
    message = Encrypter.new([45, 94, 29, 76], "wint")
    assert message.character_map
  end

  def test_character_map_is_accurate
    # skip
    message = Encrypter.new("39271", "301285")
    assert message.character_map
    assert_equal "a", message.character_map[0]
    assert_equal ",", message.character_map[38]
  end

  def test_crypto_functions_properly
    message = Encrypter.new([45, 94, 29, 76], "wint")
    assert_equal "2ydr", message.crypto
  end


end
