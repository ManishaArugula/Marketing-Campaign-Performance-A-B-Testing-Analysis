# Marketing Campaign Performance & A/B Testing Analysis 

## Project Overview

This project examines the performance of marketing campaigns carried out through multiple marketing channels. The purpose of the examination is to identify areas for enhancing marketing efficiency and increasing revenue. The project also examines the performance of marketing campaigns in relation to various factors, such as device type, platform, and geography. In addition, an A/B test is carried out to evaluate the performance of new ad creatives in enhancing conversion performance. The main goal of the analysis is to identify high-performing marketing campaigns and marketing channels.

## Business Problem

This project evaluates two important questions for business growth:
1. The performance of different marketing campaigns across channels to identify which one delivers the strongest revenue efficiency
2. Do ad variants have a significant difference in conversion outcomes?

## Goals

1.Evaluate revenue efficiency of marketing campaigns across channels.

2.Assess A/B test effectiveness for a selected campaign-channel combination.

## KPIs & Measurement Framework

1. Goal 1 – Campaign Revenue Efficiency

#### Primary:

-->ROAS (Revenue ÷ Spend)

#### Secondary:

--> Total Spend

--> Total Revenue

#### Additional KPIs:

--> CTR 

--> CVR 

2. Goal 2 – A/B Variant Performance

#### Primary:

--> CVR (Conversions ÷ Sessions)

#### Secondary:

--> CPA (Spend ÷ Conversions)

#### Descriptive:

--> Total Sessions 

Each research question is evaluated using one primary metric. Secondary and descriptive metrics are used only to explain or contextualise results.

## Research Questions

1.RQ1:
Over a 30-day period, how do Brand Awareness, Free Trial, and Discount Offer campaigns compare in terms of revenue efficiency across marketing channels, as measured by ROAS, and which campaign demonstrates stronger performance?

Exploratory diagnostics were conducted across platform, device, placement, location, and audience dimensions to explain observed differences.

2.RQ2:
For the Discount Offer campaign in Paid Socials (Discount_Flash48h, chosen based on highest traffic volume), does Variant B demonstrate a higher conversion rate than Variant A over the same 30-day period?

## Tools Used

1.Excel: Data understanding, validation, cleaning, KPI construction

2.SQL: Exploratory analysis 

3.Python: A/B testing and statistical hypothesis testing

4.Power BI: Dashboarding, storytelling, and insight communication

## Data Understanding

-->The dataset contains daily campaign performance data across 30 days, including campaign hierarchy, channels, funnel metrics, spend, and revenue.

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

5.flagging inaccruate records

6.KPIs were calculated only after aggregation at campaign level or channel level depending on the context

## Analysis Approach (SQL)

1.Layer 1 – What happened?
Descriptive comparison of ROAS across campaign types and channels.

2.Layer 2 – Is the result real or misleading?
Scale vs efficiency analysis using spend and revenue share.

3.Layer 3 – What explains the differences?
Diagnostic drill-downs by platform, device, placement, geography, and campaign name.

4.Layer 4 – What should be tested next?
Evidence-based suggestions 

## Key Findings (RQ1)

1. Discount Offer campaign
Discount Offer campaign has the best ROAS results at 4.95. This indicates that the campaign is effective in encouraging customers to make purchases and that the budget allocation for the campaign may need to be increased.

2. Email channel
Email channel ROAS results are extremely high at 65 and 167. However, the spend for the channel is extremely low, maintaining current investment while prioritising more scalable channels may be more effective.

3. Paid Social campaign
Paid Social campaign ROAS results range from 4 to 5 and have a high level of scalability with a good level of spend. This makes the campaign a good option for increased budget allocation.

4. Device / placement / geography
ROAS results for the different devices and placements show a similar trend with only a modest variation in the results for different platform and geography, suggesting campaign optimisation efforts should focus more on strategy and targeting rather than device-specific adjustments.

## A/B Testing (RQ2)

An A/B test compared Variant A and Variant B for the Discount_Flash48h Paid Social campaign.

-->Variant A CVR: 10.19%

-->Variant B CVR: 10.14%

-->Absolute lift: −0.07 percentage points

A one-sided two-proportion z-test failed to reject the null hypothesis (p = 0.84), indicating no statistically significant evidence that Variant B improves conversion performance. The observed difference is small and likely attributable to random variation.

## Strategic Interpretation

1. Campaign performance
The performance of the Discount Offer campaign reveals the highest ROAS, especially for the Paid Social channel, implying high revenue generation capacity, thus ensuring that the campaign can be scaled up safely. The performance of the campaigns seems consistent across platforms, devices, and regions, implying that these factors have minimal impact on the overall efficiency of the campaigns.

2. A/B testing results
The A/B test for the variations of the ads reveals that there is no significant difference in the conversion rates, implying that the new version of the ad is not significantly better than the existing one, and therefore, optimization efforts can be focused elsewhere.

<img width="1000" height="900" alt="powerbi2" src="https://github.com/user-attachments/assets/1d89fa5b-11ea-4bbf-81ad-2dca6e52dd2e" />


## Conclusion

This project demonstrates an end-to-end growth analytics workflow: defining business problems, selecting appropriate KPIs, validating and analysing data, evaluating performance across scale and efficiency, testing hypotheses rigorously, and communicating insights with appropriate caution.
