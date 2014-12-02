# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke podatki.csv
#uvoziFilme <- function() {
#   return(read.table("podatki/podatki.csv", sep = ";", as.is = TRUE,
#                       row.names = 1,
#                       col.names = c("NASLOVI FILMOVI", "OCENA", "LETNICA NASTANKA", "ZANR", "STEVILO NOMINACIJ", "STEVILO NAGRAD" ,"KRAJ"),
#                       fileEncoding = "Windows-1250"))
# }
uvoziFilme <- function() {
  return (read.csv2(file="podatki/podatki.csv", header=TRUE, sep=";"))
}

# Zapišimo podatke v razpredelnico filmov.
cat("Uvažam podatke o filmih...\n")
filmi <- uvoziFilme()

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.

