require     'discogs'
require 'hashie'

wrapper = Discogs::Wrapper.new("Test OAuth", user_token: "VkofExTdgNkXXXrmGhTezgFKndQFZchMDeHgfVDV")

resultats = wrapper.search("Aquastep")

longueur = resultats.results.length
all_styles = []

for i in (1..longueur-1) do 
    unless resultats.results[i].style == nil
        all_styles.push(resultats.results[i].style[0])
        puts resultats.results[i].style[0].class
    end
end

most_used_genre_count = 0 
most_used_genre = ""

all_styles.each do |elt|
 combien = all_styles.count(elt)

    if combien > most_used_genre_count
        most_used_genre_count = combien
        most_used_genre = elt
    end 
    
end
puts "#{most_used_genre} apparait #{most_used_genre_count} fois" 

# all_styles.each do |elt|
#     puts all_styles.count(elt[0])
# end


