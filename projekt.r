# 2. faza: Obdelava, uvoz in čiščenje podatkov
source("uvoz/uvoz.r")
#kličem kasneje, ker potrebujem najprej zemljevid sveta za graf
#source("slike/grafi.r", encoding="UTF-8") 

# 3. faza: Analiza in vizualizacija podatkov
source("vizualizacija/vizualizacija.r")
source("slike/grafi.r", encoding="UTF-8")

# 4. faza: Napredna analiza podatkov
#source("analiza/analiza.r")

cat("Končano.\n")