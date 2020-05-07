require_relative '../lib/00_dark_trader'

describe "Method tests to get cryptomonnaie and their values from a website" do
	tab_values = ["$9,806.00", "$213.65", "$0.219710", "$1.01"]
	tab_codes = ["BTC", "ETH", "XRP", "USDT"]

	it "tests the values cleaning, removing '$' and ','" do
		expect(tab_values_clean(tab_values)).to eq([9806.0, 213.65, 0.21971, 1.01])
	end

	it "tests the merging of codes and values in the same array" do
		expect(crea_final_tab(tab_codes,tab_values)).to eq([{"BTC"=>9806.0}, {"ETH"=>213.65}, {"XRP"=>0.21971}, {"USDT"=>1.01}])
	end

end