Dir['./lib/*.rb'].each { |file| require_relative file }
Dir['./constants/*.rb'].each { |file| require_relative file }
begin
  searchcomments = CommentsParse.new
  searchcomments.parser
rescue
  puts "Error: #{$!.inspect}"
end
