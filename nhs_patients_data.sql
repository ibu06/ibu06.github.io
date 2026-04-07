--- SQL queries applied for the NHS Patient Data Outcomes

1. Total patients by NHS region
  SELECT
    NHS_Region,
    COUNT(*) AS total_patients
FROM nhs_patient_data
GROUP BY NHS_Region
ORDER BY total_patients DESC;
  
2. Average waiting time by diagnosis
SELECT
    Diagnosis,
    ROUND(AVG(Waiting_Time_Days), 2) AS avg_waiting_time_days
FROM nhs_patient_data
GROUP BY Diagnosis
ORDER BY avg_waiting_time_days DESC;

3. Average length of stay by hospital
 SELECT
    Hospital_Name,
    ROUND(AVG(Length_of_Stay_Days), 2) AS avg_length_of_stay
FROM nhs_patient_data
GROUP BY Hospital_Name
ORDER BY avg_length_of_stay DESC;

4. Total treatment cost by diagnosis
SELECT
    Diagnosis,
    ROUND(SUM(Treatment_Cost_GBP), 2) AS total_treatment_cost
FROM nhs_patient_data
GROUP BY Diagnosis
ORDER BY total_treatment_cost DESC;
    
5. Patient outcomes by age group
SELECT
    Age_Group,
    Outcome,
    COUNT(*) AS total_patients
FROM nhs_patient_data
GROUP BY Age_Group, Outcome
ORDER BY Age_Group, total_patients DESC;

6. Emergency admissions by NHS trust
  SELECT
    NHS_Trust,
    COUNT(*) AS emergency_admissions
FROM nhs_patient_data
WHERE Admission_Type = 'Emergency'
GROUP BY NHS_Trust
ORDER BY emergency_admissions DESC;

7. Referral source analysis
  SELECT
    Referral_Source,
    COUNT(*) AS total_referrals
FROM nhs_patient_data
GROUP BY Referral_Source
ORDER BY total_referrals DESC;

8. Cost per patient by region
  SELECT
    NHS_Region,
    ROUND(AVG(Treatment_Cost_GBP), 2) AS avg_cost_per_patient
FROM nhs_patient_data
GROUP BY NHS_Region
ORDER BY avg_cost_per_patient DESC;

9. Monthly patient trend
   SELECT
    DATE_FORMAT(Visit_Date, '%Y-%m') AS visit_month,
    COUNT(*) AS patient_visits
FROM nhs_patient_data
GROUP BY DATE_FORMAT(Visit_Date, '%Y-%m')
ORDER BY visit_month;

10. Mortality rate by diagnosis
    SELECT
    Diagnosis,
    ROUND(
        100.0 * SUM(CASE WHEN Outcome = 'Deceased' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS mortality_rate_pct
FROM nhs_patient_data
GROUP BY Diagnosis
ORDER BY mortality_rate_pct DESC;
