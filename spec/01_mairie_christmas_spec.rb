require_relative '../lib/01_mairie_christmas'

describe "Test de la méthode qui va chercher une adresse email" do
	
	it "returns the right email of a city" do
		expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")).to eq("mairie.avernes@orange.fr")
	end

end

