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
svet1 <- svet[svet$continent %in% c("Europe", "Africa", "South America", "North America", "Asia", "Oceania"),]
library(ggplot2)
library(scales)
######top10
#stolpicni diagram 10
zanr.imena <- colnames(top10)[5:24]
zanr.vrednosti <- apply(top10[zanr.imena], 2, sum)
zanr.vrednosti <- sort(zanr.vrednosti)
zanr.imena <- names(sort(zanr.vrednosti))
cairo_pdf("slike/stolpicni10.pdf",family="Arial")
barplot(zanr.vrednosti, names.arg = zanr.imena, xlab="ŽANRI", ylab="ŠTEVILO FILMOV", main="DISTRIBUCIJA ŽANROV ZA LETO 2010", las=2, cex.names=0.5, col="red")
dev.off()
#zemljevi 10
kraj <- table(top10$KRAJ)
stevilo <- unique(kraj)
stevilo <- stevilo[order(stevilo)]
barve <- rainbow(length(stevilo))[match(kraj, stevilo)]
names(barve) <- names(kraj)
barve.zemljevid <- barve[as.character(svet1$name_long)]
barve.zemljevid[is.na(barve.zemljevid)] <- "white"
imena <- names(kraj)
aa <- svet1[svet1$name_long %in% imena,]
koordinate <- coordinates(aa)
imena.krajev <- as.character(aa$name_long)
rownames(koordinate) <- imena.krajev
koordinate["Canada",2] <- koordinate["Canada",2]+5
koordinate["Canada",1] <- koordinate["Canada",1]-4
koordinate["United States",2] <- koordinate["United States",2]+4.5
koordinate["Jamaica",2] <- koordinate["Jamaica",2]+5
koordinate["Jamaica",1] <- koordinate["Jamaica",1]-2
koordinate["Puerto Rico",2] <- koordinate["Puerto Rico",2]+5
koordinate["Puerto Rico",1] <- koordinate["Puerto Rico",1]+8
koordinate["Colombia",2] <- koordinate["Colombia",2]+5
koordinate["Morocco",2] <- koordinate["Morocco",2]+5
koordinate["Spain",2] <- koordinate["Spain",2]+6
koordinate["Ireland",2] <- koordinate["Ireland",2]+7
koordinate["Ireland",1] <- koordinate["Ireland",1]-5
koordinate["England",2] <- koordinate["England",2]+8
koordinate["England",1] <- koordinate["England",1]+7
koordinate["Wales",2] <- koordinate["Wales",2]+4
koordinate["Germany",2] <- koordinate["Germany",2]+6
koordinate["Germany",1] <- koordinate["Germany",1]+6
koordinate["Italy",2] <- koordinate["Italy",2]+5
koordinate["Serbia",2] <- koordinate["Serbia",2]+5
koordinate["Serbia",1] <- koordinate["Serbia",1]+2
koordinate["Ethiopia",2] <- koordinate["Ethiopia",2]+5
koordinate["Russian Federation",2] <- koordinate["Russian Federation",2]+5
koordinate["China",2] <- koordinate["China",2]+5
koordinate["Indonesia",2] <- koordinate["Indonesia",2]+3
koordinate["Australia",2] <- koordinate["Australia",2]+5
cairo_pdf("slike/zemljevid10.pdf", family="Arial")
plot(svet1, col=barve.zemljevid, bg="lightyellow", border="orange", main="ZEMLJEVID ZA LETO 2010")
text(koordinate, labels=imena.krajev, pos=1, cex=0.4)
legend("bottomright", title="ŠTEVILO POSNETIH FILMOV V POSAMEZNI DRŽAVI:", bg="white", text.font=10, legend=stevilo, fill=rainbow(length(stevilo)))
dev.off()

