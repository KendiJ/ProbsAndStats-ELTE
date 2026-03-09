
N <- 100000


p_unfair <- c(0.05, 0.05, 0.1, 0.3, 0.3, 0.2)


fair_die_rolls <- sample(1:6, N, replace = TRUE)

unfair_die_rolls <- sample(1:6, N, replace = TRUE, prob = p_unfair) 

cat("--- Single Die Comparison ---\n")
cat("Fair Die   - Mean:", mean(fair_die_rolls), " SD:", sd(fair_die_rolls), "\n")
cat("Unfair Die - Mean:", mean(unfair_die_rolls), " SD:", sd(unfair_die_rolls), "\n\n")


C_rolls <- sample(1:6, N, replace=TRUE) + 
           sample(1:6, N, replace=TRUE) + 
           sample(1:6, N, replace=TRUE) + 
           sample(1:6, N, replace=TRUE)


S_rolls <- sample(1:6, N, replace=TRUE, prob=p_unfair) + 
           sample(1:6, N, replace=TRUE) + 
           sample(1:6, N, replace=TRUE) + 
           sample(1:6, N, replace=TRUE)

cat("--- Sum of 4 Dice Comparison ---\n")
cat("C (4 Fair)          - Mean:", mean(C_rolls), " SD:", sd(C_rolls), "\n")
cat("S (1 Unfair+3 Fair) - Mean:", mean(S_rolls), " SD:", sd(S_rolls), "\n")


png("task_3_1_plots.png", width=1000, height=800)


par(mfrow=c(2,2)) 


barplot(table(fair_die_rolls)/N, 
        main="Fair Die Distribution", 
        col="lightgreen", 
        ylim=c(0, 0.4), 
        ylab="Probability")


barplot(table(unfair_die_rolls)/N, 
        main="Unfair Die Distribution", 
        col="salmon", 
        ylim=c(0, 0.4))


barplot(table(C_rolls)/N, 
        main="Distribution of C (4 Fair Dice)", 
        col="lightgreen", 
        xlim=c(0, 25), 
        ylab="Probability", 
        xlab="Sum")


barplot(table(S_rolls)/N, 
        main="Distribution of S (1 Unfair + 3 Fair)", 
        col="salmon", 
        xlim=c(0, 25), 
        xlab="Sum")


dev.off()
cat("\nPlots saved successfully to task_3_1_plots.png!\n")