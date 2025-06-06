--liquibase formatted.sql
--changeset michael.cawayan:INT_OS.V_DYNAMIC_OFFER_PRIO contextFilter:PH endDelimiter:/ runOnChange:true

create or replace view INT_OS.V_DYNAMIC_OFFER_PRIO as
select OFFER_TYPE_CODE, OFFER_SUB_TYPE_CODE, PRIORITY, SYSTIMESTAMP+30 as VALIDITYTIMESTAMP
from OFS.OFFER_TYPE_DICT
/
GRANT SELECT ON INT_OS.V_DYNAMIC_OFFER_PRIO TO MA_TEMP
/
GRANT SELECT ON "INT_OS"."V_DYNAMIC_OFFER_PRIO" TO "SAS_INT_OS_RO"
/
GRANT SELECT ON "INT_OS"."V_DYNAMIC_OFFER_PRIO" TO "HCI_RO_INT_OS"
/