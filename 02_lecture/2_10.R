dice_dist <- function(n) {
  outcomes <- 1:n
  probs <- rep(1 / n, n)
  data.frame(Value = outcomes, Probability = probs)
}

dice_dist(4)
dice_dist(6)
dice_dist(8)
dice_dist(10)
dice_dist(20)

# print("--- Regular D20 Distribution ---")
# print(dice_dist(20))

values <- 1:6
probs <- ifelse(values %% 2 == 0, 2 / 9, 1 / 9)

data.frame(Value = values, Probability = probs)

colors <- c("Red", "Yellow", "Blue", "Green")
probs <- c(1 / 2, 1 / 6, 1 / 6, 1 / 6)

data.frame(Color = colors, Probability = probs)