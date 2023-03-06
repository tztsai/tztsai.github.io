# Klassificering av Mobiltrafik och Multicellsbasstation Kontroll för Energieffektiv 5G-nätverk

**Författare:** Cai, Tianzhang

## Sammanfattning

Mobilnätens globala energiförbrukning ökar snabbt på grund av den exponentiella tillväxten av
mobilnätstrafik. Tillkomsten av nästa generations cellulära teknologier som 5G och framåt lovar
högre nätverksgenomströmning och lägre latens, men kräver också högre strömförbrukning för
dess tätare basstation (BS)-utbyggnad och mer energikrävande processorer. Det är en av de
viktigaste designpelarna i nästa generations mobilnät för att förbättra nätverkets energieffek-
tivitet. I det här examensarbetet syftar vi till att ta itu med detta problem genom att tillämpa
maskininlärning för att analysera mobiltrafik och styra driften av 5G BS:er med målet att
minska nätverkets energiförbrukning samtidigt som efterfrågan på nätverkstrafik dynamiskt
tillgodoses. För att få några preliminära insikter om de tidsmässiga och rumsliga mönstren
för mobilnätstrafik, analyserar vi först en verklig nätverksflödesdatauppsättning som samlats
in av en svensk mobiloperatör. Vi finner att mobiltrafik uppvisar en stark periodicitet i tid och
en distinkt lokalitet i rymden. För att utveckla en simuleringsmiljö för att träna och utvärdera
den AI-baserade BS-kontrollalgoritmen, tillämpar vi en klustringsalgoritm för att kategorisera
nätverkstrafiken med olika latenskrav i fem trafikscenarier, t.ex. stad, landsbygd och kontor.
Andra nödvändiga nätverksmodeller implementeras också, såsom energiförbrukning, massiv
MIMO-kanal, användarassociation, etc. i simuleringsmiljön som strävar efter att efterlikna det
verkliga 5G-nätverket.

Det huvudsakliga bidraget från denna avhandling är utvecklingen av en multi-agent förstärk-
ningsinlärningsalgoritm för att gemensamt styra driften av 5G BS:er som sömn på flera
nivåer, antennväxling och användarförening. Algoritmen är utformad för att minimera den
totala energiförbrukningen för ett flercells 5G-nätverk samtidigt som dess övergripande ser-
vicekvalitet (QoS) bevaras. Den tränade algoritmen har visat sin förmåga att adaptivt spara
energi genom att slå på/stänga av vilolägen och antenner för BS:er enligt den varierande
trafikintensiteten. Dessutom har multi-agent BS-kontrollpolicyn som produceras av algoritmen
också visat samverkansbeteenden såsom användaravlastning som minskar inter-cellinterferens
som försämrar QoS. Utvärderingsresultaten visar att den föreslagna algoritmen kan minska
den totala energiförbrukningen för ett nätverk med cirka 50%, dubbelt så stor som dagens
sovstrategi på symbolnivå (25%), jämfört med konfigurationen som alltid är på. försämring av
QoS. Algoritmen har också visat sig vara robust mot variationer i volymen och QoS-kravet för
nätverkstrafiken efter att ha utvärderats i olika trafikscenarier.
