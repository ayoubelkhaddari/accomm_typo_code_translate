INSERT INTO `ecg-big-data.test_dataset.m_accomm_type_segment_helper`
(
  season,
  type_code,
  type_name,
  accomm_group_type_label,
  override_condition_fl
)
SELECT 
  2024 AS season,   
  type_code,
  type_name,
  accomm_group_type_label,
  override_condition_fl
FROM `ecg-big-data.test_dataset.m_accomm_type_segment_helper` 
WHERE season = 2025

INSERT INTO `ecg-big-data.test_dataset.m_accomm_range_segment_helper`
(
  season,
  range_code,
  range_name,
  accomm_group_range_label
)
SELECT 
  2024 AS season,   
  range_code,
  range_name,
  accomm_group_range_label
  FROM `ecg-big-data.test_dataset.m_accomm_range_segment_helper` 
WHERE season = 2025

INSERT INTO `ecg-big-data.test_dataset.m_accomm_bedrooms_segment_helper`
(
  season,
  bedrooms_code,
  bedrooms_name,
  accomm_group_bedrooms_label
)
SELECT 
  2024 AS season,   
  bedrooms_code,
  bedrooms_name,
  accomm_group_bedrooms_label
  FROM `ecg-big-data.test_dataset.m_accomm_bedrooms_segment_helper` 
WHERE season = 2025