#min/max + povprecje box office 
a <- top10$BOX.OFFICE
b <- a[a>0] 
min10 <- min(b)
max10 <- max(top10$BOX.OFFICE)
povprecje10 <- (sum(as.numeric(top10$BOX.OFFICE)))/100
#min/max + povprecje budget
aa <- top10$BUDGET
bb <- aa[aa>0] 
minb10 <- min(bb)
maxb10 <- max(top10$BUDGET)
povprecjeb10 <- (sum(as.numeric(top10$BUDGET)))/100


######top11
#stolpicni diagram 11
zanr.imena <- colnames(top11)[5:21]
zanr.vrednosti <- apply(top11[zanr.imena], 2, sum)
zanr.vrednosti <- sort(zanr.vrednosti)
zanr.imena <- names(sort(zanr.vrednosti))
cairo_pdf("slike/stolpicni11.pdf",family="Arial")
barplot(zanr.vrednosti, names.arg = zanr.imena, xlab="ŽANRI", ylab="ŠTEVILO FILMOV", main="DISTRIBUCIJA ŽANROV ZA LETO 2011", las=2, cex.names=0.5, col="green")
dev.off()
#zemljevid 11
kraj <- table(top11$KRAJ)
stevilo <- unique(kraj)
stevilo <- stevilo[order(stevilo)]
barve <- rainbow(length(stevilo))[match(kraj, stevilo)]
names(barve) <- names(kraj)
barve.zemljevid <- barve[as.character(svet1$name_long)]
barve.zemljevid[is.na(barve.zemljevid)] <- "white"
imena <- names(kraj)
aa <- svet1[svet1$name_long %in% imena,]
koordinate <- coordinates(aa)
imena.krajev <- as.character(aa$name_long)
rownames(koordinate) <- imena.krajev
koordinate["Canada",2] <- koordinate["Canada",2]+5
koordinate["Canada",1] <- koordinate["Canada",1]-4
koordinate["United States",2] <- koordinate["United States",2]+4.5
koordinate["Puerto Rico",2] <- koordinate["Puerto Rico",2]+5
koordinate["Puerto Rico",1] <- koordinate["Puerto Rico",1]+8
koordinate["Brazil",2] <- koordinate["Brazil",2]+6
koordinate["Spain",2] <- koordinate["Spain",2]+6
koordinate["France",2] <- koordinate["France",2]+6
koordinate["France",1] <- koordinate["France",1]-3
koordinate["Switzerland",2] <- koordinate["Switzerland",2]+5
koordinate["Switzerland",1] <- koordinate["Switzerland",1]+8
koordinate["England",2] <- koordinate["England",2]+8.5
koordinate["Norway",2] <- koordinate["Norway",2]+4
koordinate["Norway",1] <- koordinate["Norway",1]-8
koordinate["Sweden",2] <- koordinate["Sweden",2]+4
koordinate["Sweden",1] <- koordinate["Sweden",1]+4
koordinate["Germany",2] <- koordinate["Germany",2]+7
koordinate["Austria",2] <- koordinate["Austria",2]+7
koordinate["Austria",1] <- koordinate["Austria",1]+6
koordinate["Bulgaria",2] <- koordinate["Bulgaria",2]+6
koordinate["India",2] <- koordinate["India",2]+5
koordinate["Thailand",2] <- koordinate["Thailand",2]+6
koordinate["Indonesia",2] <- koordinate["Indonesia",2]+3
koordinate["Australia",2] <- koordinate["Australia",2]+5
koordinate["New Zealand",2] <- koordinate["New Zealand",2]+7.5
cairo_pdf("slike/zemljevid11.pdf", family="Arial")
plot(svet1, col=barve.zemljevid, bg="lightyellow", border="orange", main="ZEMLJEVID ZA LETO 2011")
text(koordinate, labels=imena.krajev, pos=1, cex=0.4)
legend("bottomright", title="ŠTEVILO POSNETIH FILMOV V POSAMEZNI DRŽAVI:", bg="white", text.font=10, legend=stevilo, fill=rainbow(length(stevilo)))
dev.off()
#min/max box + povprecje office
c <- top11$BOX.OFFICE
d <- c[c>0] 
min11 <- min(d)
max11 <- max(top11$BOX.OFFICE)
povprecje11 <- (sum(as.numeric(top11$BOX.OFFICE)))/100
#min/max + povprecje budget
cc <- top11$BUDGET
dd <- cc[cc>0] 
minb11 <- min(dd)
maxb11 <- max(top11$BUDGET)
povprecjeb11 <- (sum(as.numeric(top11$BUDGET)))/100


