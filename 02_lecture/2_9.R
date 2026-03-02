# Task 2.9

# Define the probabilities
# R handles fractions natively as floating point numbers
p_minus_2 <- 1/2
p_1 <- 1/3
p_3_incorrect <- 1/4

# a) Check if valid
total_prob <- p_minus_2 + p_1 + p_3_incorrect
is_valid <- total_prob == 1

cat("Part A:\n")
cat("Total probability is:", total_prob, "\n")
cat("Is it a valid distribution?", is_valid, "\n\n")

# b) Calculate the correct P(X=3)
p_3_correct <- 1 - (p_minus_2 + p_1)

cat("Part B:\n")
cat("The correct P(X=3) should be:", p_3_correct, "\n")
# In R, we can use the MASS package to print as a fraction if we want:
# MASS::fractions(p_3_correct) would output 1/6

# c) Distribution function mapping
# We can create a quick data frame to visualize the step function logic
cat("\nPart C: Distribution Function F(x) = P(X < x)\n")
cdf_table <- data.frame(
  Condition = c("x <= -2", "-2 < x <= 1", "1 < x <= 3", "x > 3"),
  F_x = c(0, 
          p_minus_2, 
          p_minus_2 + p_1, 
          1)
)
print(cdf_table)