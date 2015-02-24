# 4. faza: Analiza podatkov

# Uvozimo funkcijo za uvoz spletne strani.
# source("lib/xml.r")

# Preberemo spletno stran v razpredelnico.
# cat("Uvažam spletno stran...\n")
# tabela <- preuredi(uvozi.obcine(), obcine)

# Narišemo graf v datoteko PDF.
# cat("Rišem graf...\n")
# pdf("slike/naselja.pdf", width=6, height=4)
# plot(tabela[[1]], tabela[[4]],
#      main = "Število naselij glede na površino občine",
#      xlab = "Površina (km^2)",
#      ylab = "Št. naselij")
# dev.off()

# Uvozimo zemljevid
cat("Uvažam zemljevid...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_map_units.zip",
                        "svet", "ne_110m_admin_0_map_units.shp", mapa = "zemljevid",
                        encoding = "Windows-1252")

######top10
#stolpicni diagram 10
zanr.imena <- colnames(top10)[5:24]
zanr.vrednosti <- apply(top10[zanr.imena], 2, sum)
pdf("slike/stolpicni10.pdf",paper="a4")
barplot(zanr.vrednosti, names.arg = zanr.imena, xlab="ZANRI", ylab="STEVILO FILMOV", main="DISTRIBUCIJA ZANROV ZA LETO 2010", las=2, cex.names=0.5, col="red")
dev.off()
#zemljevi 10
kraj <- table(top10$KRAJ)
stevilo <- unique(kraj)
stevilo <- stevilo[order(stevilo)]
barve <- rainbow(length(stevilo))[match(kraj, stevilo)]
names(barve) <- names(kraj)
barve.zemljevid <- barve[as.character(svet$name_long)]
barve.zemljevid[is.na(barve.zemljevid)] <- "white"
imena <- names(kraj)
aa <- svet[svet$name_long %in% imena,]
koordinate <- coordinates(aa)
imena.krajev <- as.character(aa$name_long)
pdf("slike/zemljevid10.pdf", width=8.27, height=11.69)
plot(svet, col=barve.zemljevid, bg="lightyellow", border="orange")
text(koordinate, labels=imena.krajev, pos=1, cex=0.4)
legend("top", title="STEVILO POSNETIH FILMOV V POSAMEZNI DRZAVI:", bg="white", text.font=10, legend=stevilo, fill=rainbow(length(stevilo)))
dev.off()
#min/max box office
a <- top10$BOX.OFFICE
b <- a[a>0] 
min10 <- min(b)
max10 <- max(top10$BOX.OFFICE)
#min/max budget
aa <- top10$BUDGET
bb <- aa[aa>0] 
minb10 <- min(bb)
maxb10 <- max(top10$BUDGET)


######top11
#stolpicni diagram 11
zanr.imena <- colnames(top11)[5:21]
zanr.vrednosti <- apply(top11[zanr.imena], 2, sum)
pdf("slike/stolpicni11.pdf",paper="a4")
barplot(zanr.vrednosti, names.arg = zanr.imena, xlab="ZANRI", ylab="STEVILO FILMOV", main="DISTRIBUCIJA ZANROV ZA LETO 2011", las=2, cex.names=0.5, col="green")
dev.off()
#zemljevid 11
kraj <- table(top11$KRAJ)
stevilo <- unique(kraj)
stevilo <- stevilo[order(stevilo)]
barve <- rainbow(length(stevilo))[match(kraj, stevilo)]
names(barve) <- names(kraj)
barve.zemljevid <- barve[as.character(svet$name_long)]
barve.zemljevid[is.na(barve.zemljevid)] <- "white"
imena <- names(kraj)
aa <- svet[svet$name_long %in% imena,]
koordinate <- coordinates(aa)
imena.krajev <- as.character(aa$name_long)
pdf("slike/zemljevid11.pdf", width=8.27, height=11.69)
plot(svet, col=barve.zemljevid, bg="lightyellow", border="orange")
text(koordinate, labels=imena.krajev, pos=1, cex=0.4)
legend("top", title="STEVILO POSNETIH FILMOV V POSAMEZNI DRZAVI:", bg="white", text.font=10, legend=stevilo, fill=rainbow(length(stevilo)))
dev.off()
#min/max box office
c <- top11$BOX.OFFICE
d <- c[c>0] 
min11 <- min(d)
max11 <- max(top11$BOX.OFFICE)
#min/max budget
cc <- top11$BUDGET
dd <- cc[cc>0] 
minb11 <- min(dd)
maxb11 <- max(top11$BUDGET)


