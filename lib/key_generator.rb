require 'pry'

class KeyGenerator
 attr_accessor :random_key
  # def iniitialize
  #   @random_key = random_key
  # end

  def random_keys
    @random_key = []
    @a_1 = rand(1..9)
    @a_2 = rand(1..9)
    @a_3 = rand(1..9)
    @a_4 = rand(1..9)

    @random_key.push(@_1, @a_2, @a_3, @a_4)
  end
end
