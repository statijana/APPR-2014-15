# Analiza podatkov s programom R, 2014/15

Avtor: Tatijana Slijepčević

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2014/15.

## Tematika
Naslov mojega projekta se glasi Lestvica 100 najboljših filmov vseh časov. Uporabila bom lestvico filmov, ki jo je naredil uporabnik spletne strani IMDb (povezava: http://www.imdb.com/list/ls055592025/), saj je poleg ocene filmov upošteval še njihovo priljubljenost ter število nominacij in nagrad.

Filme bom med seboj primerjala po:
- zvrsti,
- letu nastanka,
- številu nominacij,
- številu nagrad,
- oceni filma, 
- državah, kje je bil posamezen film v večini posnet.

Zajela bom nominacije, ki so jih podelile organizacije oz. akademije The Oscars, The British Academy of Film and Television Arts (BAFTA) in The Golden Globe Award, ker so le-te najprestižnejše in najstarejše.  

Cilj projekta je ugotovitev:
- povprečne ocene filmov,
- v katerem desetljetju je nastalo največ filmov z lestvice,
- kateri žanr prevladuje,
- koliko filmov je prejelo eno izmed nagrad. 



## Program

Glavni program se nahaja v datoteki `projekt.r`. Ko ga poženemo, se izvedejo
programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Slike, ki jih program naredi, se shranijo v mapo
`slike/`. Zemljevidi v obliki SHP, ki jih program pobere, se shranijo v mapo
`zemljevid/`.

## Poročilo

Poročilo se nahaja v mapi `porocilo/`. Za izdelavo poročila v obliki PDF je
potrebno datoteko `porocilo/porocilo.tex` prevesti z LaTeXom. Pred tem je
potrebno pognati program, saj so v poročilu vključene slike iz mape `slike/`.
