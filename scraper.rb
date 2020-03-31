require 'nokogiri'
require 'pry'
require 'open-uri'
require 'httparty'


    @@glossary = []

    def scraper
        url = 'https://ruby-doc.org/core-2.7.0/Regexp.html'
        webpage = HTTParty.get(url)
        working_page = Nokogiri::HTML(webpage)
        symbolfacts = working_page.css('#description > ul > li').text
        list = symbolfacts.split(/\n/).reject(&:empty?)
        listings = []
        list.each do |element|
            if element.include?(" - ")
                symbol = Object.new
                name, definition = element.split(" - ")
                symbol = {:name => name, :definition => definition}
                @@glossary << symbol
            end
        end
        binding.pry
    end
scraper

