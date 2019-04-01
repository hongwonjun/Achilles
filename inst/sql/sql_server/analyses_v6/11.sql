-- 11	Number of non-deceased persons by year of birth and by gender

--HINT DISTRIBUTE_ON_KEY(stratum_1)
select 11 as analysis_id,  CAST(year_of_birth AS VARCHAR(255)) as stratum_1,
  CAST(gender_concept_id AS VARCHAR(255)) as stratum_2,
  cast(null as varchar(255)) as stratum_3, cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
  COUNT_BIG(distinct person_id) as count_value
into @scratchDatabaseSchema@schemaDelim@tempAchillesPrefix_11
from @cdmDatabaseSchema.PERSON
where person_id not in (
  select P.person_id
  from @cdmDatabaseSchema.observation O
  join @cdmDatabaseSchema.person P on O.person_id = P.person_id
    and P.death_datetime = O.observation_datetime
  where O.observation_concept_id = 4306655 -- death concept id
)
group by YEAR_OF_BIRTH, gender_concept_id;
