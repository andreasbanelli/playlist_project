
var fs = require('fs')

const getArtistTitle = require('get-artist-title')

var artists = "The Key (Wax Trax Mix) - Space Bunny | Surreal [1998], Coin coin Pata'tribe mix [Old School Tekno Tribe], Lil Louis 1992.09.25 @ Hacienda, Nicola Cruz | Saggitarian | www.klangextase.de, MARKO MARKOVICH - PIJEM WYSKI S KOKA KOLA !!!, Red Hot Chili Peppers - Californication [Official Music Video], Altın Gün - Goca Dünya, Ben Westbeech - Something For The Weekend - Lee Foss & Robert James Spirit Remix, Mézigue  - Tu Me Manques Mumu Change Pas Le Moteur (Kensous Mashup), Bag Raiders - Snake Charmer, Melatonin Man - My Head is a Tornado, Olga + Jozef - Untitled B3 - Olga+Jozef #06 EP - Olga+Jozef ‎– OJ 06, Spectral Emotions - Closer (Acid 1993), Hubz - Double Épaisseur, Belles Combo   Coeur a moin, The Maghreban   Revenge   feat  Rutendo Machiridza, RAINBOW TEAM - Bite the apple (1982), Mr Absolutt - Emergency (Boogie Monster EP), Gang Starr - Full Clip, Kasso - Walkman (Original Extended) 1982, 7'' Earl Sixteen   The Rastaman & Dub, Tkivilsaari - Eternality Of Soul., Mylo - Drop the Pressure (Original Mix), Booka Shade vs MANDY - body language, Heaven DJ Sammy - Feat Yanou & Do 2002"
var eachartist = artists.split(',')
var mon_array_dartistes = []
for (var artist of eachartist){
    if(getArtistTitle(artist)){
        console.log(getArtistTitle(artist)[0])
        mon_array_dartistes.push(getArtistTitle(artist)[0])
    }else{
        console.log('object undefined')
    }
}  
console.log(mon_array_dartistes)

var finalArtists = {}

for(var i=0;i<mon_array_dartistes.length;i++){
finalArtists[i] = mon_array_dartistes[i]
}
finalArtists=JSON.stringify(finalArtists)

fs.writeFile("./artists.json", finalArtists, function(err){
    if(err){
        console.log(err)
    }
})

console.log(finalArtists)