require 'pry'
require_relative 'key_generator'


class OffsetGenerator
  attr_accessor :random_key

  def initialize(random_key, date = todays_date)
    #how does it know where it gets random_key from?
    @random_key = random_key
    @date = date
  end

  def addition_manager
    @key_offsets = keys_to_abcd
    @date = todays_date
    @new_date = date_squared
    new_date = @new_date
    @date_offsets = date_becomes_abcd(new_date)
    date_offsets = @date_offsets
    key_offsets = @key_offsets
    @final_offsets = offsets_adder(date_offsets, key_offsets)
  end

  def keys_to_abcd
    #39271. a= 39 b=92 c=27 d=71
      # binding.pry
    @key_offsets = [
      (a_1 = @random_key[-5] + @random_key[-4]),
      (b_1 = @random_key[-4] + @random_key[-3]),
      (c_1 = @random_key[-3] + @random_key[-2]),
      (d_1 = @random_key[-2] + @random_key[-1]),
  ]
  end

  def todays_date
    @date = Time.new.strftime("%d%m%y")
  end

  def date_squared
    @new_date = (@date.to_i) **2
  end

  def date_becomes_abcd(new_date)
    #1225
    @date_offsets = [
      (a_2 = new_date.to_s[-4]),
      (b_2 = new_date.to_s[-3]),
      (c_2 = new_date.to_s[-2]),
      (d_2 = new_date.to_s[-1]),
    ]
  end

  def offsets_adder(date_offsets, key_offsets)
    @final_offsets = [
      (a_offset = (date_offsets[0].to_i + key_offsets[0].to_i)),
      (b_offset = (date_offsets[1].to_i + key_offsets[1].to_i)),
      (c_offset = (date_offsets[2].to_i + key_offsets[2].to_i)),
      (d_offset = (date_offsets[3].to_i + key_offsets[3].to_i)),
    ]
  end

end

# person = Enigma.new("Bob")
