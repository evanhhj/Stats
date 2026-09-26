# Problem 2.14-2.20: Prediction intervals
# All regression and prediction quantities are calculated directly from SLR formulas.
# No lm() or predict() is used.

args <- commandArgs(trailingOnly = TRUE)
data_path <- if (length(args) >= 1) args[1] else "ps2/jkp_factors.csv"
output_dir <- if (length(args) >= 2) args[2] else "ps2/Part_2.14-2.20"

fct <- read.csv(data_path)
x <- fct$market
x_new <- 0.03
factors <- c("low_risk", "profitability", "size")
labels <- c("Low Risk", "Profitability", "Size")

manual_prediction <- function(y, x, x_new, confidence = 0.80) {
  n <- length(y)
  x_bar <- mean(x)
  y_bar <- mean(y)
  Sxx <- sum((x - x_bar)^2)
  Sxy <- sum((x - x_bar) * (y - y_bar))

  beta_hat <- Sxy / Sxx
  alpha_hat <- y_bar - beta_hat * x_bar
  residuals <- y - alpha_hat - beta_hat * x
  sigma2_hat <- sum(residuals^2) / (n - 2)

  expected_return <- alpha_hat + beta_hat * x_new
  leverage <- 1 / n + (x_new - x_bar)^2 / Sxx
  estimation_error_variance <- sigma2_hat * leverage
  se_estimated_mean <- sqrt(estimation_error_variance)
  prediction_variance <- sigma2_hat + estimation_error_variance
  prediction_se <- sqrt(prediction_variance)

  alpha <- 1 - confidence
  critical_value <- qt(1 - alpha / 2, df = n - 2)
  prediction_lower <- expected_return - critical_value * prediction_se
  prediction_upper <- expected_return + critical_value * prediction_se

  data.frame(
    n = n,
    x_bar = x_bar,
    Sxx = Sxx,
    alpha_hat = alpha_hat,
    beta_hat = beta_hat,
    sigma2_hat = sigma2_hat,
    x_new = x_new,
    expected_return = expected_return,
    leverage = leverage,
    estimation_error_variance = estimation_error_variance,
    se_estimated_mean = se_estimated_mean,
    prediction_variance = prediction_variance,
    prediction_se = prediction_se,
    critical_value_80 = critical_value,
    prediction_lower_80 = prediction_lower,
    prediction_upper_80 = prediction_upper
  )
}

results <- do.call(rbind, lapply(seq_along(factors), function(i) {
  out <- manual_prediction(fct[[factors[i]]], x, x_new)
  data.frame(factor = labels[i], variable = factors[i], out)
}))

dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)
write.csv(
  results,
  file.path(output_dir, "results_2_14_2_20.csv"),
  row.names = FALSE
)

report_table <- results[, c(
  "factor", "expected_return", "estimation_error_variance",
  "se_estimated_mean", "prediction_se",
  "prediction_lower_80", "prediction_upper_80"
)]

write.csv(
  report_table,
  file.path(output_dir, "report_table_2_14_2_20.csv"),
  row.names = FALSE
)

print(report_table, row.names = FALSE, digits = 8)

