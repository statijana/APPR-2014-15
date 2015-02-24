#stolpični diagram1
pdf("slike/stolpicni1.pdf",paper="a4")
tabela<-table(filmi$KRAJ)
imena<-names(tabela)
vektor<-c(tabela)
barplot(vektor, names.arg = imena, xlab="DRZAVE", ylab="STEVILO FILMOV PO DRZAVAH", main="STEVILO FILMOV POSNETIH V POSAMEZNI DRZAVI", las=2, cex.names=0.75, col="blue")
dev.off()

#stolpični diagram2
#1.način:
# zanr.vrednosti <- c(sum(filmi$crime)
#   ,sum(filmi$drama)
#   ,sum(filmi$biography)
#   ,sum(filmi$history)
#   ,sum(filmi$sport)
#   ,sum(filmi$romance)
#   ,sum(filmi$war)
#   ,sum(filmi$mystery)
#   ,sum(filmi$adventure)
#   ,sum(filmi$family)
#   ,sum(filmi$fantasy)
#   ,sum(filmi$horror)
#   ,sum(filmi$thriller)
#   ,sum(filmi$"film-noir")
#   ,sum(filmi$musical)
#   ,sum(filmi$action)
#   ,sum(filmi$"sci-fi")
#   ,sum(filmi$comedy)
#   ,sum(filmi$music)
#   ,sum(filmi$western))
# 
# zanr.imena <- c("crime", 
#                 "drama",
#                 "biography",
#                 "history",
#                 "sport",
#                 "romance",
#                 "war",
#                 "mystery",
#                 "adventure",
#                 "family",
#                 "fantasy",
#                 "horror",
#                 "thriller",
#                 "film-noir",
#                 "musical",
#                 "action",
#                 "sci-fi",
#                 "comedy",
#                 "music",
#                 "western")

#2.način:
zanr.imena <- colnames(filmi)[7:26] #v oglatih oklepajih je inerval stolpcev - za eno manj na obeh straneh
zanr.vrednosti <- apply(filmi[zanr.imena], 2, sum) #2 pomeni da so na x osi obrnjeni navpično, na y osi vodoravno
pdf("slike/stolpicni2.pdf",paper="a4")
barplot(zanr.vrednosti, names.arg = zanr.imena, xlab="ZANRI", ylab="STEVILO FILMOV", main="DISTRIBUCIJA ZANROV", las=2, cex.names=0.5, col="blue")
dev.off()

#stolpični diagram3
pdf("slike/stolpicni3.pdf",paper="a4")
hist(filmi$OCENA, breaks=5, xlab="OCENE FILMOV", ylab="STEVILO FILMOV", main="DISTRIBUCIJA FILMOV GLEDE NA OCENE", col="blue")
dev.off()

#stolpični diagram4
pdf("slike/stolpicni4.pdf",paper="a4")
hist(filmi$"LETNICA.NASTANKA", breaks=8, xlab="LETNICE NASTANKOV", ylab="STEVILO FILMOV", main="DISTRIBUCIJA FILMOV GLEDE LETNICE NASTANKA", col="blue")
dev.off()

# tortni diagram1
pdf("slike/tortni1.pdf",paper="a4")
pie(table(filmi$"STEVILO.NAGRAD" > 0), labels= c("NE","DA"), main="ALI JE FILM PREJEL VSAJ ENO NAGRADO?", col=topo.colors(2), radius = 1, cex = 0.5)
legend("bottomleft", title="STEVILO FILMOV:", bg="white", legend=table(filmi$"STEVILO.NAGRAD" > 0), fill=topo.colors(2),  text.font=2)
dev.off()

# tortni diagram2
filmi.indeksi <- match(filmi$KRAJ, svet$name_long)

filmi.okrajsave <- svet[filmi.indeksi,]$sov_a3
filmi.okrajsave <- droplevels(filmi.okrajsave)

filmi.dolgoIme <- svet[filmi.indeksi,]$name_long
filmi.dolgoIme <- droplevels(filmi.dolgoIme)

pdf("slike/tortni2.pdf",paper="a4")
pie(table(filmi.okrajsave), col= topo.colors(unique(filmi.okrajsave)), main="STEVILO FILMOV POSNETIH V POSAMEZNI DRZAVI", radius = 1, cex = 0.5)
legend("topleft", title="LEGENDA DRZAV:", bg="white", text.font=2, legend=levels(filmi.dolgoIme), fill=topo.colors(unique(filmi.dolgoIme)))
dev.off()