######top12
#stolpicni diagram 12
zanr.imena <- colnames(top12)[5:24]
zanr.vrednosti <- apply(top12[zanr.imena], 2, sum)
pdf("slike/stolpicni12.pdf",paper="a4")
barplot(zanr.vrednosti, names.arg = zanr.imena, xlab="ZANRI", ylab="STEVILO FILMOV", main="DISTRIBUCIJA ZANROV ZA LETO 2012", las=2, cex.names=0.5, col="orange")
dev.off()
#zemljevid 12
kraj <- table(top12$KRAJ)
stevilo <- unique(kraj)
stevilo <- stevilo[order(stevilo)]
barve <- rainbow(length(stevilo))[match(kraj, stevilo)]
names(barve) <- names(kraj)
barve.zemljevid <- barve[as.character(svet$name_long)]
barve.zemljevid[is.na(barve.zemljevid)] <- "white"
imena <- names(kraj)
aa <- svet[svet$name_long %in% imena,]
koordinate <- coordinates(aa)
imena.krajev <- as.character(aa$name_long)
pdf("slike/zemljevid12.pdf", width=8.27, height=11.69)
plot(svet, col=barve.zemljevid, bg="lightyellow", border="orange")
text(koordinate, labels=imena.krajev, pos=1, cex=0.4)
legend("top", title="STEVILO POSNETIH FILMOV V POSAMEZNI DRZAVI:", bg="white", text.font=10, legend=stevilo, fill=rainbow(length(stevilo)))
dev.off()
#min/max box office
e <- top12$BOX.OFFICE
f <- e[e>0] 
min12 <- min(f)
max12 <- max(top12$BOX.OFFICE)
#min/max budget
ee <- top12$BUDGET
ff <- ee[ee>0] 
minb12 <- min(ff)
maxb12 <- max(top12$BUDGET)


######top13
#stolpicni diagram 13
zanr.imena <- colnames(top13)[5:22]
zanr.vrednosti <- apply(top13[zanr.imena], 2, sum)
pdf("slike/stolpicni13.pdf",paper="a4")
barplot(zanr.vrednosti, names.arg = zanr.imena, xlab="ZANRI", ylab="STEVILO FILMOV", main="DISTRIBUCIJA ZANROV ZA LETO 2013", las=2, cex.names=0.5, col="yellow")
dev.off()
#zemljevid 13
kraj <- table(top13$KRAJ)
stevilo <- unique(kraj)
stevilo <- stevilo[order(stevilo)]
barve <- rainbow(length(stevilo))[match(kraj, stevilo)]
names(barve) <- names(kraj)
barve.zemljevid <- barve[as.character(svet$name_long)]
barve.zemljevid[is.na(barve.zemljevid)] <- "white"
imena <- names(kraj)
aa <- svet[svet$name_long %in% imena,]
koordinate <- coordinates(aa)
imena.krajev <- as.character(aa$name_long)
pdf("slike/zemljevid13.pdf", width=8.27, height=11.69)
plot(svet, col=barve.zemljevid, bg="lightyellow", border="orange")
text(koordinate, labels=imena.krajev, pos=1, cex=0.4)
legend("top", title="STEVILO POSNETIH FILMOV V POSAMEZNI DRZAVI:", bg="white", text.font=10, legend=stevilo, fill=rainbow(length(stevilo)))
dev.off()
#min/max box office
g <- top13$BOX.OFFICE
h <- g[g>0] 
min13 <- min(h)
max13 <- max(top13$BOX.OFFICE)
#min/max budget
gg <- top13$BUDGET
hh <- gg[gg>0] 
minb13 <- min(hh)
maxb13 <- max(top13$BUDGET)


######top14
#stolpicni diagram 14
zanr.imena <- colnames(top14)[5:24]
zanr.vrednosti <- apply(top14[zanr.imena], 2, sum)
pdf("slike/stolpicni14.pdf",paper="a4")
barplot(zanr.vrednosti, names.arg = zanr.imena, xlab="ZANRI", ylab="STEVILO FILMOV", main="DISTRIBUCIJA ZANROV ZA LETO 2014", las=2, cex.names=0.5, col="pink")
dev.off()
#zemljevid 14
kraj <- table(top14$KRAJ)
stevilo <- unique(kraj)
stevilo <- stevilo[order(stevilo)]
barve <- rainbow(length(stevilo))[match(kraj, stevilo)]
names(barve) <- names(kraj)
barve.zemljevid <- barve[as.character(svet$name_long)]
barve.zemljevid[is.na(barve.zemljevid)] <- "white"
imena <- names(kraj)
aa <- svet[svet$name_long %in% imena,]
koordinate <- coordinates(aa)
imena.krajev <- as.character(aa$name_long)
pdf("slike/zemljevid14.pdf", width=8.27, height=11.69)
plot(svet, col=barve.zemljevid, bg="lightyellow", border="orange")
text(koordinate, labels=imena.krajev, pos=1, cex=0.4)
legend("top", title="STEVILO POSNETIH FILMOV V POSAMEZNI DRZAVI:", bg="white", text.font=10, legend=stevilo, fill=rainbow(length(stevilo)))
dev.off()
#min/max box office
i <- top14$BOX.OFFICE
j <- i[i>0] 
min14 <- min(j)
max14 <- max(top14$BOX.OFFICE)
#min/max budget
ii <- top14$BUDGET
jj <- ii[ii>0] 
minb14 <- min(jj)
maxb14 <- max(top14$BUDGET)


