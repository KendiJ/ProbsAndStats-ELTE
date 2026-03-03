N <- 100000

# Define the prime numbers possible on a 20-sided die
primes <- c(2, 3, 5, 7, 11, 13, 17, 19)

# A function to simulate exactly ONE trial
simulate_trial <- function() {
  # Roll 10 20-sided dice
  rolls <- sample(1:20, 10, replace = TRUE)
  
  # Count how many of those rolls are in our primes list
  # %in% checks for matches, sum() counts the TRUE values
  prime_count <- sum(rolls %in% primes)
  
  # Find the highest roll
  max_roll <- max(rolls)
  
  # Return the product
  return(prime_count * max_roll)
}

cat("Simulating 100,000 trials. This might take 1 or 2 seconds...\n")

# replicate() runs our function N times and stores the results in a vector
X_results <- replicate(N, simulate_trial())

# --- Plotting the Distribution ---
png("task_2_10_plot.png", width=1000, height=500)

# Calculate the distribution (probabilities)
dist_X <- table(X_results) / N

# Plot it
barplot(dist_X, 
        main="Distribution of X (Prime Count * Max Roll)", 
        col="darkgreen", 
        border="white", 
        las=2,      # Rotates the x-axis labels to be vertical
        cex.names=0.7) # Shrinks the label text slightly to fit

dev.off()

cat("Task 2.10 complete! Open task_2_10_plot.png to see the distribution.\n")