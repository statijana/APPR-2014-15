# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
cat("Uvažam zemljevid...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_map_units.zip",
                        "svet", "ne_110m_admin_0_map_units.shp", mapa = "zemljevid",
                        encoding = "Windows-1252")
#podatki za zemljevid
kraj <- table(filmi$KRAJ)
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

rownames(koordinate) <- imena.krajev
koordinate["Canada",2] <- koordinate["Canada",2]+4
koordinate["United States",2] <- koordinate["United States",2]+4
koordinate["Guatemala",2] <- koordinate["Guatemala",2]+3
koordinate["England",2] <- koordinate["England",2]+3.5
koordinate["France",2] <- koordinate["France",2]+3.5
koordinate["Spain",2] <- koordinate["Spain",2]+4
koordinate["Morocco",2] <- koordinate["Morocco",2]+6
koordinate["Germany",2] <- koordinate["Germany",2]+5.5
koordinate["Czech Republic",2] <- koordinate["Czech Republic",2]+3.5
koordinate["Poland",2] <- koordinate["Poland",2]+4.5
koordinate["Austria",2] <- koordinate["Austria",2]+4
koordinate["Italy",2] <- koordinate["Italy",2]+4.5
koordinate["India",2] <- koordinate["India",2]+5
koordinate["Philippines",2] <- koordinate["Philippines",2]+3
koordinate["Sri Lanka",2] <- koordinate["Sri Lanka",2]+3.5
koordinate["New Zealand",2] <- koordinate["New Zealand",2]+2.5

#zemljevid shrani v pdf datoteko
pdf("slike/zemljevid.pdf", width=8.27, height=11.69)
plot(svet, col=barve.zemljevid, bg="lightyellow")
text(koordinate, labels=imena.krajev, pos=1, cex=0.25)
legend("top", title="STEVILO POSNETIH FILMOV V POSAMEZNI DRZAVI:", bg="white", text.font=2, legend=stevilo, fill=rainbow(length(stevilo)))
dev.off()

