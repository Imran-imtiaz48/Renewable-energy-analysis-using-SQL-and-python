-- 1. Highest Capacity by Energy Type
-- Use raw SUM in ORDER BY to ensure numerical sorting
SELECT 
    Type_of_Renewable_Energy, 
    FORMAT(SUM(Installed_Capacity_MW), 2) AS total_capacity_mw
FROM cleaned_energy_dataser
GROUP BY Type_of_Renewable_Energy 
ORDER BY SUM(Installed_Capacity_MW) DESC;

-- 2. Jobs Created by Funding Source
SELECT 
    Funding_Sources, 
    SUM(Jobs_Created) AS total_jobs
FROM cleaned_energy_dataser
GROUP BY Funding_Sources 
ORDER BY total_jobs DESC;

-- 3. Highest Energy Production
SELECT 
    Type_of_Renewable_Energy, 
    FORMAT(SUM(Energy_Production_MWh), 2) AS total_energy_production_mwh
FROM cleaned_energy_dataser
GROUP BY Type_of_Renewable_Energy 
ORDER BY SUM(Energy_Production_MWh) DESC;

-- 4. Energy Consumption Ratio
-- Formula: (Total Consumption / Total Production)
-- Added a NULLIF to prevent division by zero errors
SELECT 
    Type_of_Renewable_Energy, 
    FORMAT(SUM(Energy_Consumption_MWh) / NULLIF(SUM(Energy_Production_MWh), 0), 4) AS consumption_efficiency_ratio
FROM cleaned_energy_dataser
GROUP BY Type_of_Renewable_Energy 
ORDER BY consumption_efficiency_ratio DESC;

-- 5. Funding Distribution by Projects Count
SELECT 
    Funding_Sources, 
    COUNT(*) AS total_projects_installed
FROM cleaned_energy_dataser
GROUP BY Funding_Sources 
ORDER BY total_projects_installed DESC;

-- 6. Investment and Incentives Analysis
-- Changed ORDER BY to DESC for Investment to see highest first
SELECT 
    Type_of_Renewable_Energy, 
    FORMAT(SUM(Initial_Investment_USD), 2) AS total_investment, 
    FORMAT(SUM(Financial_Incentives_USD), 2) AS total_incentives
FROM cleaned_energy_dataser
GROUP BY Type_of_Renewable_Energy 
ORDER BY SUM(Initial_Investment_USD) DESC;

-- 7. Environmental Impact (GHG & Air Pollution)
SELECT 
    Type_of_Renewable_Energy, 
    FORMAT(AVG(GHG_Emission_Reduction_tCO2e), 2) AS avg_ghg_reduction, 
    FORMAT(AVG(Air_Pollution_Reduction_Index), 2) AS avg_air_pollution_index
FROM cleaned_energy_dataser
GROUP BY Type_of_Renewable_Energy 
ORDER BY AVG(GHG_Emission_Reduction_tCO2e) DESC;

-- 8. Storage Efficiency
SELECT 
    Type_of_Renewable_Energy, 
    FORMAT(AVG(Storage_Efficiency_Percentage), 2) AS avg_storage_efficiency_pct
FROM cleaned_energy_dataser
GROUP BY Type_of_Renewable_Energy 
ORDER BY AVG(Storage_Efficiency_Percentage) DESC;
