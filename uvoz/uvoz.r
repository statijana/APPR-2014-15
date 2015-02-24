# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
# uvoziDruzine <- function() {
#   return(read.table("podatki/druzine.csv", sep = ";", as.is = TRUE,
#                       row.names = 1,
#                       col.names = c("obcina", "en", "dva", "tri", "stiri"),
#                       fileEncoding = "Windows-1250",
#                       row.names=1))

# Funkcija, ki uvozi podatke iz datoteke podatki.csv
#uvoziFilme <- function() {
#   return(read.table("podatki/podatki.csv", sep = ";", as.is = TRUE,
#                       row.names = 1,
#                       col.names = c("NASLOVI FILMOVI", "OCENA", "LETNICA NASTANKA", "ZANR", "STEVILO NOMINACIJ", "STEVILO NAGRAD" ,"KRAJ"),
#                       fileEncoding = "Windows-1250"))
# }
uvoziFilme <- function() {
  return (read.csv2(file="podatki/filmi.csv", header=TRUE, sep=";", row.names=1))
}

uvoziFilme <- function() {
  return (read.csv2(file="podatki/filmi.csv", header=TRUE, sep=";", row.names=1))
}

uvoziTop10 <- function() {
  return (read.csv2(file="podatki/top100-10.csv", header=TRUE, sep=";", row.names=1))
}

uvoziTop11 <- function() {
  return (read.csv2(file="podatki/top100-11.csv", header=TRUE, sep=";", row.names=1))
}

uvoziTop12 <- function() {
  return (read.csv2(file="podatki/top100-12.csv", header=TRUE, sep=";", row.names=1))
}

uvoziTop13 <- function() {
  return (read.csv2(file="podatki/top100-13.csv", header=TRUE, sep=";", row.names=1))
}

uvoziTop14 <- function() {
  return (read.csv2(file="podatki/top100-14.csv", header=TRUE, sep=";", row.names=1))
}

# Zapišimo podatke v razpredelnico filmov.
cat("Uvažam podatke o filmih...\n")
filmi <- uvoziFilme()
top10 <- uvoziTop10()
top11 <- uvoziTop11()
top12 <- uvoziTop12()
top13 <- uvoziTop13()
top14 <- uvoziTop14()

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.

