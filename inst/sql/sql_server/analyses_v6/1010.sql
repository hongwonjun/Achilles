-- 1010	Number of condition eras with end date < start date


select 1010 as analysis_id,  
	cast(null as varchar(255)) as stratum_1, cast(null as varchar(255)) as stratum_2, cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
	COUNT_BIG(ce1.PERSON_ID) as count_value
into @scratchDatabaseSchema@schemaDelim@tempAchillesPrefix_1010
from
	@cdmDatabaseSchema.condition_era ce1
where ce1.condition_era_end_datetime < ce1.condition_era_start_datetime
;