######filmi (top 100 vseh casov)
#min/max box office
k <- filmi$BOX.OFFICE
l <- k[k>0] 
min100 <- min(l)
max100 <- max(filmi$BOX.OFFICE)
#min/max budget
kk <- filmi$BUDGET
ll <- kk[kk>0] 
minb100 <- min(ll)
maxb100 <- max(filmi$BUDGET)


######skupne primerjave
#min/max box office
min <- min(min100, min10, min11, min12, min13, min14)
max <- max(max100, max10, max11, max12, max13, max14)
#razmerje box office-a med maximumom in minimumom po letnicah
r100 <- (max100/min100)
r10 <- (max10/min10)
r11 <- (max11/min11)
r12 <- (max12/min12)
r13 <- (max13/min13)
r14 <- (max14/min14)
#min/max budget
minb <- min(minb100, minb10, minb11, minb12, minb13, minb14)
maxb <- max(maxb100, maxb10, maxb11, maxb12, maxb13, maxb14)
#razmerje budget-a med maximumom in minimumom po letnicah
rb100 <- (maxb100/minb100)
rb10 <- (maxb10/minb10)
rb11 <- (maxb11/minb11)
rb12 <- (maxb12/minb12)
rb13 <- (maxb13/minb13)
rb14 <- (maxb14/minb14)
##grafi
#maximum box officev po letnicah
letnice.ime <- c("vseh casov", 2010, 2011, 2012, 2013, 2014)
letnice.vrednosti <- c(max100, max10, max11, max12, max13, max14)
pdf("slike/max-box-office.pdf",paper="a4")
barplot(letnice.vrednosti, names.arg = letnice.ime, xlab="LETNICE", ylab="MAKSIMALNI ZASLUZEK", main="MAKSIMALEN ZASLUZEK PO LETNICAH", cex.names=0.5, cex.axis=0.5, col=rainbow(6)) #če ni las=2, pomeni, da so na x osi vrednosti obrnjene vodoravno, na y osi pa navpično
dev.off()
#minimum box officev po letnicah
letnice.ime <- c("vseh casov", 2010, 2011, 2012, 2013, 2014)
letnice.vrednosti <- c(min100, min10, min11, min12, min13, min14)
pdf("slike/min-box-office.pdf",paper="a4")
barplot(letnice.vrednosti, names.arg = letnice.ime, xlab="LETNICE", ylab="MINIMALNI ZASLUZEK", main="MINIMALNI ZASLUZEK PO LETNICAH", cex.names=0.5, cex.axis=0.5, col=rainbow(6)) 
dev.off()
#razmerje minimumov in maximumov - box office
razmerje.ime <- c("vseh casov", 2010, 2011, 2012, 2013, 2014)
razmerje.vrednosti <- c(r100, r10, r11, r12, r13, r14)
pdf("slike/razmerje-boxoffice.pdf",paper="a4")
barplot(razmerje.vrednosti, names.arg = razmerje.ime, xlab="LETNICE", ylab="RAZMERJE", main="RAZMERJE MED MAX IN MIN ZASLUZKOM PO LETNICAH", cex.names=0.5, cex.axis=0.5, col=rainbow(6))
dev.off()
#maximum budgetov po letnicah
letnice.ime <- c("vseh casov", 2010, 2011, 2012, 2013, 2014)
letnice.vrednosti <- c(maxb100, maxb10, maxb11, maxb12, maxb13, maxb14)
pdf("slike/max-budget.pdf",paper="a4")
barplot(letnice.vrednosti, names.arg = letnice.ime, xlab="LETNICE", ylab="MAKSIMALNI PRORACUN", main="MAKSIMALEN PRORACUN PO LETNICAH", cex.names=0.5, cex.axis=0.5, col=rainbow(6)) 
dev.off()
#minimum budgetov po letnicah
letnice.ime <- c("vseh casov", 2010, 2011, 2012, 2013, 2014)
letnice.vrednosti <- c(minb100, minb10, minb11, minb12, minb13, minb14)
pdf("slike/min-budget.pdf",paper="a4")
barplot(letnice.vrednosti, names.arg = letnice.ime, xlab="LETNICE", ylab="MINIMALNI PRORACUN", main="MINIMALNI PRORACUN PO LETNICAH", cex.names=0.5, cex.axis=0.5, col=rainbow(6)) 
dev.off()
#razmerje minimumov in maximumov - budget
razmerje.ime <- c("vseh casov", 2010, 2011, 2012, 2013, 2014)
razmerje.vrednosti <- c(rb100, rb10, rb11, rb12, rb13, rb14)
pdf("slike/razmerje-budget.pdf",paper="a4")
barplot(razmerje.vrednosti, names.arg = razmerje.ime, xlab="LETNICE", ylab="RAZMERJE", main="RAZMERJE MED MAX IN MIN PRORACUNOM PO LETNICAH", cex.names=0.5, cex.axis=0.5, col=rainbow(6))
dev.off()