######top12
#stolpicni diagram 12
zanr.imena <- colnames(top12)[5:24]
zanr.vrednosti <- apply(top12[zanr.imena], 2, sum)
zanr.vrednosti <- sort(zanr.vrednosti)
zanr.imena <- names(sort(zanr.vrednosti))
cairo_pdf("slike/stolpicni12.pdf",family="Arial")
barplot(zanr.vrednosti, names.arg = zanr.imena, xlab="ŽANRI", ylab="ŠTEVILO FILMOV", main="DISTRIBUCIJA ŽANROV ZA LETO 2012", las=2, cex.names=0.5, col="orange")
dev.off()
#zemljevid 12
kraj <- table(top12$KRAJ)
stevilo <- unique(kraj)
stevilo <- stevilo[order(stevilo)]
barve <- rainbow(length(stevilo))[match(kraj, stevilo)]
names(barve) <- names(kraj)
barve.zemljevid <- barve[as.character(svet1$name_long)]
barve.zemljevid[is.na(barve.zemljevid)] <- "white"
imena <- names(kraj)
aa <- svet1[svet1$name_long %in% imena,]
koordinate <- coordinates(aa)
imena.krajev <- as.character(aa$name_long)
rownames(koordinate) <- imena.krajev
koordinate["Canada",2] <- koordinate["Canada",2]+5
koordinate["Canada",1] <- koordinate["Canada",1]-4
koordinate["United States",2] <- koordinate["United States",2]+4.5
koordinate["Brazil",2] <- koordinate["Brazil",2]+6
koordinate["Spain",2] <- koordinate["Spain",2]+6
koordinate["France",2] <- koordinate["France",2]+6
koordinate["Ireland",2] <- koordinate["Ireland",2]+7
koordinate["Ireland",1] <- koordinate["Ireland",1]-5
koordinate["England",2] <- koordinate["England",2]+7.5
koordinate["England",1] <- koordinate["England",1]+7
koordinate["Scotland",2] <- koordinate["Scotland",2]+7.5
koordinate["Denmark",2] <- koordinate["Denmark",2]+7
koordinate["Denmark",1] <- koordinate["Denmark",1]+5
koordinate["Georgia",2] <- koordinate["Georgia",2]+6.5
koordinate["Georgia",1] <- koordinate["Georgia",1]+6.5
koordinate["Turkey",2] <- koordinate["Turkey",2]+6.5
koordinate["India",2] <- koordinate["India",2]+5
koordinate["Thailand",2] <- koordinate["Thailand",2]+6
koordinate["China",2] <- koordinate["China",2]+5
koordinate["New Zealand",2] <- koordinate["New Zealand",2]+7.5
cairo_pdf("slike/zemljevid12.pdf", family="Arial")
plot(svet1, col=barve.zemljevid, bg="lightyellow", border="orange", main="ZEMLJEVID ZA LETO 2012")
text(koordinate, labels=imena.krajev, pos=1, cex=0.4)
legend("bottomright", title="ŠTEVILO POSNETIH FILMOV V POSAMEZNI DRŽAVI:", bg="white", text.font=10, legend=stevilo, fill=rainbow(length(stevilo)))
dev.off()
#min/max + povprecje box office
e <- top12$BOX.OFFICE
f <- e[e>0] 
min12 <- min(f)
max12 <- max(top12$BOX.OFFICE)
povprecje12 <- (sum(as.numeric(top12$BOX.OFFICE)))/100
#min/max + povprecje budget
ee <- top12$BUDGET
ff <- ee[ee>0] 
minb12 <- min(ff)
maxb12 <- max(top12$BUDGET)
povprecjeb12 <- (sum(as.numeric(top12$BUDGET)))/100


