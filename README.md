# ⚽ **HOL: Eredivisie Prediction** 🥇

**SWT - Amsterdam - 10 October 2024**
<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Eredivisie_nieuw_logo_2017-.svg/640px-Eredivisie_nieuw_logo_2017-.svg.png" alt="Sample Image" width="300" />
</p>

### What We'll Do:
1. **Data Ingestion**: Fetch Eredivisie data from the GitHub repository.
2. **Feature Engineering**: Utilize Snowpark DataFrames for data preparation and analysis.
3. **Model Training**: Train model and store it in the Snowflake Model Registry
4. **Prediction**: Predict who is going to win Eredivisie 2024/2025

---
## Step 1: Data Ingestion

Welcome to the **Eredivisie Prediction**! In this notebook, we will use Python functions and External Access Integration to load and analyze data about Eredivisie from 1995 to 2023. Our data source is a GitHub repository, from which we'll fetch and directly store historical data in our Snowflake account. No S3 buckets or local downloads are needed — our goal is to simplify the execution of this Hands-On Lab (HOL) while showcasing the extensive capabilities of Snowflake!


