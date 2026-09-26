# Prediction Intervals (Questions 2.14-2.20)

All calculations condition on a next-month market excess return of
\(x_{new}=0.03\). The sample contains \(n=408\) observations, with
\(\bar{x}=0.006906729\), \(S_{xx}=\sum_{t=1}^{n}(x_t-\bar{x})^2=0.8280615\),
and \(406\) residual degrees of freedom.

## 2.14 Expected return of the Low Risk factor

The fitted CAPM regression for Low Risk is

\[
\widehat r_{LR}=0.005727122-0.628556257r_{mkt}.
\]

Conditional on a market return of 3%, its expected return is therefore

\[
\widehat r_{LR}(0.03)
=0.005727122-0.628556257(0.03)
=-0.013129566.
\]

Thus, the regression predicts a **-1.313%** Low Risk return.

## 2.15 Estimation error variance

For a new market-return value \(x_{new}\), the estimation error variance of the
estimated conditional mean is

\[
\widehat{\operatorname{Var}}\!\left(\widehat\alpha+
\widehat\beta x_{new}\right)
=\widehat\sigma^2\left[
\frac{1}{n}+\frac{(x_{new}-\bar{x})^2}{S_{xx}}
\right].
\]

For Low Risk, \(\widehat\sigma^2=0.0011555034\), giving

\[
\widehat{\operatorname{Var}}\!\left(\widehat r_{LR}(0.03)\right)
=3.5763\times10^{-6}.
\]

Its square root is 0.001891, or **0.189 percentage points**. This measures
uncertainty about the conditional mean return implied by the estimated
regression line. It does not include the unpredictable error in a single
future monthly return.

## 2.16 Standard error of the Low Risk prediction

For a single future factor return, the prediction variance includes both
parameter-estimation uncertainty and the future regression error:

\[
\widehat{\operatorname{Var}}(r_{new}-\widehat r_{new})
=\widehat\sigma^2\left[
1+\frac{1}{n}+\frac{(x_{new}-\bar{x})^2}{S_{xx}}
\right].
\]

The resulting Low Risk prediction standard error is

\[
SE_{pred,LR}=\sqrt{0.0011555034+3.5763\times10^{-6}}
=0.0340453,
\]

or **3.405 percentage points**. Hence, even if the market return is exactly
3%, a single Low Risk return remains substantially uncertain.

## 2.17 Standard error of the Profitability prediction

Applying the same formula using the Profitability residual variance
\(\widehat\sigma^2=0.0006038548\) gives

\[
SE_{pred,Profitability}=0.0246115,
\]

or **2.461 percentage points**.

## 2.18 Why the standard errors differ

Both regressions use the same market-return observations and the same value
\(x_{new}=0.03\), so their leverage term
\(1+1/n+(x_{new}-\bar{x})^2/S_{xx}\) is identical. The difference therefore
comes from their residual variances. Low Risk has a larger residual variance
(0.0011555) than Profitability (0.0006039), so its future return is less
precisely predicted.

## 2.19 80% prediction intervals

We calculate each interval as

\[
\widehat r_{new}\ \pm\ t_{0.90,406}SE_{pred},
\qquad t_{0.90,406}=1.28364.
\]

| Factor | Predicted return | Prediction SE | 80% prediction interval |
|---|---:|---:|---:|
| Low Risk | -1.313% | 3.405% | [-5.683%, 3.057%] |
| Profitability | -0.150% | 2.461% | [-3.309%, 3.010%] |
| Size | 0.380% | 2.231% | [-2.484%, 3.244%] |

These are prediction intervals for individual next-month factor returns,
rather than confidence intervals for their conditional mean returns.

## 2.20 Use of the prediction intervals

The hedge fund can use the intervals to evaluate the range of plausible factor
returns conditional on its 3% market forecast, compare downside exposure, and
set position sizes or risk limits. All three intervals include zero, showing
that the market forecast alone does not determine the sign of any individual
factor's next-month return. Among the three, Size has the narrowest interval,
while Low Risk has the greatest residual uncertainty and the widest interval.

