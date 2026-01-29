use market;
select count(*) from campaign_data;

############# Descriptive Questions, what happened ########################
## directly dealing with roas
#1. How does ROAS vary by campaign type?
select *, round(revenue/spend,2) as ROAS from (
select campaign_type, sum(spend_gbp) as spend , sum(revenue_gbp) as revenue
 from campaign_data
 where flag_blank_spend =0
 group by campaign_type
 ) as a
 order by ROAS desc;
 # Discount offer campaign has £5 revenue per £1 spend
 # followed by free trial with £2 then by band awarness with £0.3

#2. Anchor Question to RQ1- How does ROAS compare by campaign types across channel
select *, round(revenue/spend,2) as ROAS from (
select campaign_type, channel, round(sum(spend_gbp),2) as spend, 
round(sum(revenue_gbp),2) as revenue
 from campaign_data
 where flag_blank_spend =0
 group by campaign_type,channel
 ) as a
 order by channel ,ROAS desc;
 # Discount offer from email channel gave ROAS of 171
 # Free Trial from email channel gave 79.06
 # Discount Offer from Paid Social gave 5.78
 #Brand awarness in video, display and paid search channel have lowest ROAS ~0.2
 #Email-driven Discount and Free Trial campaigns show extremely high ROAS of 167-76 ROAS
 # Affiliate and paid social produces around 5-2.5 ROAS in Discount Offer and Free trial campaigns
 # Discount offer in all channels has produced higher ROAS then free trial followed byt Brand awarness
 
############## Is result real and not misleading , dig deaper into why you see the result######## 
# 3.How much is spend allocated and revenue is generation to each campaign type across channel
 select campaign_type, channel, round((total_spend/(select sum(spend_gbp) from campaign_data))*100,2) as  spend_pct,
 round((total_revenue/ (select sum(revenue_gbp) from campaign_data))*100,2) as revenue_pct from (
 select campaign_type, channel, sum(spend_gbp) as total_spend, sum(revenue_gbp) as total_revenue
 from campaign_data
 group by campaign_type, channel) as a
 order by  campaign_type, channel;
 #“Brand Awareness campaigns account for a meaningful share of spend across channels but contribute disproportionately less downstream revenue, indicating low revenue efficiency at scale.”
 #Discount Offer campaigns demonstrate strong revenue efficiency at scale, particularly in Paid Social, where revenue contribution significantly exceeds spend share. Low-spend channels such as Email also show disproportionate revenue contribution, though at limited scale.
 #Free Trial campaigns show mixed efficiency across channels, with Paid Social contributing revenue roughly in line with spend, while Paid Search underperforms in terms of revenue contribution relative to spend
 #High ROAS alone is not sufficient to evaluate campaign performance. Discount Offer campaigns are not only efficient but also operate at meaningful scale, whereas extremely high-ROAS channels such as Email contribute limited absolute revenue due to low spend.
 
 #4. Do  campaign-channel with high ROAS have high revenue?
 select*, rank() over (order by ROAS desc) as ROAS_rank, rank() over (order by total_revenue desc) as revenue_rank,
 rank() over(order by total_spend desc) as spend_rank
 from(
 select campaign_type, channel, round(revenue/spend,2) as ROAS, round(revenue, 2) as total_revenue,
 round(spend, 2) as total_spend
 from (
 select campaign_type, channel, sum(spend_gbp) as spend , sum(revenue_gbp) as revenue
 from campaign_data
 where flag_blank_spend = 0
 group by campaign_type, channel
 ) as a) as b
 order by revenue_rank;
 
 #Email-driven Discount Offer campaigns show extremely high ROAS but operate at very low spend, limiting their overall revenue impact.”
 #Discount Offer campaigns on Paid Social combine strong revenue efficiency with the highest spend and revenue contribution, indicating efficiency at scale.- strong performance signal
 #Brand Awareness campaigns on Paid Social absorb a large share of spend while contributing limited downstream revenue, indicating low revenue efficiency at scale.
 #Free Trial campaigns on Paid Social demonstrate balanced efficiency and scale, contributing meaningfully to revenue without extreme ROAS volatility.
 
 
 ############## Why the performance difference? #####################
 ##Possible contributions towards higher ROAS such as platform, geo, audience, funnel metrics
 ## Dig deeper into 1 campaign-channel combo with high ROAS. From previous analysis it is shown that Discount Offer in Paid Social
 
 #5. How does discount offer in paid social vary in ROAS by platform
 
 select campaign_type, channel, platform, round(revenue/spend,2) as ROAS from (
 select campaign_type, channel, platform, sum(revenue_gbp) as revenue, sum(spend_gbp) as spend 
 from campaign_data
 where flag_blank_spend = 0 and campaign_type ='Discount Offer' and channel ='Paid Social'
 group by campaign_type, channel, platform 
 ) as a
 order by ROAS desc;
 # ROAS differences across Paid Social platforms are relatively small, with LinkedIn Ads showing marginally higher ROAS than Meta and TikTok.
 
 #6. How does discount offer in paid social vary in ROAS by Device
 select campaign_type, channel, device, round(revenue/spend,2) as ROAS from (
 select campaign_type, channel, device, sum(revenue_gbp) as revenue, sum(spend_gbp) as spend 
 from campaign_data
 where flag_blank_spend = 0 and campaign_type ='Discount Offer' and channel ='Paid Social'
 group by campaign_type, channel, device 
 ) as a
 order by ROAS desc;
 # Desktop traffic shows moderately higher ROAS compared to mobile, suggesting higher purchase efficiency on desktop devices
 
 #7.  How does discount offer in paid social vary in ROAS by Geo
