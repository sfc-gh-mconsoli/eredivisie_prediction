⚠️⚠️⚠️ **Dear HOL Participants,
We kindly recommend running Pre-Reqs after 29th September 2024, when the final version will be released on this repo.** 

We are running some final tests before the HoL scheduled for the 3rd October. 
More information will be provided in this README.md file once the **final** notebooks and datasets are uploaded to this GitHub repository.
Thank you for your understanding!

---

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

## Pre-Reqs

### 1. Create DB Objects via Setup Script

Run the `setup.sql` script to create db objects and external access integration.

- **Database**: `EREDIVISIE_PREDICTION`
- **Warehouse**: `EREDIVISIE_PREDICTION_WH`
- **Network Rule**: `GITHUB_NETWORK_RULE`
- **External Access Integration**: `GITHUB_EXTERNAL_ACCESS_INTEGRATION`

The first three items are required as you will need to define the Database, Schema, and Warehouse when you import this notebook into the Snowflake UI.
NOTE: If you are using a trial account, you'll need to execute the `setup_trial.sql`. After creating DB objects (including an internal stage) you'll be asked to upload the dataset manually in the stage and continue the script execution to import dataset into tables. 
Data loading is performed via external access integration on non-trial accounts (the external integration feature is disabled on trial accounts).


### 2. Import Notebooks

Before importing notebooks, ensure that you have created the objects by running the `setup.sql` or `setup_trial.sql` script.
Once the step 1 is completed you can proceed importing the 4 notebooks in the `notebooks` folder in this repo.
You can import them following these steps:

- Click on Projects -> Notebooks -> Arrow Down -> Import .ipynb file
- Import Notebooks one by one selecting the DB.SCHEMA `EREDIVISIE_PREDICTION.PUBLIC`, and Virtual Warehouse `EREDIVISIE_PREDICTION_WH`
- On each notebook, you'll find a `Setup` markdown that might require to import specific packages on each notebooks.

### 3. Execution - HoL
Simply run through the Notebooks:

- 1_Ingestion: on trial accounts execute just the last few cells, the first part is loading dataset that is already covered by the `setup_trial.sql`
- 2_Transformation
- 3_Training
- 4_Inference

⚽ **Happy Prediction and remember that the primary purpose of this HoL is to have fun. While the model's accuracy might be low, many football fans will appreciate the outcomes!** ⚽
