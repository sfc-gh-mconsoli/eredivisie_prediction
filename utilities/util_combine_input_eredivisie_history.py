import pandas as pd
import glob

# Define the columns you want to keep
columns_to_keep = ['Date', 'HomeTeam', 'AwayTeam', 'FTHG', 'FTAG', 'FTR']

# Find all CSV files that match the pattern
csv_files = glob.glob('N1*.csv')

# Function to clean and format the date column
def clean_and_format_date(date):
    try:
        # Parse the date assuming it's in DD/MM/YYYY or DD/MM/YY format
        return pd.to_datetime(date, dayfirst=True)
    except:
        return pd.NaT

# Read and concatenate only the specified columns from all CSV files
combined_df = pd.concat(
    (pd.read_csv(f, usecols=columns_to_keep) for f in csv_files), 
    ignore_index=True, 
    sort=False
)

# Apply the date cleaning function
combined_df['Date'] = combined_df['Date'].apply(clean_and_format_date)

# Drop rows with missing or empty values
combined_df.dropna(inplace=True)

# Remove duplicates
combined_df.drop_duplicates(inplace=True)

# Sort the DataFrame by date
combined_df.sort_values(by='Date', inplace=True)

# Convert 'Date' back to string format in DD/MM/YYYY for final output
combined_df['Date'] = combined_df['Date'].dt.strftime('%d/%m/%Y')

# Save the combined DataFrame to a new CSV file
combined_df.to_csv('eredivisie_history.csv', index=False)

print("CSV files combined, cleaned, deduplicated, and sorted by date successfully. Output saved as 'eredivisie_history.csv'.")

