require 'colorize'
require 'pry'
require 'nokogiri'
require 'open-uri'

# require_relative 'bin.rb'


    glossary = []

    url = 'https://ruby-doc.org/core-2.7.0/Regexp.html'
    webpage = URI.open(url)
    working_page = Nokogiri::HTML(webpage)
    symbolfacts = working_page.css('#description > ul > li').text
    list = symbolfacts.split(/\n/)
    list.each do |element|
        if element.include?(" -")
            symbol = Object.new
            name,definition = element.split(" -")
            @name = name
            @definition = definition
            symbol = {:name=>name, :definition=>definition}
            glossary << symbol
        end
    end
    learned =[]

    puts "Ready for your next regex? (y/n)".red
    response = gets.chomp
            while  response == "y"
                x = glossary.length
                xx = rand(1..x)
                new_exp = glossary[xx]
                puts""
                print new_exp[:name]
                print "  equals".cyan
                print new_exp[:definition]
                learned << new_exp
                puts ""
                puts "hit <enter> to continue".yellow
                continue = gets
                if continue  == "\n"
                    puts "would you like to learn another expression?".red
                    puts ""
                    response = gets.chomp
                    if response != "y"
                        # break
                    end
                end
            end
        puts "here is your progress so far:".light_magenta
        onlySymbols = []
        learned.each do |code|
            onlySymbols << code[:name]
            end
            print onlySymbols
        puts ""
        puts ""
        puts "hit <enter> to continue".yellow
        puts ""
        continue2 = gets
        if continue2  == "\n"
            puts "enter by number a symbol to review its definition, or press <p> to exit."
            review = gets.chomp
            end
            if review == ("p")
                print "Goodbye!".green.on_red
                puts""
                exit(0)
            else
                x =  review.to_i
                w=x-1
                y =onlySymbols[w]
                glossary.index do |example|
                    if  example[:name] == y
                        puts ""
                        puts "Definition:".red.on_yellow
                        print example
                    end
                end
                        puts ""
                        puts ""
                        sleep 8
                        puts ""
                        puts ""
                        puts "reset glossary? (y/n)".yellow
                        response = gets.chomp
                        if response == "y"
                            learned.clear
                            print "Goodbye!".green.on_yellow
                            puts ""
                            puts""
                        else
                            print "Goodbye!".red.on_yellow
                            puts ""
                            puts ""
                            exit(0)
                        end
            end
        #         end
        # end

        def reset
            @reset = reset
            learned.clear
            puts "Glossary is reset. Goodbye!".cyan.on_blue
            exit
        end
