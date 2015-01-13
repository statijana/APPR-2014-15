#stolpični diagram1
pdf("slike/stolpicni1.pdf",paper="a4")
tabela<-table(filmi$KRAJ)
imena<-names(tabela)
vektor<-c(tabela)
barplot(vektor, names.arg = imena, xlab="DRZAVE", ylab="STEVILO FILMOV PO DRZAVAH", main="STEVILO FILMOV POSNETIH V POSAMEZNI DRZAVI", las=2, cex.names=0.75, col="blue")
dev.off()

#stolpični diagram2
zanr.vrednosti <- c(sum(filmi$crime)
  ,sum(filmi$drama)
  ,sum(filmi$biography)
  ,sum(filmi$history)
  ,sum(filmi$sport)
  ,sum(filmi$romance)
  ,sum(filmi$war)
  ,sum(filmi$mystery)
  ,sum(filmi$adventure)
  ,sum(filmi$family)
  ,sum(filmi$fantasy)
  ,sum(filmi$horror)
  ,sum(filmi$thriller)
  ,sum(filmi$"film-noir")
  ,sum(filmi$musical)
  ,sum(filmi$action)
  ,sum(filmi$"sci-fi")
  ,sum(filmi$comedy)
  ,sum(filmi$music)
  ,sum(filmi$western))

zanr.imena <- c("crime", 
                "drama",
                "biography",
                "history",
                "sport",
                "romance",
                "war",
                "mystery",
                "adventure",
                "family",
                "fantasy",
                "horror",
                "thriller",
                "film-noir",
                "musical",
                "action",
                "sci-fi",
                "comedy",
                "music",
                "western")
pdf("slike/stolpicni2.pdf",paper="a4")
barplot(zanr.vrednosti, names.arg = zanr.imena, xlab="ZANRI", ylab="STEVILO FILMOV, KI PRIPADAJO POSAMEZNEMO ZANRU", main="DISTRIBUCIJA ZANROV", las=2, cex.names=0.75, col="blue")
dev.off()

# tortni diagram
filmi.indeksi <- match(filmi$KRAJ, svet$name_long)

filmi.okrajsave <- svet[filmi.indeksi,]$sov_a3
filmi.okrajsave <- droplevels(filmi.okrajsave)

filmi.dolgoIme <- svet[filmi.indeksi,]$name_long
filmi.dolgoIme <- droplevels(filmi.dolgoIme)

pdf("slike/tortni.pdf",paper="a4")
tortni<-pie(table(filmi.okrajsave), col= topo.colors(unique(filmi.okrajsave)), main="STEVILO FILMOV POSNETIH V POSAMEZNI DRZAVI", radius = 1, cex = 0.5)
legend("topleft", title="OKRAJSAVE DRZAV:", bg="white", text.font=2, legend=levels(filmi.dolgoIme), fill=topo.colors(unique(filmi.dolgoIme)))
dev.off()

