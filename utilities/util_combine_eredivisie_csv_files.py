# Script to combine multiple csv into a single csv, defining common columns to keep across different CSVs.
# Executed locally in the download folder to combine 30 different eredivisie files (one for each season) in one full history file. 

import pandas as pd
import glob

# Define the columns you want to keep
columns_to_keep = ['Date', 'HomeTeam', 'AwayTeam', 'FTHG', 'FTAG', 'FTR']

# Find all CSV files that match the pattern
csv_files = glob.glob('N1*.csv')

# Read and concatenate only the specified columns from all CSV files
combined_df = pd.concat(
    (pd.read_csv(f, usecols=columns_to_keep) for f in csv_files),
    ignore_index=True,
    sort=False
)

# Save the combined DataFrame to a new CSV file
combined_df.to_csv('eredivisie_history.csv', index=False)

print("CSV files combined successfully. Output saved as 'eredivisie_history.csv'.")

