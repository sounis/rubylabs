require 'open-uri'
require 'hpricot'
class BsuirGroup
  def initialize
    @lector_list = []
    @error = ErrorException.new  
    @error.eARGV(ARGV[0])
    @hp = Hpricot(open(BSUIR_LINK + ARGV[0]))
  end

  def page_parse
    @list = @hp.search(TABLE_LIST)
    @error.eLIST(@list)
    @list.each_with_index do |l, index|
      @lector_list[index] = l.inner_text
    end
    EXTRAPR.times { @lector_list.shift }
    EXTRALS.times { @lector_list.pop }
    @lector_list.uniq.sort!
  end
end
