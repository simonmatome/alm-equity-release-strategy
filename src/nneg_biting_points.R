# ==============================================================================
# F71CB: Actuarial Risk Management 2
# Report on Material Risks and Integration of Lifetime Mortgages into Best Pensions
# Author: Simon Matome
#
# Appendix — Code for Figure 1: NNEG Biting Points for Different Values of
# Loan-to-Value (alpha) and Roll-Up Interest Rate (i)
# ==============================================================================

ltv <- 0.2
V   <- 3.5 * 10^5
i   <- 0.075
c   <- 0.05
hpi <- 0

houseval <- function(hv, t, hpi) {
  return(hv * exp(log(1 + hpi) * t))
}

loan <- function(ltv, hv, t, i) {
  return(ltv * hv * exp(log(1 + i) * t))
}

r_time <- seq(0, 50, length.out = 2000)

col_house <- '#B8860B'
col_loan1 <- '#b03131'
col_loan2 <- '#63711f'
col_loan3 <- '#118280'

par(mar = c(4, 4, 4, 1))

plot(r_time, houseval(V, r_time, hpi) * 10^(-4), type = 'l',
     col = col_house,
     lwd = 2, ylim = c(0, 60), xlim = c(0, 30),
     xaxs = 'i', yaxs = 'i', bty = 'l',
     xlab = '$T_x$', ylab = 'Value $\\times 10^{4}$')
lines(r_time, loan(ltv, V, r_time, i) * 10^(-4),
      type = 'l', col = col_loan1, lwd = 2)
lines(r_time, loan(ltv, V, r_time, i - 0.01) * 10^(-4),
      type = 'l', col = col_loan2, lwd = 2)
lines(r_time, loan(ltv + 0.1, V, r_time, i) * 10^(-4),
      type = 'l', col = col_loan3, lwd = 2)

legend('top', inset = c(0, -0.14), xpd = TRUE, horiz = TRUE,
       legend = c(paste0('$S_0 = ', format(V, big.mark = ","), '$'),
                  '$\\alpha=0.2,\\; i=7.5\\%$',
                  '$\\alpha=0.2,\\; i=6.5\\%$',
                  '$\\alpha=0.3,\\; i=7.5\\%$'),
       col = c(col_house, col_loan1, col_loan2, col_loan3),
       lwd = 2, cex = 0.8, bty = 'n', seg.len = 1.5)