######top13
#stolpicni diagram 13
zanr.imena <- colnames(top13)[5:22]
zanr.vrednosti <- apply(top13[zanr.imena], 2, sum)
zanr.vrednosti <- sort(zanr.vrednosti)
zanr.imena <- names(sort(zanr.vrednosti))
cairo_pdf("slike/stolpicni13.pdf",family="Arial")
barplot(zanr.vrednosti, names.arg = zanr.imena, xlab="ŽANRI", ylab="ŠTEVILO FILMOV", main="DISTRIBUCIJA ŽANROV ZA LETO 2013", las=2, cex.names=0.5, col="yellow")
dev.off()
#zemljevid 13
kraj <- table(top13$KRAJ)
stevilo <- unique(kraj)
stevilo <- stevilo[order(stevilo)]
barve <- rainbow(length(stevilo))[match(kraj, stevilo)]
names(barve) <- names(kraj)
barve.zemljevid <- barve[as.character(svet1$name_long)]
barve.zemljevid[is.na(barve.zemljevid)] <- "white"
imena <- names(kraj)
aa <- svet1[svet1$name_long %in% imena,]
koordinate <- coordinates(aa)
imena.krajev <- as.character(aa$name_long)
rownames(koordinate) <- imena.krajev
koordinate["Canada",2] <- koordinate["Canada",2]+5
koordinate["Canada",1] <- koordinate["Canada",1]-4
koordinate["United States",2] <- koordinate["United States",2]+4.5
koordinate["Argentina",2] <- koordinate["Argentina",2]+5
koordinate["Bahamas",2] <- koordinate["Bahamas",2]+6
koordinate["Bahamas",1] <- koordinate["Bahamas",1]+9
koordinate["France",2] <- koordinate["France",2]+7
koordinate["France",1] <- koordinate["France",1]-4
koordinate["Northern Ireland",2] <- koordinate["Northern Ireland",2]+7.5
koordinate["Northern Ireland",1] <- koordinate["Northern Ireland",1]-14
koordinate["England",2] <- koordinate["England",2]+8.5
koordinate["England",1] <- koordinate["England",1]+6
koordinate["Scotland",2] <- koordinate["Scotland",2]+8
koordinate["Germany",2] <- koordinate["Germany",2]+6.5
koordinate["Germany",1] <- koordinate["Germany",1]-4.5
koordinate["Poland",2] <- koordinate["Poland",2]+7.5
koordinate["Poland",1] <- koordinate["Poland",1]+2
koordinate["Czech Republic",2] <- koordinate["Czech Republic",2]+6.5
koordinate["Czech Republic",1] <- koordinate["Czech Republic",1]+12
koordinate["Hungary",2] <- koordinate["Hungary",2]+6.5
koordinate["Hungary",1] <- koordinate["Hungary",1]-6
koordinate["Romania",2] <- koordinate["Romania",2]+6
koordinate["Romania",1] <- koordinate["Romania",1]+6
koordinate["Italy",2] <- koordinate["Italy",2]+6
koordinate["Australia",2] <- koordinate["Australia",2]+5
koordinate["New Zealand",2] <- koordinate["New Zealand",2]+7.5
cairo_pdf("slike/zemljevid13.pdf",family="Arial")
plot(svet1, col=barve.zemljevid, bg="lightyellow", border="orange", main="ZEMLJEVID ZA LETO 2013")
text(koordinate, labels=imena.krajev, pos=1, cex=0.4)
legend("bottomright", title="ŠTEVILO POSNETIH FILMOV V POSAMEZNI DRŽAVI:", bg="white", text.font=10, legend=stevilo, fill=rainbow(length(stevilo)))
dev.off()
#min/max + povprecje box office
g <- top13$BOX.OFFICE
h <- g[g>0] 
min13 <- min(h)
max13 <- max(top13$BOX.OFFICE)
povprecje13 <- (sum(as.numeric(top13$BOX.OFFICE)))/100
#min/max + povprecje budget
gg <- top13$BUDGET
hh <- gg[gg>0] 
minb13 <- min(hh)
maxb13 <- max(top13$BUDGET)
povprecjeb13 <- (sum(as.numeric(top13$BUDGET)))/100


