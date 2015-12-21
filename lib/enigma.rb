require_relative 'encrypter'
require_relative 'offset_generator'
require_relative 'key_generator'
require_relative 'encrypter'



  message_file           = ARGV[0]
  encrypted_file         = ARGV[1]
  message                = File.read(message_file)
  random_key             = KeyGenerator.new.random_keys
  date                   = Time.now.strftime("%d%m%y")
  final_offsets          = OffsetGenerator.new(random_key, date).addition_manager
  encrypted_message      = Encrypter.new(final_offsets, message).crypto
  File.write(message_file, encrypted_file)
  puts "Created #{encrypted_file.inspect} with the #{date} and #{random_key}"
