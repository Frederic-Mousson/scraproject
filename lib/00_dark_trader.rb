require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'rspec'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"

#Si tu veux récupérer le lien ayant l'id email situé sous un titre h1 de classe primary
#page.xpath('//h1[@class="primary"]/a[@id="email"]').

#tab_code = page.css("a").select{|link| link['data-category'] == "news"}
#tab_code = page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[2]/div/div/a["currencie"]')
#tab_code = page.xpath('//tbody/tr[1]/td[2]/div/div/a')

# Me retourne 7 éléments du bas de la page
#tab_code = page.css("//div/div/a")  #.select{|link| class == "cmc-link"} #[@class="cmc-link"]")

#tab_code = page.xpath('//div[@class="cmc-table__column-name cmc-table__column-name--narrow-layout sc-1kxikfi-0 eTVhdN"]/div/a')

# Me retourne 602 éléments <a> de la page
#tab_code = page.xpath('//a[contains(@href, "/currencies/")]')

# Me retourne 200 éléments <a> de la page avec les noms les cryptomonnaies ..
#tab_code = page.xpath('//td/div/a')

#retourne les 200 div contenant les codes des cryptomonnaies

#puts tab_codes.class
#puts tab_codes.length
#puts "#{tab_codes}"
#puts ""
#puts tab_codes[0]
#puts tab_div[0].text


#puts tab_values.class
#puts tab_values.length
#puts "#{tab_values}"
#puts ""

#binding.pry

def tab_values_clean(tab_values)
	for i in 0...tab_values.length
		tab_values[i] = tab_values[i].delete "$,"
		tab_values[i] = tab_values[i].to_f
	end
	return tab_values
end


def crea_final_tab(noms,valeurs)
	tab = []
	for i in 0...noms.length
		tab[i] = {noms[i] => valeurs[i]}
	end
	return tab
end

def perform
	
	page = Nokogiri::HTML(open(PAGE_URL))

	tab_codes = page.xpath("//*[@class = 'cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol']/div").map {|div| div.text}
	tab_values_tmp = page.xpath("//*[@class = 'cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price']/a").map {|a| a.text}
	puts "===== Tableau de codes crypto : ====="
	puts "#{tab_codes}"
	puts ""
	puts "===== Tableau de valeurs brutes : ====="
	puts "#{tab_values_tmp}"
	puts ""
	puts "===== Tableau de valeurs nettoyées : ====="
	tab_values = tab_values_clean(tab_values_tmp)
	puts "#{tab_values}"
	puts ""
	puts "===== Tableau de hash final : ====="
	final_tab = crea_final_tab(tab_codes,tab_values)
	puts "#{final_tab}"
	puts ""
	
end

perform