require 'colorize'
require 'open-uri'
require 'hpricot'
begin
  array = []
  url = 'http://www.bsuir.by/schedule/schedule.xhtml?id=' + ARGV[0]
  page = open(url)
  hp = Hpricot(page)
  list = hp.search("//tr[@class='ui-widget'],a")
  if list.size < 8
    raise 'Группа не найдена'
  end
  list.each_with_index do |l, index|
    array[index] = l.inner_text
  end
  3.times do array.shift end
  5.times do array.pop end
  array = array.uniq.sort
  puts array
  usr_list = []
  comnt_list = []
  listc= nil
  hash = []
  url2 = 'http://bsuir-helper.ru/lectors'
  page2 = open(url2)
  hp2 = Hpricot(page2)
  list2 = hp2.search('//div[@class="view view-lectors view-style-Нормальный view-id-lectors view-display-id-page_1"]')
  list2 = list2.search('//div')
  list2 = list2.search('//a')
  array.each_with_index do | current, index|
    list2.each_with_index do |curlis, ind|
      curlis = curlis.to_s       
      link = 'http://bsuir-helper.ru' + curlis.split('"')[1]
      name = curlis.split('>')[1]
      name = name.split[0] +"\s"+ name.split[1][0] + ".\s" + name.split[2][0] + '.'
      hash[ind] = { 'link' => link, 'name' => name } 
      if current == hash[ind]['name']
        puts hash[ind]['name'].red
        urlc = hash[ind]['link']
        pagec = open(urlc)
        hpc = Hpricot(pagec)
        listc = hpc.search('//div[@class="comment odd clear-block"]')
        usr = listc.search('//div[@class="submitted"]')
        coment = listc.search('//div[@class="content"]')
        usr.each_with_index do |user, index|
          user = user.inner_text.to_s
          user = user.delete("\n")
          usr_list[index] = user
        end
        coment.each_with_index do |comnt, index|
          comnt = comnt.inner_text.to_s
          comnt = comnt.delete("\n")
          comnt_list[index] = { 'user' => usr_list[index], 'comment' => comnt }
        end
      end
    end
    comnt_list.each do |current|
      puts current['user'].blue
      puts current['comment'].green
    end
    comnt_list = []
  end
rescue
  puts "Error: #{$!.inspect}"
end
