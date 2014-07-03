require 'json'

class CountryConvert
  def initialize(input, countryfield)
    @input = JSON.parse(input)
    @countryfield = countryfield
    @isocodes = JSON.parse(File.read("isocodes.json"))
  end 

  def convert
    finaldata = Array.new
    @input.each do |f|
      if @isocodes[f[@countryfield].upcase]
        threeletter = @isocodes[f[@countryfield].upcase]
        f[@countryfield] = threeletter
        finaldata.push(f)
      end
    end
    return JSON.pretty_generate(finaldata)
  end
end

