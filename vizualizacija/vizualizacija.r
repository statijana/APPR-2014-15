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
barve <- topo.colors(length(stevilo))[match(kraj, stevilo)]
names(barve) <- names(kraj)
barve.zemljevid <- barve[as.character(svet$name_long)]
barve.zemljevid[is.na(barve.zemljevid)] <- "white"

#zemljevid shrani v pdf datoteko
pdf("slike/zemljevid.pdf", width=8.27, height=11.69)
plot(svet, col=barve.zemljevid, bg="lightyellow")
legend("top", title="STEVILO POSNETIH FILMOV V POSAMEZNI DRZAVI:", bg="white", text.font=2, legend=stevilo, fill=topo.colors(length(stevilo)))
dev.off()

