UPDATE `ecg-big-data.test_dataset.m_accomm_bedrooms_segment_helper`
SET accomm_group_bedrooms_label = CASE bedrooms_code
  WHEN '?' THEN 'Unknown'
  WHEN 'A' THEN '1 Bed'
  WHEN 'B' THEN '2 Bed'
  WHEN 'C' THEN '3 Bed'
  WHEN 'D' THEN '4 Bed'
  WHEN 'E' THEN '1 Bed'
  WHEN 'F' THEN '5 Bed'
  WHEN 'G' THEN '6 Bed'
  WHEN 'Z' THEN 'Unknown'
  ELSE accomm_group_bedrooms_label 
END
WHERE season = 2025;



UPDATE `ecg-big-data.test_dataset.m_accomm_type_segment_helper`	
SET accomm_group_type_label = CASE type_code	
WHEN '0' THEN 'MH'	
WHEN '1' THEN 'Unknown'	
WHEN '2' THEN 'MH'	
WHEN '3' THEN 'Chalet'	
WHEN '4' THEN 'Room'	
WHEN '5' THEN 'Apartment'	
WHEN '6' THEN 'Tent'	
WHEN '7' THEN 'Tent'	
WHEN 'A' THEN 'Chalet'	
WHEN 'B' THEN 'Tent'	
WHEN 'C' THEN 'Chalet'	
WHEN 'D' THEN 'Tent'	
WHEN 'E' THEN 'Tent'	
WHEN 'F' THEN 'Tent'	
WHEN 'G' THEN 'Tent'	
WHEN 'H' THEN 'Chalet'	
WHEN 'I' THEN 'Tent'	
WHEN 'J' THEN 'Tent'	
WHEN 'K' THEN 'Room'	
WHEN 'L' THEN 'Tent'	
WHEN 'M' THEN 'Apartment'	
WHEN 'N' THEN 'Apartment'	
WHEN 'O' THEN 'Room'	
WHEN 'P' THEN 'Room'	
WHEN 'Q' THEN 'Apartment'	
WHEN 'R' THEN 'Tent'	
WHEN 'S' THEN 'MH'	
WHEN 'T' THEN 'Tent'	
WHEN 'U' THEN 'Pitch'	
WHEN 'V' THEN 'Pitch'	
WHEN 'W' THEN 'Tent'	
WHEN 'X' THEN 'Tent'	
WHEN 'Y' THEN 'Room'	
WHEN 'Z' THEN 'Unknown'	
ELSE accomm_group_type_label -- Keeps the original value if no match	
END	
WHERE season = 2025;	



UPDATE `ecg-big-data.test_dataset.m_accomm_range_segment_helper`
SET accomm_group_range_label = CASE range_code
  WHEN '0' THEN 'Budget'
  WHEN '1' THEN 'Budget'
  WHEN '2' THEN 'Comfort'
  WHEN '3' THEN 'Premium'
  WHEN '?' THEN 'Unknown'
  WHEN 'A' THEN 'Budget'
  WHEN 'B' THEN 'Budget+'
  WHEN 'G' THEN 'Comfort'
  WHEN 'H' THEN 'Comfort+'
  WHEN 'I' THEN 'Comfort+'
  WHEN 'K' THEN 'Premium'
  WHEN 'L' THEN 'Premium'
  WHEN 'M' THEN 'Premium+'
  WHEN 'N' THEN 'Premium+'
  WHEN 'S' THEN 'Ultimate'
  WHEN 'T' THEN 'Ultimate+'
  WHEN 'U' THEN 'Ultimate+'
  WHEN 'V' THEN 'Ultimate+'
  WHEN 'Y' THEN 'Budget'
  WHEN 'Z' THEN 'Unknown'
  ELSE accomm_group_range_label 
END
WHERE season = 2025;



UPDATE `ecg-big-data.test_dataset.m_accomm_type_segment_helper`
SET override_condition_fl = CASE accomm_group_type_label
  WHEN 'Hotel' THEN true
  WHEN 'Hut' THEN true
  WHEN 'Mooring Ring' THEN true
  WHEN 'Pitch' THEN true
  WHEN 'Resident' THEN true
  WHEN 'Room' THEN true
  WHEN 'Unknown' THEN true
  ELSE false  
END
WHERE season = 2026;
	
