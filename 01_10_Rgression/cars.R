data(cars)

head(cars)

model <- lm(dist ~ speed, data = cars)
summary(model)

plot(cars$speed, cars$dist, 
     main = "Stopping Distance vs. Speed",
     xlab = "Speed (mph)", 
     ylab = "Stopping Distance (ft)",
     pch = 19, col = "blue")

abline(model, col = "red", lwd = 2)

mtcars$cy1

mtcars$mcp