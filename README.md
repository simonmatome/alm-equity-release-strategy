# ALM & Balance Sheet Strategy: Material Risks and Integration of Lifetime Mortgages into Best Pensions

## Repository Contents

| File | Description |
| :--- | :--- |
| [`report/Lifetime_Mortgages_Best_Pensions_Report.pdf`](./report/Lifetime_Mortgages_Best_Pensions_Report.pdf) | **Full Actuarial Advisory Report (11 Pages):** Balance sheet stress testing, duration mismatch analysis, Lifetime Mortgage (LTM) & No-Negative-Equity Guarantee (NNEG) valuation, Solvency II/UK Matching Adjustment assessment, and two-phase strategic recommendation. |
| [`src/nneg_biting_points.R`](./src/nneg_biting_points.R) | **R Script for Figure 1:** Models and plots the loan roll-up trajectories $\alpha S_0(1+i)^{T_x}$ vs. property value $S_0$ to identify NNEG biting horizons across LTV ($\alpha \in \{0.2, 0.3\}$) and roll-up rates ($i \in \{6.5\%, 7.5\%\}$). |

---

## Executive Context & Balance Sheet Diagnosis

**Best Pensions (BP)** is a UK proprietary life insurer with 30 years of operation writing unit-linked pensions and fixed lifetime annuities. Management is evaluating entering the UK **Equity Release** market via **Lifetime Mortgages (LTMs)**.

Before launching a new product, we perform a quantitative **Balance Sheet Stress Test** on BP's current £48,500m asset portfolio against its £46,000m liabilities and solvency requirements (£2,500m Surplus; thin **5.15% Free Asset Ratio**):

### Baseline Balance Sheet of Best Pensions (BP)

| Balance Sheet Item | Current Value (£m) | Average Duration (Years) | Typical Yield (p.a.) |
| :--- | :---: | :---: | :---: |
| **Equities** | $16,000.00$ | — | $10.00\%$ |
| **AA Corporate Bonds** | $15,000.00$ | $30$ | $6.00\%$ |
| **Government Bonds** | $11,000.00$ | $27$ | $5.00\%$ |
| **Property** | $4,000.00$ | — | $7.00\%$ |
| **Cash** | $1,500.00$ | — | $4.00\%$ |
| **Unit-Linked Assets** | $1,000.00$ | — | — |
| **Total Assets** | **$48,500.00$** | | |
| **BEL for Annuities** | $30,000.00$ | $18$ | $5.00\%$ (Gov discount rate) |
| **Solvency Capital Requirement (SCR)** | $10,000.00$ | — | — |
| **Risk Margin** | $5,000.00$ | — | — |
| **BEL for Unit-Linked Pensions** | $1,000.00$ | — | — |
| **Total Liabilities & Solvency Req.** | **$46,000.00$** | | |
| **Free Surplus** | **$2,500.00$** | **(5.15% Free Asset Ratio)** | |

---

## Quantitative Balance Sheet Stress Test Results

Using exact zero-coupon duration discounting $\Delta P = P_t \left[\left(\frac{1 + i_t}{1 + i_t + \delta}\right)^D - 1\right]$ for interest-rate-sensitive items and direct shock multipliers for market and longevity stresses:

| Stress Scenario | Current Surplus (£m) | Stressed Surplus (£m) | Surplus Change (£m) | Surplus Change (%) | Solvency Outcome |
| :--- | :---: | :---: | :---: | :---: | :--- |
| **Equities Crash ($-25\%$)** | $2,500.00$ | **$(1,500.00)$** | $-4,000.00$ | **$-160.00\%$** | **Immediate Insolvency** (£1.5bn deficit) |
| **Longevity Shock ($+5\%$ Annuity BEL)** | $2,500.00$ | **$1,000.00$** | $-1,500.00$ | **$-60.00\%$** | Severe capital erosion |
| **Interest Rate Parallel Shift ($+1\%$)** | $2,500.00$ | **$1,048.00$** | $-1,452.00$ | **$-58.08\%$** | **Over-duration trap:** Assets ($D=27\text{--}30$) fall by £6,183m while Liabilities ($D=18$) fall by £4,731m |
| **Property Downturn ($-15\%$)** | $2,500.00$ | **$1,900.00$** | $-600.00$ | **$-24.00\%$** | High correlation risk with equities |

---

## Lifetime Mortgage (LTM) & No-Negative-Equity Guarantee (NNEG) Mathematics

Under Equity Release Council (ERC) standards, every LTM embeds a **No-Negative-Equity Guarantee (NNEG)** capping the repayment at the net realised property value $S_{T_x} - C_{T_x}$ upon death or long-term care entry at time $T_x$:

$$f(S_{T_x}, C_{T_x}, T_x, \alpha) = \min\!\Big\{S_{T_x} - C_{T_x},\; \alpha S_0(1+i)^{T_x}\Big\} = \underbrace{\alpha S_0(1+i)^{T_x}}_{\text{Accrued Loan}} - \underbrace{\max\!\Big\{\alpha S_0(1+i)^{T_x} + C_{T_x} - S_{T_x},\; 0\Big\}}_{\text{Short Put Option on Property (NNEG)}}$$

- **Duration & Yield Synergy:** Proposed LTMs carry an **18-year average duration** (matching BP's 18-year Annuity BEL duration) and a **7.50% typical yield** (exceeding both Government [5.0%] and AA Corporate [6.0%] bonds).
- **Solvency II / Solvency UK Matching Adjustment (MA) Structuring:** Because raw LTM cash flows depend on uncertain mortality, long-term care, and voluntary prepayment, BP must **securitise the LTM pool via a Special Purpose Vehicle (SPV)** into senior fixed-cash-flow notes (MA-eligible) and junior equity tranches.

---

## Two-Phase Strategic Recommendation for the Board

1. **Phase 1 — Immediate Balance Sheet Stabilisation (Cash-Flow Matching):** Divest the unhedged £16,000m equity allocation and realign bond duration from 27–30 years down to the 18-year annuity liability profile using high-grade fixed income. This eliminates the immediate insolvency threat from equity crashes and rising interest rates.
2. **Phase 2 — Securitised Lifetime Mortgage Launch:** Once core solvency is restored, integrate LTMs (18-year duration, 7.5% yield) alongside corporate bonds to diversify credit concentration and capture the **Solvency II Matching Adjustment** via SPV tranche structuring, enforcing age-tiered LTV limits ($\alpha$) to keep the embedded NNEG put option deep out-of-the-money.