######top14
#stolpicni diagram 14
zanr.imena <- colnames(top14)[5:24]
zanr.vrednosti <- apply(top14[zanr.imena], 2, sum)
zanr.vrednosti <- sort(zanr.vrednosti)
zanr.imena <- names(sort(zanr.vrednosti))
cairo_pdf("slike/stolpicni14.pdf",family="Arial")
barplot(zanr.vrednosti, names.arg = zanr.imena, xlab="ŽANRI", ylab="ŠTEVILO FILMOV", main="DISTRIBUCIJA ŽANROV ZA LETO 2014", las=2, cex.names=0.5, col="pink")
dev.off()
#zemljevid 14
kraj <- table(top14$KRAJ)
stevilo <- unique(kraj)
stevilo <- stevilo[order(stevilo)]
barve <- rainbow(length(stevilo))[match(kraj, stevilo)]
names(barve) <- names(kraj)
barve.zemljevid <- barve[as.character(svet1$name_long)]
barve.zemljevid[is.na(barve.zemljevid)] <- "white"
imena <- names(kraj)
aa <- svet1[svet1$name_long %in% imena,]
koordinate <- coordinates(aa)
imena.krajev <- as.character(aa$name_long)
rownames(koordinate) <- imena.krajev
koordinate["Canada",2] <- koordinate["Canada",2]+5
koordinate["Canada",1] <- koordinate["Canada",1]-4
koordinate["United States",2] <- koordinate["United States",2]+4.5
koordinate["Morocco",2] <- koordinate["Morocco",2]+5
koordinate["South Africa",2] <- koordinate["South Africa",2]+5
koordinate["Northern Ireland",2] <- koordinate["Northern Ireland",2]+7.5
koordinate["Northern Ireland",1] <- koordinate["Northern Ireland",1]-14.5
koordinate["England",2] <- koordinate["England",2]+6.6
koordinate["England",1] <- koordinate["England",1]-1
koordinate["Denmark",2] <- koordinate["Denmark",2]+7
koordinate["Denmark",1] <- koordinate["Denmark",1]+5
koordinate["Netherlands",2] <- koordinate["Netherlands",2]+7.6
koordinate["Netherlands",1] <- koordinate["Netherlands",1]+10.5
koordinate["Belgium",2] <- koordinate["Belgium",2]+5
koordinate["Belgium",1] <- koordinate["Belgium",1]+-5
koordinate["France",2] <- koordinate["France",2]+5.5
koordinate["Germany",2] <- koordinate["Germany",2]+5.5
koordinate["Germany",1] <- koordinate["Germany",1]+6
koordinate["Serbia",2] <- koordinate["Serbia",2]+8
koordinate["Bulgaria",2] <- koordinate["Bulgaria",2]+6
koordinate["Bulgaria",1] <- koordinate["Bulgaria",1]+5
koordinate["China",2] <- koordinate["China",2]+5
koordinate["Australia",2] <- koordinate["Australia",2]+5
koordinate["New Zealand",2] <- koordinate["New Zealand",2]+7.5
cairo_pdf("slike/zemljevid14.pdf", family="Arial")
plot(svet1, col=barve.zemljevid, bg="lightyellow", border="orange", main = "ZEMLJEVID ZA LETO 2014")
text(koordinate, labels=imena.krajev, pos=1, cex=0.4)
legend("bottomright", title="ŠTEVILO POSNETIH FILMOV V POSAMEZNI DRŽAVI:", bg="white", , text.font=8, legend=stevilo, fill=rainbow(length(stevilo)))
dev.off()
#min/max + povprecje box office
i <- top14$BOX.OFFICE
j <- i[i>0] 
min14 <- min(j)
max14 <- max(top14$BOX.OFFICE)
povprecje14 <- (sum(as.numeric(top14$BOX.OFFICE)))/100
#min/max + povprecje budget
ii <- top14$BUDGET
jj <- ii[ii>0] 
minb14 <- min(jj)
maxb14 <- max(top14$BUDGET)
povprecjeb14 <- (sum(as.numeric(top14$BUDGET)))/100


