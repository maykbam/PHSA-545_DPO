--liquibase formatted.sql
--changeset michael.cawayan:INT_CDM.SAS_RTDM_LG_DPO_DG_OUT_001 contextFilter:PH endDelimiter:/ runOnChange:true

DECLARE
    e_no_constraint EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_no_constraint, -2443);
BEGIN
    EXECUTE IMMEDIATE 'ALTER TABLE INT_CDM.SAS_RTDM_LG_DPO_DG_OUT_001
DROP CONSTRAINT RTDM_LOG_IF136_DPO_DG_OUT_PK';
    DBMS_OUTPUT.PUT_LINE('Constraint dropped successfully.');
EXCEPTION
    WHEN e_no_constraint THEN
        DBMS_OUTPUT.PUT_LINE('Constraint does not exist.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/
ALTER TABLE INT_CDM.SAS_RTDM_LG_DPO_DG_OUT_001
ADD CONSTRAINT RTDM_LOG_IF136_DPO_DG_OUT_PK PRIMARY KEY (DPO_EVENT_ID, OUT_PRIORITY, LOAD_SEQ)
/
