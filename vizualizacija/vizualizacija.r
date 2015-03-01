# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
cat("Uvažam zemljevid...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_map_units.zip",
                        "svet", "ne_110m_admin_0_map_units.shp", mapa = "zemljevid",
                        encoding = "Windows-1252")
svet1 <- svet[svet$continent %in% c("Europe", "Africa", "South America", "North America", "Asia", "Oceania"),]
#podatki za zemljevid
kraj <- table(filmi$KRAJ)
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
koordinate["Guatemala",2] <- koordinate["Guatemala",2]+5
koordinate["Guatemala",1] <- koordinate["Guatemala",1]-7
koordinate["England",2] <- koordinate["England",2]+10.5
koordinate["England",1] <- koordinate["England",1]-1
koordinate["France",2] <- koordinate["France",2]+7.5
koordinate["France",1] <- koordinate["France",1]-2.5
koordinate["Spain",2] <- koordinate["Spain",2]+7
koordinate["Morocco",2] <- koordinate["Morocco",2]+8.5
koordinate["Germany",2] <- koordinate["Germany",2]+7
koordinate["Germany",1] <- koordinate["Germany",1]-7
koordinate["Czech Republic",2] <- koordinate["Czech Republic",2]+8
koordinate["Czech Republic",1] <- koordinate["Czech Republic",1]+16
koordinate["Poland",2] <- koordinate["Poland",2]+9.5
koordinate["Poland",1] <- koordinate["Poland",1]+4.5
koordinate["Austria",2] <- koordinate["Austria",2]+6.5
koordinate["Austria",1] <- koordinate["Austria",1]+7
koordinate["Italy",2] <- koordinate["Italy",2]+6
koordinate["India",2] <- koordinate["India",2]+5
koordinate["Philippines",2] <- koordinate["Philippines",2]+5
koordinate["Sri Lanka",2] <- koordinate["Sri Lanka",2]+5
koordinate["Sri Lanka",1] <- koordinate["Sri Lanka",1]+2
koordinate["New Zealand",2] <- koordinate["New Zealand",2]+7.5

#zemljevid shrani v pdf datoteko
cairo_pdf("slike/zemljevid.pdf", family="Arial")
plot(svet1, col=barve.zemljevid, bg="lightyellow", border="orange", main="ZEMLJEVID ZA 100 NAJBOLJŠIH FILMOV VSEH ČASOV")
text(koordinate, labels=imena.krajev, pos=1, cex=0.4)
legend("bottomright", title="ŠTEVILO POSNETIH FILMOV V POSAMEZNI DRŽAVI:", bg="white", text.font=10, legend=stevilo, fill=rainbow(length(stevilo)))
dev.off()

