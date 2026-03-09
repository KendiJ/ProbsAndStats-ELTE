N <- 1e6


binom_sim <- rbinom(N, size=10, prob=0.4)
binom_mean_theo <- 10 * 0.4
binom_sd_theo <- sqrt(10 * 0.4 * 0.6)


pois_sim <- rpois(N, lambda=5)
pois_mean_theo <- 5
pois_sd_theo <- sqrt(5)


geom_sim <- rgeom(N, prob=0.3) + 1
geom_mean_theo <- 1 / 0.3
geom_sd_theo <- sqrt((1 - 0.3) / (0.3^2))


nbinom_sim <- rnbinom(N, size=4, prob=0.3) + 4
nbinom_mean_theo <- 4 / 0.3
nbinom_sd_theo <- sqrt(4 * (1 - 0.3) / (0.3^2))


hyper_sim <- rhyper(N, m=10, n=40, k=5)
hyper_mean_theo <- 5 * (10/50)
hyper_sd_theo <- sqrt(5 * (10/50) * (1 - 10/50) * (1 - (5-1)/(50-1)))


print_comparison <- function(name, sim_data, theo_mean, theo_sd) {
  cat(sprintf("\n--- %s ---\n", name))
  cat(sprintf("Mean -> Simulated: %.4f | Theoretical: %.4f\n", mean(sim_data), theo_mean)) 
  cat(sprintf("SD   -> Simulated: %.4f | Theoretical: %.4f\n", sd(sim_data), theo_sd))
}

print_comparison("Binomial", binom_sim, binom_mean_theo, binom_sd_theo)
print_comparison("Poisson", pois_sim, pois_mean_theo, pois_sd_theo)
print_comparison("Geometric", geom_sim, geom_mean_theo, geom_sd_theo)
print_comparison("Negative Binomial", nbinom_sim, nbinom_mean_theo, nbinom_sd_theo)
print_comparison("Hypergeometric", hyper_sim, hyper_mean_theo, hyper_sd_theo)