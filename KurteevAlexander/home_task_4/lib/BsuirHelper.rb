require 'open-uri'
require 'hpricot'
class BsuirHelper
  def initialize
    @lectors_list_bh = []
    @page = open(BSUIR_HELPER_LECTORS_LINK)
    @hp = Hpricot(@page)
    @list = nil
  end
  def lectors_list
    @list = @hp.search(LECTORS_TABLE)
    @list.each_with_index do |curlis, ind|
      curlis = curlis.to_s 
      parse_lector_name(curlis,ind)
    end
    @lectors_list_bh
  end
  def parse_lector_name(current_string,index)     
    @link = BSUIR_HELPER_LINK + current_string.split('"')[1]
    @name = current_string.split('>')[1]
    @name = @name.split[0] +"\s"+ @name.split[1][0] + ".\s" + @name.split[2][0] + '.'
    @lectors_list_bh[index] = { 'link' => @link, 'name' => @name }
  end
end
