
MERGE INTO
  `ecg-big-data.test_dataset.dim_accommodation_type` AS T

USING
  (
    SELECT
      dat.season,
      dat.accomm_type_code,
      CASE
        WHEN (m_type.override_condition_fl = true) THEN CONCAT('Unalike | ', m_type.accomm_group_type_label)
        ELSE CONCAT(m_type.accomm_group_type_label, ' | ', m_range.accomm_group_range_label, ' | ', m_bedrooms.accomm_group_bedrooms_label)
      END AS new_accomm_group_name

    FROM
      `ecg-big-data.test_dataset.dim_accommodation_type` AS dat

    LEFT JOIN
      `ecg-big-data.test_dataset.m_accomm_type_segment_helper` AS m_type
      ON m_type.season = dat.season
      AND m_type.type_code = SUBSTR(dat.accomm_type_code, 3, 1)

    LEFT JOIN
      `ecg-big-data.test_dataset.m_accomm_range_segment_helper` AS m_range
      ON m_range.season = dat.season
      AND m_range.range_code = SUBSTR(dat.accomm_type_code, 4, 1)

    LEFT JOIN
      `ecg-big-data.test_dataset.m_accomm_bedrooms_segment_helper` AS m_bedrooms
      ON m_bedrooms.season = dat.season
      AND m_bedrooms.bedrooms_code = SUBSTR(dat.accomm_type_code, 5, 1)

    WHERE
      dat.season = 2025
      AND (
        STARTS_WITH(accomm_type_code, "FL")
        OR STARTS_WITH(accomm_type_code, "FX")
      )
  ) AS S

  ON T.season = S.season
  AND T.accomm_type_code = S.accomm_type_code

WHEN MATCHED
  THEN
  UPDATE
  SET
    T.accomm_group_name = S.new_accomm_group_name;
