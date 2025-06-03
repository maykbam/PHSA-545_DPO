--liquibase formatted.sql
--changeset michael.cawayan:MONITOR.RTDM_LOG_IF136_DPO_DG_OUT contextFilter:PH endDelimiter:/ runOnChange:true

DECLARE
    e_no_constraint EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_no_constraint, -2443);
BEGIN
    EXECUTE IMMEDIATE 'ALTER TABLE MONITOR.RTDM_LOG_IF136_DPO_DG_OUT
DROP CONSTRAINT PK_RTDM_LOG_IF136_DPO_DG_OUT';
    DBMS_OUTPUT.PUT_LINE('Constraint dropped successfully.');
EXCEPTION
    WHEN e_no_constraint THEN
        DBMS_OUTPUT.PUT_LINE('Constraint does not exist.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/
ALTER TABLE MONITOR.RTDM_LOG_IF136_DPO_DG_OUT
ADD CONSTRAINT PK_RTDM_LOG_IF136_DPO_DG_OUT PRIMARY KEY (DPO_EVENT_ID, OUT_PRIORITY)
/
