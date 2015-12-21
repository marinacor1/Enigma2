require_relative 'enigma'
require_relative 'key_generator'
require_relative 'offset_generator'
require 'pry'


class Encrypter
  attr_reader :character_map

  def initialize(final_offsets, message)
   @message = message
  end

  def crypto
    #do you pass in final_offsets and message here?
    @number_array = number_translate(message)
    @rotation = rotate(final_offsets, number_array)
    @encryption_array = find_modulo(rotation)
    encryption = encrypt(@encryption_array)
  end

  def character_map
    @character_map = ('a'..'z').to_a + ('0'..'9').to_a + [" ", '.', ',']
  end

  def number_translate(message)
    @character_map = ('a'..'z').to_a + ('0'..'9').to_a + [" ", '.', ',']
    message_array = @message.split("")
    @number_array = message_array.map do |letter|
    @character_map.index(letter)
    end
  end
#number_array = [22, 8, 13, 19] number correlation
  def rotate(final_offsets, number_array)
    @rotation = [final_offsets, number_array].transpose.map { |number| number.reduce(:+)}
  end

  def find_modulo(rotation)
     @encryption_array = rotation.map do |number|
     number%39
     end
  end

   def encrypt(encryption_array)
     @character_map = ('a'..'z').to_a + ('0'..'9').to_a + [" ", '.', ',']
     encryption = encryption_array.map do |x|
     @character_map[x]
     end
     encryption = encryption.join("")
     encryption
   end

end
