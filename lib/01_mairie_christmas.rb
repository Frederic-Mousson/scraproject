require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'rspec'

PAGE_URL = "http://annuaire-des-mairies.com/val-d-oise.html"
MAIRIE_URL = "https://www.annuaire-des-mairies.com/95/avernes.html"

def get_townhall_email(townhall_url)
	page_mairie = Nokogiri::HTML(open(townhall_url))
	email = page_mairie.xpath('//td[contains(text(),"@")]').text
	#binding.pry
	return email
end

puts "#{get_townhall_email(MAIRIE_URL)}"

def get_townhall_urls(dept_url)
	page_dpt = Nokogiri::HTML(open(dept_url))
	#binding.pry
	#tab_extensions = page_dpt.xpath('//p/a[contains(@href, "./95/")]')
	tab_extensions = page_dpt.xpath('//p/a/@href')
#	for i in 0...tab_extensions.length-1
#		tab_extensions[i] = "https://www.annuaire-des-mairies.com" + tab_extensions[i][1..tab_extensions[i].length-1]
#	end
	return tab_extensions
end

ext_list = get_townhall_urls(PAGE_URL)
puts "#{ext_list}"
puts "#{ext_list.length}"
puts ext_list.class

#def perform

#	page_mairie = Nokogiri::HTML(open(MAIRIE_URL))
#	email = get_townhall_email(page_mairie)
#	puts "#{email}"

#end

#perform