select campaign_type, channel, geo, round(revenue/spend,2) as ROAS from (
 select campaign_type, channel, geo, sum(revenue_gbp) as revenue, sum(spend_gbp) as spend 
 from campaign_data
 where flag_blank_spend = 0 and campaign_type ='Discount Offer' and channel ='Paid Social'
 group by campaign_type, channel, geo 
 ) as a
 order by ROAS desc;
 #UK exhibits slightly higher ROAS than IE, though differences are modest.
  
#8.  How does discount offer in paid social vary in ROAS by placements
 select campaign_type, channel, platform,placement,  round(revenue/spend,2) as ROAS from (
 select campaign_type, channel, platform, placement, sum(revenue_gbp) as revenue, sum(spend_gbp) as spend 
 from campaign_data
 where flag_blank_spend = 0 and campaign_type ='Discount Offer' and channel ='Paid Social'
 group by campaign_type, channel, platform, placement
 ) as a
 order by ROAS desc;
 # Across Paid Social platforms, Stories placements consistently outperform Feed placements in terms of ROAS, suggesting higher efficiency for immersive formats.
 
 #9. Do high ROAS have segments have high click through rate or converion rate?
select campaign_type, channel, platform, round(((total_clicks/total_impressions) *100),2) as ctr,
 round(((total_conv/ total_sessions) *100),2) as cvr, round(revenue/spend, 2) as ROAS
 from (
select campaign_type, channel,platform, sum(clicks) as total_clicks, sum(impressions) as total_impressions,
sum(conversions) as total_conv, sum(sessions) as total_sessions, sum(revenue_gbp) as revenue, sum(spend_gbp) as spend 
 from campaign_data
 where flag_blank_spend = 0 and campaign_type ='Discount Offer' and channel='Paid Social'
 group by platform
 ) as a;
 #Conversion rates are broadly consistent across Paid Social platforms, clustering around ~10%, with slightly lower performance for unclassified (NA) traffic
 #CTR is relatively consistent across platforms and falls within a typical range for Paid Social campaigns, 0.8%-1.5%
 
 #10. Get the top 1 campaign name wit higher ROAS across channel for Discout offer campaign 
 with cte as(
 select *, rank() over (partition by channel order by ROAS desc) as roas_rank from (
 select campaign_type,channel, campaign_name, round(revenue/spend,2)  as ROAS from (
 select campaign_type,channel, campaign_name,sum(spend_gbp) as spend, sum(revenue_gbp) as revenue 
 from campaign_data
 where flag_blank_spend =0 and campaign_type='Discount Offer' 
 group by channel, campaign_name
 ) as a 
 ) as b
 )
 select * from cte where roas_rank =1;
 #Discount_BundleDeal emerges as the top-ROAS campaign name across multiple channels (Display, Email, Paid Search). 
 #However, the exceptionally high Email ROAS should be interpreted cautiously due to typically low spend levels in Email, 
 #so the most actionable consistency signal is its strong performance in higher-spend channels like Paid Search and Display.
 
##For proceeding with RQ2, we will be checking the campaign_name that has the highest sessions , impressinns, and conversions
## in discount offer campaign type and in paid social channel.  
 select campaign_type, channel, campaign_name , sum(sessions) as total_sessions, sum(impressions) as total_impressions,
sum(clicks) as total_clicks , sum(conversions) as  total_conversions
from campaign_data
 where flag_blank_spend =0 and campaign_type='Discount Offer' and channel ='Paid Social'
 group by campaign_type, channel, campaign_name
 # Discount_Flash48h exeeds in all the factors.
 
