MERGE INTO `ecg-big-data.test_dataset.dim_accommodation_type` T
USING `ecg-big-data.parameters.products_backup` S
  -- !! STEP 1: Update this join condition
  -- Change 'S.product_code' to the column in your 'products_backup' table
  -- that matches 'T.accomm_type_code'
  ON T.accomm_type_code = S.accomm_type_code

WHEN MATCHED AND STARTS_WITH(T.accomm_type_code, 'RO') THEN
  UPDATE SET 
    -- !! STEP 2: Update this column name
    -- Change 'S.correct_group_name' to the column in 'products_backup'
    -- that holds the NEW group name you want to use.
    T.accomm_group_name = S.accomm_group_name