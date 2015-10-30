Dir['./lib/*.rb'].each { |file| require_relative file }
Dir['./constants/*.rb'].each { |file| require_relative file }
begin
  fds = CommentsParse.new
  fds.parser
rescue
  puts "Error: #{$!.inspect}"
end
