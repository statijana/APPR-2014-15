#stolpični diagram1
cairo_pdf("slike/stolpicni1.pdf", family="Arial")
tabela<-table(filmi$KRAJ)
imena<-names(tabela)
vektor<-c(tabela)
barplot(vektor, names.arg = imena, xlab="DRŽAVE", ylab="ŠTEVILO FILMOV PO DRŽAVAH", main="ŠTEVILO FILMOV POSNETIH V POSAMEZNI DRŽAVI", las=2, cex.names=0.5, col="blue")
dev.off()

#stolpični diagram2
zanr.imena <- colnames(filmi)[7:26] #v oglatih oklepajih je inerval stolpcev - za eno manj na obeh straneh
zanr.vrednosti <- apply(filmi[zanr.imena], 2, sum) #2 pomeni da so na x osi obrnjeni navpično, na y osi vodoravno

zanr.vrednosti <- sort(zanr.vrednosti)
zanr.imena <- names(sort(zanr.vrednosti))

cairo_pdf("slike/stolpicni2.pdf", family="Arial")
barplot(zanr.vrednosti, names.arg = zanr.imena, xlab="ŽANRI", ylab="ŠTEVILO FILMOV", main="DISTRIBUCIJA ŽANROV", las=2, cex.names=0.5, col="blue")
dev.off()

#stolpični diagram3
cairo_pdf("slike/stolpicni3.pdf",family="Arial")
hist(filmi$OCENA, breaks=5, xlab="OCENE FILMOV", ylab="ŠTEVILO FILMOV", main="DISTRIBUCIJA FILMOV GLEDE NA OCENE", col="blue")
dev.off()

#stolpični diagram4
cairo_pdf("slike/stolpicni4.pdf",family="Arial")
hist(filmi$"LETNICA.NASTANKA", breaks=8, axes=F, xlab="LETNICE NASTANKOV", ylab="ŠTEVILO FILMOV", main="DISTRIBUCIJA FILMOV GLEDE LETNICE NASTANKA", col="blue")
axis(2)
axis(1, at=seq(1930, 2010, 10))
dev.off()

# tortni diagram1
cairo_pdf("slike/tortni1.pdf",family="Arial")
pie(table(filmi$"STEVILO.NAGRAD" > 0), labels=NA, main="ALI JE FILM PREJEL VSAJ ENO NAGRADO?", col=topo.colors(2), radius = 1)
text(-0.5,0, paste("DA"), col="black")
text(0.6, 0.2, paste("NE"), col="black")
legend("bottomleft", title="ŠTEVILO FILMOV:", bg="white", legend=table(filmi$"STEVILO.NAGRAD" > 0), fill=topo.colors(2),  text.font=2, cex=0.75)
dev.off()

# tortni diagram2
drzave <- sort(table(filmi$KRAJ))
imena.drzav <- names(drzave)
cairo_pdf("slike/tortni2.pdf",family="Arial")
pie(drzave, labels=NA, col= topo.colors(length(imena.drzav)), main="ŠTEVILO FILMOV POSNETIH V POSAMEZNI DRŽAVI", radius = 1)
legend("bottomleft", title="LEGENDA DRŽAV:", bg="white", text.font=1, cex=0.8, legend=imena.drzav, fill=topo.colors(length(imena.drzav)))
dev.off()
