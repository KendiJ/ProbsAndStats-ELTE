# Number of simulations
N <- 100000

# Simulate 100,000 rolls for each die
# The sample() function draws random numbers from a given range
d6 <- sample(1:6, N, replace = TRUE)
d20 <- sample(1:20, N, replace = TRUE)

# Scenario 1: 10-sided die where 0 is 10 (Standard D&D die, values 1 to 10)
d10_standard <- sample(1:10, N, replace = TRUE)

# Calculate Sum (X) and Product (Y) using R's vectorized math
X_standard <- d6 + d10_standard + d20
Y_standard <- d6 * d10_standard * d20

# Scenario 2: 10-sided die where 0 is literally 0 (values 0 to 9)
d10_alt <- sample(0:9, N, replace = TRUE)

X_alt <- d6 + d10_alt + d20
Y_alt <- d6 * d10_alt * d20

# --- Plotting the Distributions ---
# This opens a PNG graphics device to save our charts
png("task_2_8_plots.png", width=800, height=600)

# par(mfrow) splits the canvas into a 2x2 grid for our 4 plots
par(mfrow=c(2,2)) 

# Barplots for the sums (X)
# table() counts the frequency of each unique outcome
barplot(table(X_standard)/N, main="Sum (X) - Standard 10-sided", col="blue", border="white")
barplot(table(X_alt)/N, main="Sum (X_alt) - 0 is 0", col="lightblue", border="white")

# Histograms for the products (Y) 
# We use histograms here because products have too many unique values for a clean barplot
hist(Y_standard, main="Product (Y) - Standard", col="red", border="white", breaks=50)
hist(Y_alt, main="Product (Y_alt) - 0 is 0", col="pink", border="white", breaks=50)

# This closes the graphics device and actually saves the file
dev.off()

cat("Task 2.8 complete! Open task_2_8_plots.png in VS Code to see the distributions.\n")