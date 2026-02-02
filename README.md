# Marketing Campaign Performance & A/B Testing Analysis 

## Project Overview

This project evaluates the performance of multiple marketing campaigns across channels to identify which strategies deliver the strongest revenue efficiency and whether creative experimentation improves conversion outcomes. The analysis follows a structured growth analytics workflow covering KPI design, data validation, exploratory analysis, diagnostics, experimentation, and insight communication.

## Business Problem

The company runs multiple marketing campaigns across channels but lacks clarity on:

which campaign strategies convert spend into revenue most efficiently, and whether ongoing A/B experiments meaningfully improve conversion performance.

## Goals

1.Evaluate revenue efficiency of marketing campaigns across channels.

2.Assess A/B test effectiveness for a selected campaign-channel combination.

## KPIs & Measurement Framework

1.Goal 1 – Campaign Revenue Efficiency

#### Primary (Evaluative):

-->ROAS (Revenue ÷ Spend)

#### Secondary (Contextual):

--> Total / average spend

--> Total / average revenue

#### Descriptive (Mechanism):

-->CTR (engagement signal)

-->Conversion volume (scale context)

2.Goal 2 – A/B Variant Performance

#### Primary (Evaluative):

-->CVR (Conversions ÷ Sessions)

#### Secondary (Evaluative):

-->CPA (Spend ÷ Conversions)

#### Descriptive / Diagnostic:

-->Sessions (traffic balance)

-->Selected funnel step (e.g. sign-up rate)

Each research question is evaluated using one primary metric. Secondary and descriptive metrics are used only to explain or contextualise results.

## Research Questions

1.RQ1:
Over a 30-day period, how do Brand Awareness, Free Trial, and Discount Offer campaigns compare in terms of revenue efficiency across marketing channels, as measured by ROAS, and which campaign demonstrates stronger performance?

Exploratory diagnostics were conducted across platform, device, placement, location, and audience dimensions to explain observed differences.

2.RQ2:
For the selected Discount Offer Paid Social campaign (Discount_Flash48h, chosen based on highest traffic volume), does Variant B demonstrate a higher conversion rate than Variant A over the same 30-day period?

## Tools Used

1.Excel: Data understanding, validation, cleaning, KPI construction

2.SQL: Exploratory analysis and campaign diagnostics (Layers 1–3)

3.Python: A/B testing and statistical hypothesis testing

4.Power BI: Dashboarding, storytelling, and insight communication

## Data Understanding

-->The dataset contains daily campaign performance data across 30 days, including campaign hierarchy, delivery context, funnel metrics, spend, and revenue.

-->Hierarchy:
Campaign Type → Campaign Name → Variant (A/B) → Channel → Platform → Placement → Adset → Creative

-->Key funnel metrics include impressions, clicks, sessions, conversions, spend, and revenue.

## Data Validation & Cleaning

Validation checks ensured logical consistency (e.g. clicks ≤ impressions, conversions ≤ sessions), valid date ranges, non-negative numeric values, and appropriate handling of missing spend and revenue.

<img width="1000" height="900" alt="python" src="https://github.com/user-attachments/assets/2204fbc7-9b81-4446-a372-703b611ae61e" />


Cleaning steps included:

1.data type validation

2.categorical standardisation

3.consistent handling of missing categorical values

4.business-logic treatment of missing numeric values

5.flagging anomalous records

6.KPIs were calculated only after aggregation; ratios were never averaged row-wise.

## Analysis Approach (SQL)

1.Layer 1 – What happened?
Descriptive comparison of ROAS across campaign types and channels.

2.Layer 2 – Is the result real or misleading?
Scale vs efficiency analysis using spend and revenue share.

3.Layer 3 – What explains the differences?
Diagnostic drill-downs by platform, device, placement, geography, and campaign name.

4.Layer 4 – What should be tested next?
Evidence-based suggestions (not optimisation decisions).

## Key Findings (RQ1)

1.Discount Offer campaigns deliver the strongest revenue efficiency, generating ~£5 in revenue per £1 of spend and consistently outperforming Free Trial and Brand Awareness campaigns.

2.Paid Social uniquely combines strong ROAS with the highest spend and revenue contribution, indicating efficiency at scale.

3.Email and Affiliate channels show extremely high ROAS but operate at low spend, limiting absolute revenue impact.

4.Brand Awareness campaigns consume a meaningful share of spend but generate minimal downstream revenue within the observed window.

5.Diagnostic analysis shows execution-level factors (placement and device) provide incremental gains, while platform and geography differences are modest.

## A/B Testing (RQ2)

An A/B test compared Variant A and Variant B for the Discount_Flash48h Paid Social campaign.

-->Variant A CVR: 10.19%

-->Variant B CVR: 10.14%

-->Absolute lift: −0.07 percentage points

A one-sided two-proportion z-test failed to reject the null hypothesis (p = 0.84), indicating no statistically significant evidence that Variant B improves conversion performance. The observed difference is small and likely attributable to random variation.

## Strategic Interpretation

1.Campaign strategy and offer structure are the dominant drivers of revenue efficiency.

2.Channel choice determines scalability of that efficiency.

3.Execution-level levers (platform, placement, device) provide incremental optimisation rather than step-change improvements.

4.Not all experiments yield winners; validating outcomes statistically is critical to avoid false optimisation.

<img width="1000" height="900" alt="powerbi2" src="https://github.com/user-attachments/assets/1d89fa5b-11ea-4bbf-81ad-2dca6e52dd2e" />


## Conclusion

This project demonstrates an end-to-end growth analytics workflow: defining business problems, selecting appropriate KPIs, validating and analysing data, diagnosing performance across scale and efficiency, testing hypotheses rigorously, and communicating insights with appropriate caution.
