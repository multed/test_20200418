namespace :abc do
  task :up_rates => :environment do

    begin
      doc = Nokogiri::XML(open("http://www.cbr.ru/scripts/XML_daily.asp"))
    rescue
    else
      doc.xpath("//Valute").each do |node|
        c_name = node.css('Name').text
        c_value = node.css('Value').text
        currency = Currency.find_by name: c_name
        if currency
          currency.rate = c_value
        else
          currency = Currency.new name: c_name, rate: c_value
        end
        currency.save!
      end
    end
  end
end