######filmi (top 100 vseh casov)
#min/max + povprecje box office
k <- filmi$BOX.OFFICE
l <- k[k>0] 
min100 <- min(l)
max100 <- max(filmi$BOX.OFFICE)
povprecje100 <- (sum(as.numeric(filmi$BOX.OFFICE)))/100
#min/max + povprecje budget
kk <- filmi$BUDGET
ll <- kk[kk>0] 
minb100 <- min(ll)
maxb100 <- max(filmi$BUDGET)
povprecjeb100 <- (sum(as.numeric(filmi$BUDGET)))/100


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
#maximum+minimum+povprecje box officev po letnicah
Letnice <- c(2010, 2011, 2012, 2013, 2014)
y1 <- c(max10, max11, max12, max13, max14)
y2 <- c(min10, min11, min12, min13, min14)
y3 <- c(povprecje10, povprecje11, povprecje12, povprecje13, povprecje14)
cairo_pdf("slike/box-office.pdf",family="Arial")
df <- data.frame(Letnice, y1, y2, y3)
ggplot(df, aes(Letnice, y = Vrednosti, color = Legenda)) + 
  geom_line(aes(y = y1, col = "maksimumi")) + 
  geom_line(aes(y = y2, col = "minimumi")) +
  geom_line(aes(y = y3, col = "povprečje")) +
  scale_y_log10(labels = trans_format('log10', math_format(10^.x)))
dev.off()
#maximum+minimum+povprecje budgetov po letnicah
Letnice <- c(2010, 2011, 2012, 2013, 2014)
y1 <- c(maxb10, maxb11, maxb12, maxb13, maxb14)
y2 <- c(minb10, minb11, minb12, minb13, minb14)
y3 <- c(povprecjeb10, povprecjeb11, povprecjeb12, povprecjeb13, povprecjeb14)
cairo_pdf("slike/budget.pdf",family="Arial")
df <- data.frame(Letnice, y1, y2, y3)
ggplot(df, aes(Letnice, y = Vrednosti, color = Legenda), title=) + 
  geom_line(aes(y = y1, col = "maksimumi")) + 
  geom_line(aes(y = y2, col = "minimumi")) +
  geom_line(aes(y = y3, col = "povprečje")) +
  scale_y_log10(labels = trans_format('log10', math_format(10^.x)))
dev.off()
#razmerje minimumov in maximumov - box office
razmerje.ime <- c("vseh casov", 2010, 2011, 2012, 2013, 2014)
razmerje.vrednosti <- c(r100, r10, r11, r12, r13, r14)
cairo_pdf("slike/razmerje-boxoffice.pdf",family="Arial")
barplot(razmerje.vrednosti, names.arg = razmerje.ime, xlab="LETNICE", ylab="RAZMERJE", main="RAZMERJE MED MAX IN MIN ZASLUŽKOM PO LETNICAH", cex.names=0.5, cex.axis=0.5, col=rainbow(6))
dev.off()
#razmerje minimumov in maximumov - budget
razmerje.ime <- c("vseh casov", 2010, 2011, 2012, 2013, 2014)
razmerje.vrednosti <- c(rb100, rb10, rb11, rb12, rb13, rb14)
cairo_pdf("slike/razmerje-budget.pdf", family="Arial")
barplot(razmerje.vrednosti, names.arg = razmerje.ime, xlab="LETNICE", ylab="RAZMERJE", main="RAZMERJE MED MAX IN MIN PRORAČUNOM PO LETNICAH", cex.names=0.5, cex.axis=0.5, col=rainbow(6))
dev.off()


