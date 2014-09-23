t <- c(1:7)
library(data.table)

## Price of dividends when there's 50% chance the world is good, 25% its hopeful, 25% its bad. Also r = 10%
price <- data.table(t)
price$good <- c(282.65, 290.91, 333.33, 400, 400, 400, 400)
price$hopeful <- c(282.65, 290.91, 333.33, 200, 200, 200, 200)
price$bad <- c(282.65, 290.91, 200, 200, 200, 200, 200)

## Let's compare the drop in the case of the hopeful-world state given the
##  probabilites of each world state presented in class on 9/11/2014.
##  Good = 1/3, Hopeful = 1/3, Bad = 1/3. Also r = 10%
price.original <- data.table(t)
price.original$good <- c(255.1, 260.61, 300, 400, 400, 400, 400)
price.original$hopeful <- c(255.1, 260.61, 300, 200, 200, 200, 200)
price.original$bad <- c(255.1, 260.61, 200, 200, 200, 200, 200)

## Next, let's take the same probabilties presented on 9/11, but instead of
##  a 10% interest rate, we will make it 9%
price.deltaR <- data.table(t)
price.deltaR$good <- c(290.72, 296.89, 333.33, 444.4, 444.4, 444.4, 444.4)
price.deltaR$hopeful <- c(290.72, 296.89, 333.33, 222.2, 222.2, 222.2, 222.2)
price.deltaR$bad <- c(290.72, 296.89, 222.22, 222.22, 222.22, 222.22, 222.2)

pdf("Price Plots.pdf")
with(price, plot(t, good, type="l", col="green",
                 main="Price With 50% Chance of Good World-State", sub="r = 10%",
                 xlab="Time", ylab="Price",
                 ylim=c(100, 400),
                 lty=1, lwd=3))
lines(price$t, price$hopeful, col="black", lty=2, lwd=3)
lines(price$t, price$bad, col="red2", lty=3, lwd=3)
legend(1,200, legend=c("Good World", "Hopeful World", "Bad World"),
       col=c("green", "black", "red2"), lty=1:3, lwd=3, cex=.5)

with(price.original, plot(t, good, type="l", col="dodgerblue",
                          main="Price With (1/3) Chance of Good World-State", sub="r = 10%",
                          xlab="Time", ylab="Price",
                          ylim=c(100, 400),
                          lty=1, lwd=3))
lines(price.original$t, price.original$hopeful, col="violet", lty=2, lwd=3)
lines(price.original$t, price.original$bad, col="firebrick", lty=3, lwd=3)
legend(1,200, legend=c("Good World", "Hopeful World", "Bad World"),
       col=c("dodgerblue", "violet", "firebrick"), lty=1:3, lwd=3, cex=.5)

with(price.deltaR, plot(t, good, type="l", col="darkred",
                        main="Price With (1/3) Chance of Good World-State", sub="r = 9%",
                        xlab="Time", ylab="Price",
                        ylim=c(100, 450),
                        lty=1, lwd=3))
lines(price.deltaR$t, price.deltaR$hopeful, col="mediumblue", lty=2, lwd=3)
lines(price.deltaR$t, price.deltaR$bad, col="seagreen", lty=3, lwd=3)
legend(1,200, legend=c("Good World", "Hopeful World", "Bad World"),
       col=c("darkred", "mediumblue", "seagreen"), lty=1:3, lwd=3, cex=.5)

plot(price$t, price$hopeful, type="l", col="turquoise",
     main="Price of Hopeful World-State Across Three Scenarios",
     xlab="Time", ylab="Price",
     ylim=c(100, 450),
     lty=1, lwd=3)
lines(price.original$t, price.original$hopeful, col="tomato", lty=2, lwd=3)
lines(price.deltaR$t, price.deltaR$hopeful, col="royalblue", lty=3, lwd=3)
legend(1,200, 
       legend=c("Hopeful, (1/4) Chance, r=10%", "Hopeful, (1/3) Chance, r=10%",
                "Hopeful, (1/3) Chance, r=9%"),
       col=c("turquoise", "tomato", "royalblue"), lty=1:3, lwd=3, cex=.5)
dev.off()