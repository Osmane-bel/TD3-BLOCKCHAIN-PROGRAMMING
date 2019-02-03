
install.packages("curl")
install.packages("jsonlite")
library(jsonlite)

#3 PAIRS 

pairETHUSD = fromJSON(txt = "https://api.kraken.com/0/public/Ticker?pair=ethusd")
pairUSDETC = fromJSON(txt = "https://api.kraken.com/0/public/Ticker?pair=etcusd")
pairETCETH = fromJSON(txt = "https://api.kraken.com/0/public/Ticker?pair=etceth")
 
# sens ETH -> USD -> ETC -> ETH
A1<-as.numeric((pairETHUSD$result$XETHZUSD$a[1]))
A<-A1 - A1*0.026
B1<-as.numeric((pairUSDETC$result$XETCZUSD$b[1]))
B<-B1-B1*0.026
C1<-as.numeric((pairETCETH$result$XETCXETH$a[1]))
C<-C1-C1*0.026


S1<-as.numeric(A*(1/B)*C)
G1<- (S1-1) * 100
if(S1 > 1)
{
  print("Il y'a une opportunité dans le sens ETH -> USD -> ETC -> ETH, VOUS gagnez (en %): ") 
  G1
} else {
  print("Il n'y a pas d'opportunité dans le sens ETH -> USD -> ETC -> ETH, vous perdez (en %): ") 
  G1
}



# sens ETH -> ETC -> USD -> ETH  

D1<-as.numeric((pairETCETH$result$XETCXETH$b[1]))
D<-D1-D1*0.026

E1<-as.numeric((pairUSDETC$result$XETCZUSD$a[1]))
E<-E1-E1*0.026
F1<-as.numeric((pairETHUSD$result$XETHZUSD$b[1]))
F<-F1 - F1*0.026

S2<-as.numeric(1/D*E*1/F)
G2<- (S2-1) * 100
if(S2 > 1)
{
  print("Il y'a une opportunité dans le sens ETH -> ETC -> USD -> ETH, VOUS gagnez (en %): ")
  G2
} else {
  print("Il n'y a pas d'opportunité dans le sens ETH -> ETC -> USD -> ETH, vous perdez (en %): ")
  G2
}



#4 PAIRS 
pairDASHEUR = fromJSON(txt = "https://api.kraken.com/0/public/Ticker?pair=dasheur")
pairEURETH = fromJSON(txt = "https://api.kraken.com/0/public/Ticker?pair=etheur")
pairETHXBT = fromJSON(txt = "https://api.kraken.com/0/public/Ticker?pair=ethxbt")
pairXBTDASH = fromJSON(txt = "https://api.kraken.com/0/public/Ticker?pair=dashxbt")

# sens DASH -> EUR -> ETH -> XBT -> DASH 
G1<-as.numeric((pairDASHEUR$result$DASHEUR$a[1]))
G<-G1 - G1*0.026
H1<-as.numeric((pairEURETH$result$XETHZEUR$b[1]))
H<-H1-H1*0.026
I1<-as.numeric((pairETHXBT$result$XETHXXBT$a[1]))
I<-I1-I1*0.026
J1<-as.numeric((pairXBTDASH$result$DASHXBT$b[1]))
J<-J1-J1*0.026

S3<-as.numeric(G*1/H*I*1/J)
G3<- (S3-1) * 100

if(S3 > 1)
{
  print("Il y'a une opportunité dans le sens DASH -> EUR -> ETH -> XBT -> DASH, VOUS gagnez (en %): ")
  G3
} else {
  print("Il n'y a pas d'opportunité dans le sens DASH -> EUR -> ETH -> XBT -> DASH, vous perdez (en %): ")
  G3
}


# sens DASH -> XBT -> ETH -> EUR -> DASH 
K1<-as.numeric((pairDASHEUR$result$DASHEUR$b[1]))
K<-K1 - K1*0.026
L1<-as.numeric((pairEURETH$result$XETHZEUR$a[1]))
L<-L1-L1*0.026
M1<-as.numeric((pairETHXBT$result$XETHXXBT$b[1]))
M<-M1-M1*0.026
N1<-as.numeric((pairXBTDASH$result$DASHXBT$a[1]))
N<-N1-N1*0.026

S4<-as.numeric(1/K*L*1/M*N)
G4<- (S4-1) * 100

if(S4 > 1)
{
  print("Il y'a une opportunité dans le sens DASH -> XBT -> ETH -> EUR -> DASH, VOUS gagnez (en %):  ")
  G4
} else {
  print("Il n'y a pas d'opportunité dans le sens DASH -> XBT -> ETH -> EUR -> DASH, vous perdez (en %): ")
  G4
}

