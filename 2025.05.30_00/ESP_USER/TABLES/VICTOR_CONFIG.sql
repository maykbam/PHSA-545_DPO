--liquibase formatted.sql
--changeset michael.cawayan:ESP_USER.VICTOR_CONFIG contextFilter:PH endDelimiter:/ runOnChange:true

DELETE FROM ESP_USER.VICTOR_CONFIG
WHERE SOURCE_TABLE = 'RTDM_LOG_IF136_DPO_DG_OUT'
/
INSERT INTO ESP_USER.VICTOR_CONFIG
VALUES ('ESP_USER','RTDM_LOG_IF136_DPO_DG_OUT_JOURNAL','Y',NULL,'MONITOR','RTDM_LOG_IF136_DPO_DG_OUT','DPO_EVENT_ID, OUT_PRIORITY',NULL,NULL,NULL)
/