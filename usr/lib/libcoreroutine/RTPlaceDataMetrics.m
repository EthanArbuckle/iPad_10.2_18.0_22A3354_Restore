@implementation RTPlaceDataMetrics

+ (id)binArrayDuetEventDuration
{
  return +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9327320, &unk_1E932CE10, &unk_1E932CE20);
}

+ (id)binArrayPercentage
{
  return +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9327320, &unk_1E932CE30, &unk_1E932CE40);
}

- (RTPlaceDataMetrics)initWithVisitArray:(id)a3 distanceThreshold:(double)a4 locationHome:(id)a5 locationWork:(id)a6 locationsOfOthers:(id)a7 startDateTime:(id)a8 endDateTime:(id)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  RTPlaceDataMetrics *v21;
  RTPlaceDataMetrics *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  RTPlaceDataMetrics *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  uint8_t *v31;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  uint8_t v37[16];
  uint8_t buf[2];
  __int16 v39;
  __int16 v40;
  __int16 v41;
  __int16 v42;
  __int16 v43;

  v17 = a3;
  v18 = a5;
  v19 = a6;
  v36 = a7;
  v35 = a8;
  v20 = a9;
  if (!v17)
  {
    v28 = v20;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v43 = 0;
    v30 = "Invalid parameter not satisfying: visitArray";
    v31 = (uint8_t *)&v43;
LABEL_23:
    _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, v30, v31, 2u);
    goto LABEL_24;
  }
  if (a4 <= 0.0)
  {
    v28 = v20;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v42 = 0;
    v30 = "Invalid parameter not satisfying: distanceThreshold > 0";
    v31 = (uint8_t *)&v42;
    goto LABEL_23;
  }
  if (!v18)
  {
    v28 = v20;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v41 = 0;
    v30 = "Invalid parameter not satisfying: locationHome";
    v31 = (uint8_t *)&v41;
    goto LABEL_23;
  }
  if (!v19)
  {
    v28 = v20;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v40 = 0;
    v30 = "Invalid parameter not satisfying: locationWork";
    v31 = (uint8_t *)&v40;
    goto LABEL_23;
  }
  if (!v36)
  {
    v28 = v20;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v39 = 0;
    v30 = "Invalid parameter not satisfying: locationsOfOthers";
    v31 = (uint8_t *)&v39;
    goto LABEL_23;
  }
  if (!v35)
  {
    v28 = v20;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v30 = "Invalid parameter not satisfying: startDateTime";
      v31 = buf;
      goto LABEL_23;
    }
LABEL_24:

    v27 = 0;
    goto LABEL_25;
  }
  v34 = v20;
  if (v20)
  {
    v21 = -[RTPlaceDataMetrics initWithLoggingEnabled:](self, "initWithLoggingEnabled:", 1);
    v22 = v21;
    if (v21)
    {
      objc_storeStrong((id *)&v21->_visitArray, a3);
      v22->_distanceThreshold = a4;
      objc_storeStrong((id *)&v22->_locationHome, a5);
      objc_storeStrong((id *)&v22->_locationWork, a6);
      objc_storeStrong((id *)&v22->_locationsOfOthers, a7);
      objc_storeStrong((id *)&v22->_startDateTime, a8);
      objc_storeStrong((id *)&v22->_endDateTime, a9);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v22, "metrics");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("home_work_distance_threshold"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -[RTPlaceDataMetrics daysBetweenDate:andDate:](v22, "daysBetweenDate:andDate:", v22->_startDateTime, v22->_endDateTime));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v22, "metrics");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, CFSTR("days_of_history"));

    }
    self = v22;
    v27 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v37 = 0;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDateTime", v37, 2u);
    }

    v27 = 0;
  }
  v28 = v34;
LABEL_25:

  return v27;
}

- (RTPlaceDataMetrics)initWithLoggingEnabled:(BOOL)a3
{
  RTPlaceDataMetrics *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)RTPlaceDataMetrics;
  v3 = -[RTMetric initWithLoggingEnabled:](&v50, sel_initWithLoggingEnabled_, a3);
  if (v3)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend((id)objc_opt_class(), "BOOLeanKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v47;
      v8 = MEMORY[0x1E0C9AAA0];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v47 != v7)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v9);
          -[RTMetric metrics](v3, "metrics");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v10);

          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v6);
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend((id)objc_opt_class(), "integerKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v43;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v43 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v16);
          -[RTMetric metrics](v3, "metrics");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E9327338, v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
      }
      while (v14);
    }

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend((id)objc_opt_class(), "doubleKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v39;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v39 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v23);
          -[RTMetric metrics](v3, "metrics");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_1E932CE00, v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
      }
      while (v21);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend((id)objc_opt_class(), "bucketedKeys", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v35;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v35 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v30);
          -[RTMetric metrics](v3, "metrics");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E9327338, v31);

          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
      }
      while (v28);
    }

  }
  return v3;
}

+ (id)BOOLeanKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("agreeDailyPatternsAndDwellTimeOnHome"), 0);
}

+ (id)integerKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("days_of_history"), CFSTR("numPlacesAfterWeeksWithNonZeroDwellTimePruning"), CFSTR("weeksWithNonZeroDwellTime_home"), CFSTR("weeksWithNonZeroDwellTime_work"), CFSTR("numPlacesAfterDailyPatternsPruning"), CFSTR("homeRankDailyPatterns"), CFSTR("workRankDailyPatterns"), CFSTR("homeRankDwellTime"), CFSTR("workRankDwellTime"), 0);
}

+ (id)doubleKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("home_work_distance_threshold"), CFSTR("mean_distance_homeVisit_from_homeAddress"), CFSTR("mean_distance_workVisit_from_workAddress"), CFSTR("mean_distance_otherVisit_from_otherAddress"), CFSTR("weekly_occurrence_rate_home"), CFSTR("weekly_occurrence_rate_work"), CFSTR("mean_visit_time_home"), CFSTR("median_visit_time_home"), CFSTR("SD_visit_time_home"), CFSTR("mean_visit_time_work"), CFSTR("median_visit_time_work"), CFSTR("SD_visit_time_work"), CFSTR("mean_visit_time_others"), CFSTR("median_visit_time_others"), CFSTR("SD_visit_time_others"), CFSTR("average_occurrence_weekdays_Home_Work_Others"), CFSTR("average_occurrence_weekdays_Home_NoWork_Others"),
               CFSTR("average_occurrence_weekdays_NoHome_Work_Others"),
               CFSTR("average_occurrence_weekdays_NoHome_NoWork_Others"),
               CFSTR("average_occurrence_weekdays_Home_Work_NoOthers"),
               CFSTR("average_occurrence_weekdays_Home_NoWork_NoOthers"),
               CFSTR("average_occurrence_weekdays_NoHome_Work_NoOthers"),
               CFSTR("average_occurrence_weekdays_NoHome_NoWork_NoOthers"),
               CFSTR("average_occurrence_weekend_Home_Work_Others"),
               CFSTR("average_occurrence_weekend_Home_NoWork_Others"),
               CFSTR("average_occurrence_weekend_NoHome_Work_Others"),
               CFSTR("average_occurrence_weekend_NoHome_NoWork_Others"),
               CFSTR("average_occurrence_weekend_Home_Work_NoOthers"),
               CFSTR("average_occurrence_weekend_Home_NoWork_NoOthers"),
               CFSTR("average_occurrence_weekend_NoHome_Work_NoOthers"),
               CFSTR("average_occurrence_weekend_NoHome_NoWork_NoOthers"),
               CFSTR("median_daily_visits_weekdays_home"),
               CFSTR("mean_daily_visits_weekdays_home"),
               CFSTR("SD_daily_visits_weekdays_home"),
               CFSTR("median_daily_visits_weekdays_work"),
               CFSTR("mean_daily_visits_weekdays_work"),
               CFSTR("SD_daily_visits_weekdays_work"),
               CFSTR("median_daily_visits_weekdays_others"),
               CFSTR("mean_daily_visits_weekdays_others"),
               CFSTR("SD_daily_visits_weekdays_others"),
               CFSTR("median_daily_visits_weekend_home"),
               CFSTR("mean_daily_visits_weekend_home"),
               CFSTR("SD_daily_visits_weekend_home"),
               CFSTR("median_daily_visits_weekend_work"),
               CFSTR("mean_daily_visits_weekend_work"),
               CFSTR("SD_daily_visits_weekend_work"),
               CFSTR("median_daily_visits_weekend_others"),
               CFSTR("mean_daily_visits_weekend_others"),
               CFSTR("SD_daily_visits_weekend_others"),
               CFSTR("median_visit_duration_weekdays_home"),
               CFSTR("mean_visit_duration_weekdays_home"),
               CFSTR("SD_visit_duration_weekdays_home"),
               CFSTR("median_visit_duration_weekdays_work"),
               CFSTR("mean_visit_duration_weekdays_work"),
               CFSTR("SD_visit_duration_weekdays_work"),
               CFSTR("median_visit_duration_weekdays_others"),
               CFSTR("mean_visit_duration_weekdays_others"),
               CFSTR("SD_visit_duration_weekdays_others"),
               CFSTR("median_visit_duration_weekend_home"),
               CFSTR("mean_visit_duration_weekend_home"),
               CFSTR("SD_visit_duration_weekend_home"));
}

+ (id)bucketedKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("home_work_distance_threshold_bucketed"), CFSTR("mean_distance_homeVisit_from_homeAddress_bucketed"), CFSTR("mean_distance_workVisit_from_workAddress_bucketed"), CFSTR("mean_distance_otherVisit_from_otherAddress_bucketed"), CFSTR("weekly_occurrence_rate_home_bucketed"), CFSTR("weekly_occurrence_rate_work_bucketed"), CFSTR("mean_visit_time_home_bucketed"), CFSTR("median_visit_time_home_bucketed"), CFSTR("mean_visit_time_work_bucketed"), CFSTR("median_visit_time_work_bucketed"), CFSTR("mean_visit_time_others_bucketed"), CFSTR("median_visit_time_others_bucketed"), CFSTR("average_occurrence_weekdays_Home_Work_Others_bucketed"), CFSTR("average_occurrence_weekdays_Home_NoWork_Others_bucketed"), CFSTR("average_occurrence_weekdays_NoHome_Work_Others_bucketed"), CFSTR("average_occurrence_weekdays_NoHome_NoWork_Others_bucketed"), CFSTR("average_occurrence_weekdays_Home_Work_NoOthers_bucketed"),
               CFSTR("average_occurrence_weekdays_Home_NoWork_NoOthers_bucketed"),
               CFSTR("average_occurrence_weekdays_NoHome_Work_NoOthers_bucketed"),
               CFSTR("average_occurrence_weekdays_NoHome_NoWork_NoOthers_bucketed"),
               CFSTR("average_occurrence_weekend_Home_Work_Others_bucketed"),
               CFSTR("average_occurrence_weekend_Home_NoWork_Others_bucketed"),
               CFSTR("average_occurrence_weekend_NoHome_Work_Others_bucketed"),
               CFSTR("average_occurrence_weekend_NoHome_NoWork_Others_bucketed"),
               CFSTR("average_occurrence_weekend_Home_Work_NoOthers_bucketed"),
               CFSTR("average_occurrence_weekend_Home_NoWork_NoOthers_bucketed"),
               CFSTR("average_occurrence_weekend_NoHome_Work_NoOthers_bucketed"),
               CFSTR("average_occurrence_weekend_NoHome_NoWork_NoOthers_bucketed"),
               CFSTR("median_daily_visits_weekdays_home_bucketed"),
               CFSTR("mean_daily_visits_weekdays_home_bucketed"),
               CFSTR("median_daily_visits_weekdays_work_bucketed"),
               CFSTR("mean_daily_visits_weekdays_work_bucketed"),
               CFSTR("median_daily_visits_weekdays_others_bucketed"),
               CFSTR("mean_daily_visits_weekdays_others_bucketed"),
               CFSTR("median_daily_visits_weekend_home_bucketed"),
               CFSTR("mean_daily_visits_weekend_home_bucketed"),
               CFSTR("median_daily_visits_weekend_work_bucketed"),
               CFSTR("mean_daily_visits_weekend_work_bucketed"),
               CFSTR("median_daily_visits_weekend_others_bucketed"),
               CFSTR("mean_daily_visits_weekend_others_bucketed"),
               CFSTR("median_visit_duration_weekdays_home_bucketed"),
               CFSTR("mean_visit_duration_weekdays_home_bucketed"),
               CFSTR("median_visit_duration_weekdays_work_bucketed"),
               CFSTR("mean_visit_duration_weekdays_work_bucketed"),
               CFSTR("median_visit_duration_weekdays_others_bucketed"),
               CFSTR("mean_visit_duration_weekdays_others_bucketed"),
               CFSTR("median_visit_duration_weekend_home_bucketed"),
               CFSTR("mean_visit_duration_weekend_home_bucketed"),
               CFSTR("median_visit_duration_weekend_work_bucketed"),
               CFSTR("mean_visit_duration_weekend_work_bucketed"),
               CFSTR("median_visit_duration_weekend_others_bucketed"),
               CFSTR("mean_visit_duration_weekend_others_bucketed"),
               CFSTR("median_daily_total_visit_duration_weekdays_home_bucketed"),
               CFSTR("mean_daily_total_visit_duration_weekdays_home_bucketed"),
               CFSTR("median_daily_total_visit_duration_weekdays_work_bucketed"),
               CFSTR("mean_daily_total_visit_duration_weekdays_Work_Bucketed"),
               CFSTR("median_daily_total_visit_duration_weekdays_others_bucketed"),
               CFSTR("mean_daily_total_visit_duration_weekdays_others_bucketed"),
               CFSTR("median_daily_total_visit_duration_weekend_home_bucketed"),
               CFSTR("mean_daily_total_visit_duration_weekend_home_bucketed"),
               CFSTR("median_daily_total_visit_duration_weekend_work_bucketed"));
}

+ (id)supportedMetricKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend((id)objc_opt_class(), "integerKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "BOOLeanKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  objc_msgSend((id)objc_opt_class(), "doubleKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v8);

  objc_msgSend((id)objc_opt_class(), "bucketedKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v10);

  objc_msgSend(v4, "addObject:", CFSTR("data_source"));
  return v4;
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)RTAnalyticsEventPlaceDataMetrics;
}

- (void)setDerivedMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  void *v415;
  void *v416;
  void *v417;
  void *v418;
  void *v419;
  void *v420;
  void *v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  void *v433;
  void *v434;
  void *v435;
  void *v436;
  void *v437;
  void *v438;
  void *v439;
  void *v440;
  void *v441;
  void *v442;
  void *v443;
  void *v444;
  void *v445;
  void *v446;
  void *v447;
  void *v448;
  void *v449;
  void *v450;
  void *v451;
  void *v452;
  void *v453;
  void *v454;
  void *v455;
  void *v456;
  void *v457;
  void *v458;
  void *v459;
  void *v460;
  void *v461;
  void *v462;
  void *v463;
  void *v464;
  void *v465;
  void *v466;
  void *v467;
  void *v468;
  void *v469;
  void *v470;
  void *v471;
  void *v472;
  void *v473;
  void *v474;
  void *v475;
  void *v476;
  void *v477;
  void *v478;
  void *v479;
  void *v480;
  void *v481;
  void *v482;
  void *v483;
  void *v484;
  void *v485;
  void *v486;
  void *v487;
  void *v488;
  void *v489;
  void *v490;
  void *v491;
  void *v492;
  void *v493;
  void *v494;
  void *v495;
  void *v496;
  void *v497;
  void *v498;
  void *v499;
  void *v500;
  void *v501;
  void *v502;
  void *v503;
  void *v504;
  void *v505;
  void *v506;
  void *v507;
  void *v508;
  void *v509;
  void *v510;
  void *v511;
  void *v512;
  void *v513;
  void *v514;
  void *v515;
  void *v516;
  void *v517;
  void *v518;
  void *v519;
  void *v520;
  void *v521;
  void *v522;
  void *v523;
  void *v524;
  void *v525;
  void *v526;
  void *v527;
  void *v528;
  void *v529;
  void *v530;
  void *v531;
  void *v532;
  void *v533;
  void *v534;
  void *v535;
  void *v536;
  void *v537;
  void *v538;
  void *v539;
  void *v540;
  void *v541;
  void *v542;
  void *v543;
  void *v544;
  void *v545;
  void *v546;
  void *v547;
  void *v548;
  void *v549;
  void *v550;
  void *v551;
  void *v552;
  void *v553;
  void *v554;
  void *v555;
  void *v556;
  void *v557;
  void *v558;
  void *v559;
  void *v560;
  void *v561;
  void *v562;
  void *v563;
  void *v564;
  void *v565;
  void *v566;
  void *v567;
  void *v568;
  void *v569;
  void *v570;
  void *v571;
  void *v572;
  void *v573;
  void *v574;
  void *v575;
  void *v576;
  void *v577;
  void *v578;
  void *v579;
  void *v580;
  void *v581;
  void *v582;
  void *v583;
  void *v584;
  void *v585;
  void *v586;
  void *v587;
  void *v588;
  void *v589;
  void *v590;
  void *v591;
  void *v592;
  void *v593;
  void *v594;
  void *v595;
  void *v596;
  void *v597;
  void *v598;
  void *v599;
  void *v600;
  void *v601;
  void *v602;
  void *v603;
  void *v604;
  void *v605;
  void *v606;
  void *v607;
  void *v608;
  void *v609;
  void *v610;
  void *v611;
  void *v612;
  void *v613;
  void *v614;
  void *v615;
  void *v616;
  void *v617;
  void *v618;
  void *v619;
  void *v620;
  void *v621;
  void *v622;
  void *v623;
  void *v624;
  void *v625;
  void *v626;
  void *v627;
  void *v628;
  void *v629;
  void *v630;
  void *v631;
  void *v632;
  void *v633;
  void *v634;
  void *v635;
  void *v636;
  void *v637;
  void *v638;
  void *v639;
  void *v640;
  void *v641;
  void *v642;
  void *v643;
  void *v644;
  void *v645;
  void *v646;
  void *v647;
  void *v648;
  void *v649;
  void *v650;
  void *v651;
  void *v652;
  void *v653;
  void *v654;
  void *v655;
  void *v656;
  void *v657;
  void *v658;
  void *v659;
  void *v660;
  void *v661;
  void *v662;
  void *v663;
  void *v664;
  void *v665;
  void *v666;
  void *v667;
  void *v668;
  void *v669;
  void *v670;
  void *v671;
  void *v672;
  void *v673;
  void *v674;
  void *v675;
  void *v676;
  void *v677;
  void *v678;
  void *v679;
  void *v680;
  void *v681;
  void *v682;
  void *v683;
  void *v684;
  void *v685;
  void *v686;
  void *v687;
  void *v688;
  void *v689;
  void *v690;
  void *v691;
  void *v692;
  void *v693;
  void *v694;
  void *v695;
  void *v696;
  void *v697;
  void *v698;
  void *v699;
  void *v700;
  void *v701;
  void *v702;
  void *v703;
  void *v704;
  void *v705;
  void *v706;
  void *v707;
  void *v708;
  void *v709;
  void *v710;
  void *v711;
  void *v712;
  void *v713;
  void *v714;
  void *v715;
  void *v716;
  void *v717;
  void *v718;
  void *v719;
  void *v720;
  void *v721;
  void *v722;
  void *v723;
  void *v724;
  void *v725;
  void *v726;
  void *v727;
  void *v728;
  void *v729;
  void *v730;
  void *v731;
  void *v732;
  void *v733;
  void *v734;
  void *v735;
  void *v736;
  void *v737;
  void *v738;
  void *v739;
  void *v740;
  void *v741;
  void *v742;
  void *v743;
  void *v744;
  void *v745;
  void *v746;
  void *v747;
  void *v748;
  void *v749;
  void *v750;
  void *v751;
  void *v752;
  void *v753;
  void *v754;
  void *v755;
  void *v756;
  void *v757;
  void *v758;
  void *v759;
  void *v760;
  void *v761;
  void *v762;
  void *v763;
  void *v764;
  void *v765;
  void *v766;
  void *v767;
  void *v768;
  void *v769;
  void *v770;
  void *v771;
  void *v772;
  void *v773;
  void *v774;
  void *v775;
  void *v776;
  void *v777;
  void *v778;
  void *v779;
  void *v780;
  void *v781;
  void *v782;
  void *v783;
  void *v784;
  void *v785;
  void *v786;
  void *v787;
  void *v788;
  void *v789;
  void *v790;
  void *v791;
  void *v792;
  void *v793;
  void *v794;
  void *v795;
  void *v796;
  void *v797;
  void *v798;
  void *v799;
  void *v800;
  void *v801;
  void *v802;
  void *v803;
  void *v804;
  void *v805;
  void *v806;
  void *v807;
  void *v808;
  void *v809;
  void *v810;
  void *v811;
  void *v812;
  void *v813;
  void *v814;
  void *v815;
  void *v816;
  void *v817;
  void *v818;
  void *v819;
  void *v820;
  void *v821;
  void *v822;
  void *v823;
  void *v824;
  void *v825;
  void *v826;
  void *v827;
  void *v828;
  void *v829;
  void *v830;
  void *v831;
  void *v832;
  void *v833;
  void *v834;
  void *v835;
  void *v836;
  void *v837;
  void *v838;
  void *v839;
  void *v840;
  void *v841;
  void *v842;
  void *v843;
  void *v844;
  void *v845;
  void *v846;
  void *v847;
  void *v848;
  void *v849;
  void *v850;
  void *v851;
  void *v852;
  void *v853;
  void *v854;
  void *v855;
  void *v856;
  void *v857;
  void *v858;
  void *v859;
  void *v860;
  void *v861;
  void *v862;
  void *v863;
  void *v864;
  void *v865;
  void *v866;
  void *v867;
  void *v868;
  void *v869;
  void *v870;
  void *v871;
  void *v872;
  void *v873;
  void *v874;
  void *v875;
  void *v876;
  void *v877;
  void *v878;
  void *v879;
  void *v880;
  void *v881;
  void *v882;
  void *v883;
  void *v884;
  void *v885;
  void *v886;
  void *v887;
  void *v888;
  void *v889;
  void *v890;
  void *v891;
  void *v892;
  void *v893;
  void *v894;
  void *v895;
  void *v896;
  void *v897;
  void *v898;
  void *v899;
  void *v900;
  void *v901;
  void *v902;
  void *v903;
  void *v904;
  void *v905;
  void *v906;
  void *v907;
  void *v908;
  void *v909;
  void *v910;
  void *v911;
  void *v912;
  void *v913;
  void *v914;
  void *v915;
  void *v916;
  void *v917;
  void *v918;
  void *v919;
  void *v920;
  void *v921;
  void *v922;
  void *v923;
  void *v924;
  void *v925;
  void *v926;
  void *v927;
  void *v928;
  void *v929;
  void *v930;
  void *v931;
  void *v932;
  void *v933;
  void *v934;
  void *v935;
  void *v936;
  void *v937;
  void *v938;
  void *v939;
  void *v940;
  void *v941;
  void *v942;
  void *v943;
  void *v944;
  void *v945;
  void *v946;
  void *v947;
  void *v948;
  void *v949;
  void *v950;
  void *v951;
  void *v952;
  void *v953;
  void *v954;
  void *v955;
  void *v956;
  void *v957;
  void *v958;
  void *v959;
  void *v960;
  void *v961;
  id v962;

  +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9327320, &unk_1E932CE50, &unk_1E932CE60);
  v962 = (id)objc_claimAutoreleasedReturnValue();
  +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9327320, &unk_1E932CE10, &unk_1E932CE70);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9327320, &unk_1E93273E0, &unk_1E93273F8);
  v958 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9327320, &unk_1E932CE10, &unk_1E932CE80);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9327320, &unk_1E932CE30, &unk_1E932CE90);
  v960 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9327320, &unk_1E932CEA0, &unk_1E932CEB0);
  v961 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9327320, &unk_1E932CEC0, &unk_1E932CE80);
  v959 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("home_work_distance_threshold"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v6, &unk_1E932C298);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("home_work_distance_threshold_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("mean_distance_homeVisit_from_homeAddress"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v10, v962);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("mean_distance_homeVisit_from_homeAddress_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("mean_distance_workVisit_from_workAddress"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v14, v962);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("mean_distance_workVisit_from_workAddress_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("mean_distance_otherVisit_from_otherAddress"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v18, v962);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("mean_distance_otherVisit_from_otherAddress_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("weekly_occurrence_rate_home"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("weekly_occurrence_rate_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("weekly_occurrence_rate_work"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, CFSTR("weekly_occurrence_rate_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("mean_visit_time_home"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v32, v3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, CFSTR("mean_visit_time_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("median_visit_time_home"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v36, v3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, CFSTR("median_visit_time_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("mean_visit_time_work"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v40, v3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, CFSTR("mean_visit_time_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("median_visit_time_work"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v44, v3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setObject:forKeyedSubscript:", v45, CFSTR("median_visit_time_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("mean_visit_time_others"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v48, v3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v49, CFSTR("mean_visit_time_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("median_visit_time_others"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v52, v3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v53, CFSTR("median_visit_time_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("average_occurrence_weekdays_Home_Work_Others"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v56, v960);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setObject:forKeyedSubscript:", v57, CFSTR("average_occurrence_weekdays_Home_Work_Others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("average_occurrence_weekdays_Home_NoWork_Others"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v60, v960);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v61, CFSTR("average_occurrence_weekdays_Home_NoWork_Others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("average_occurrence_weekdays_NoHome_Work_Others"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v64, v960);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setObject:forKeyedSubscript:", v65, CFSTR("average_occurrence_weekdays_NoHome_Work_Others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("average_occurrence_weekdays_NoHome_NoWork_Others"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v68, v960);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v69, CFSTR("average_occurrence_weekdays_NoHome_NoWork_Others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("average_occurrence_weekdays_Home_Work_NoOthers"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v72, v960);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setObject:forKeyedSubscript:", v73, CFSTR("average_occurrence_weekdays_Home_Work_NoOthers_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("average_occurrence_weekdays_Home_NoWork_NoOthers"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v76, v960);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v77, CFSTR("average_occurrence_weekdays_Home_NoWork_NoOthers_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("average_occurrence_weekdays_NoHome_Work_NoOthers"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v80, v960);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v81, CFSTR("average_occurrence_weekdays_NoHome_Work_NoOthers_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("average_occurrence_weekdays_NoHome_NoWork_NoOthers"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v84, v960);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setObject:forKeyedSubscript:", v85, CFSTR("average_occurrence_weekdays_NoHome_NoWork_NoOthers_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("average_occurrence_weekend_Home_Work_Others"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v88, v960);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setObject:forKeyedSubscript:", v89, CFSTR("average_occurrence_weekend_Home_Work_Others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("average_occurrence_weekend_Home_NoWork_Others"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v92, v960);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setObject:forKeyedSubscript:", v93, CFSTR("average_occurrence_weekend_Home_NoWork_Others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("average_occurrence_weekend_NoHome_Work_Others"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v96, v960);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setObject:forKeyedSubscript:", v97, CFSTR("average_occurrence_weekend_NoHome_Work_Others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("average_occurrence_weekend_NoHome_NoWork_Others"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v100, v960);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setObject:forKeyedSubscript:", v101, CFSTR("average_occurrence_weekend_NoHome_NoWork_Others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("average_occurrence_weekend_Home_Work_NoOthers"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v104, v960);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setObject:forKeyedSubscript:", v105, CFSTR("average_occurrence_weekend_Home_Work_NoOthers_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("average_occurrence_weekend_Home_NoWork_NoOthers"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v108, v960);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setObject:forKeyedSubscript:", v109, CFSTR("average_occurrence_weekend_Home_NoWork_NoOthers_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "objectForKeyedSubscript:", CFSTR("average_occurrence_weekend_NoHome_Work_NoOthers"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v112, v960);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setObject:forKeyedSubscript:", v113, CFSTR("average_occurrence_weekend_NoHome_Work_NoOthers_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("average_occurrence_weekend_NoHome_NoWork_NoOthers"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v116, v960);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "setObject:forKeyedSubscript:", v117, CFSTR("average_occurrence_weekend_NoHome_NoWork_NoOthers_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("median_daily_visits_weekdays_home"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v120, v958);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setObject:forKeyedSubscript:", v121, CFSTR("median_daily_visits_weekdays_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("mean_daily_visits_weekdays_home"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v124, v958);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "setObject:forKeyedSubscript:", v125, CFSTR("mean_daily_visits_weekdays_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "objectForKeyedSubscript:", CFSTR("median_daily_visits_weekdays_work"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v128, v958);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "setObject:forKeyedSubscript:", v129, CFSTR("median_daily_visits_weekdays_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "objectForKeyedSubscript:", CFSTR("mean_daily_visits_weekdays_work"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v132, v958);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "setObject:forKeyedSubscript:", v133, CFSTR("mean_daily_visits_weekdays_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "objectForKeyedSubscript:", CFSTR("median_daily_visits_weekdays_others"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v136, v958);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "setObject:forKeyedSubscript:", v137, CFSTR("median_daily_visits_weekdays_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("mean_daily_visits_weekdays_others"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v140, v958);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "setObject:forKeyedSubscript:", v141, CFSTR("mean_daily_visits_weekdays_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("median_daily_visits_weekend_home"));
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v144, v958);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "setObject:forKeyedSubscript:", v145, CFSTR("median_daily_visits_weekend_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "objectForKeyedSubscript:", CFSTR("mean_daily_visits_weekend_home"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v148, v958);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "setObject:forKeyedSubscript:", v149, CFSTR("mean_daily_visits_weekend_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "objectForKeyedSubscript:", CFSTR("median_daily_visits_weekend_work"));
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v152, v958);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "setObject:forKeyedSubscript:", v153, CFSTR("median_daily_visits_weekend_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "objectForKeyedSubscript:", CFSTR("mean_daily_visits_weekend_work"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v156, v958);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "setObject:forKeyedSubscript:", v157, CFSTR("mean_daily_visits_weekend_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "objectForKeyedSubscript:", CFSTR("median_daily_visits_weekend_others"));
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v160, v958);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "setObject:forKeyedSubscript:", v161, CFSTR("median_daily_visits_weekend_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "objectForKeyedSubscript:", CFSTR("mean_daily_visits_weekend_others"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v164, v958);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "setObject:forKeyedSubscript:", v165, CFSTR("mean_daily_visits_weekend_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "objectForKeyedSubscript:", CFSTR("median_visit_duration_weekdays_home"));
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v168, v4);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "setObject:forKeyedSubscript:", v169, CFSTR("median_visit_duration_weekdays_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "objectForKeyedSubscript:", CFSTR("mean_visit_duration_weekdays_home"));
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v172, v4);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "setObject:forKeyedSubscript:", v173, CFSTR("mean_visit_duration_weekdays_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "objectForKeyedSubscript:", CFSTR("median_visit_duration_weekdays_work"));
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v176, v4);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "setObject:forKeyedSubscript:", v177, CFSTR("median_visit_duration_weekdays_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "objectForKeyedSubscript:", CFSTR("mean_visit_duration_weekdays_work"));
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v180, v4);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "setObject:forKeyedSubscript:", v181, CFSTR("mean_visit_duration_weekdays_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "objectForKeyedSubscript:", CFSTR("median_visit_duration_weekdays_others"));
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v184, v4);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "setObject:forKeyedSubscript:", v185, CFSTR("median_visit_duration_weekdays_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "objectForKeyedSubscript:", CFSTR("mean_visit_duration_weekdays_others"));
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v188, v4);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "setObject:forKeyedSubscript:", v189, CFSTR("mean_visit_duration_weekdays_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "objectForKeyedSubscript:", CFSTR("median_visit_duration_weekend_home"));
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v192, v4);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "setObject:forKeyedSubscript:", v193, CFSTR("median_visit_duration_weekend_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "objectForKeyedSubscript:", CFSTR("mean_visit_duration_weekend_home"));
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v196, v4);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "setObject:forKeyedSubscript:", v197, CFSTR("mean_visit_duration_weekend_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "objectForKeyedSubscript:", CFSTR("median_visit_duration_weekend_work"));
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v200, v4);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "setObject:forKeyedSubscript:", v201, CFSTR("median_visit_duration_weekend_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "objectForKeyedSubscript:", CFSTR("mean_visit_duration_weekend_work"));
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v204, v4);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "setObject:forKeyedSubscript:", v205, CFSTR("mean_visit_duration_weekend_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "objectForKeyedSubscript:", CFSTR("median_visit_duration_weekend_others"));
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v208, v4);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "setObject:forKeyedSubscript:", v209, CFSTR("median_visit_duration_weekend_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("mean_visit_duration_weekend_others"));
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v212, v4);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "setObject:forKeyedSubscript:", v213, CFSTR("mean_visit_duration_weekend_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("median_daily_total_visit_duration_weekdays_home"));
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v216, v4);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "setObject:forKeyedSubscript:", v217, CFSTR("median_daily_total_visit_duration_weekdays_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "objectForKeyedSubscript:", CFSTR("mean_daily_total_visit_duration_weekdays_home"));
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v220, v4);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v222, "setObject:forKeyedSubscript:", v221, CFSTR("mean_daily_total_visit_duration_weekdays_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v223, "objectForKeyedSubscript:", CFSTR("median_daily_total_visit_duration_weekdays_work"));
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v224, v4);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v226, "setObject:forKeyedSubscript:", v225, CFSTR("median_daily_total_visit_duration_weekdays_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "objectForKeyedSubscript:", CFSTR("mean_daily_total_visit_duration_weekdays_work"));
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v228, v4);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v230, "setObject:forKeyedSubscript:", v229, CFSTR("mean_daily_total_visit_duration_weekdays_Work_Bucketed"));

  -[RTMetric metrics](self, "metrics");
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v231, "objectForKeyedSubscript:", CFSTR("median_daily_total_visit_duration_weekdays_others"));
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v232, v4);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v234, "setObject:forKeyedSubscript:", v233, CFSTR("median_daily_total_visit_duration_weekdays_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v235, "objectForKeyedSubscript:", CFSTR("mean_daily_total_visit_duration_weekdays_others"));
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v236, v4);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v238, "setObject:forKeyedSubscript:", v237, CFSTR("mean_daily_total_visit_duration_weekdays_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "objectForKeyedSubscript:", CFSTR("median_daily_total_visit_duration_weekend_home"));
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v240, v4);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v242, "setObject:forKeyedSubscript:", v241, CFSTR("median_daily_total_visit_duration_weekend_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v243, "objectForKeyedSubscript:", CFSTR("mean_daily_total_visit_duration_weekend_home"));
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v244, v4);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setObject:forKeyedSubscript:", v245, CFSTR("mean_daily_total_visit_duration_weekend_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v247, "objectForKeyedSubscript:", CFSTR("median_daily_total_visit_duration_weekend_work"));
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v248, v4);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v250, "setObject:forKeyedSubscript:", v249, CFSTR("median_daily_total_visit_duration_weekend_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v251, "objectForKeyedSubscript:", CFSTR("mean_daily_total_visit_duration_weekend_work"));
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v252, v4);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v254, "setObject:forKeyedSubscript:", v253, CFSTR("mean_daily_total_visit_duration_weekend_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v255, "objectForKeyedSubscript:", CFSTR("median_daily_total_visit_duration_weekend_others"));
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v256, v4);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v258, "setObject:forKeyedSubscript:", v257, CFSTR("median_daily_total_visit_duration_weekend_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v259, "objectForKeyedSubscript:", CFSTR("mean_daily_total_visit_duration_weekend_others"));
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v260, v4);
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v262, "setObject:forKeyedSubscript:", v261, CFSTR("mean_daily_total_visit_duration_weekend_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v263, "objectForKeyedSubscript:", CFSTR("median_daily_longest_visit_duration_weekdays_home"));
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v264, v4);
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v266, "setObject:forKeyedSubscript:", v265, CFSTR("median_daily_longest_visit_duration_weekdays_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v267, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_visit_duration_weekdays_home"));
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v268, v4);
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v270, "setObject:forKeyedSubscript:", v269, CFSTR("mean_daily_longest_visit_duration_weekdays_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v271, "objectForKeyedSubscript:", CFSTR("median_daily_longest_visit_duration_weekdays_work"));
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v272, v4);
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "setObject:forKeyedSubscript:", v273, CFSTR("median_daily_longest_visit_duration_weekdays_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v275, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_visit_duration_weekdays_work"));
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v276, v4);
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v278, "setObject:forKeyedSubscript:", v277, CFSTR("mean_daily_longest_visit_duration_weekdays_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("median_daily_longest_visit_duration_weekdays_others"));
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v280, v4);
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v282, "setObject:forKeyedSubscript:", v281, CFSTR("median_daily_longest_visit_duration_weekdays_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v283, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_visit_duration_weekdays_others"));
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v284, v4);
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v286, "setObject:forKeyedSubscript:", v285, CFSTR("mean_daily_longest_visit_duration_weekdays_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v287, "objectForKeyedSubscript:", CFSTR("median_daily_longest_visit_duration_weekend_home"));
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v288, v4);
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v290, "setObject:forKeyedSubscript:", v289, CFSTR("median_daily_longest_visit_duration_weekend_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_visit_duration_weekend_home"));
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v292, v4);
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v294, "setObject:forKeyedSubscript:", v293, CFSTR("mean_daily_longest_visit_duration_weekend_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v295, "objectForKeyedSubscript:", CFSTR("median_daily_longest_visit_duration_weekend_work"));
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v296, v4);
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v298, "setObject:forKeyedSubscript:", v297, CFSTR("median_daily_longest_visit_duration_weekend_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v299, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_visit_duration_weekend_work"));
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v300, v4);
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v302, "setObject:forKeyedSubscript:", v301, CFSTR("mean_daily_longest_visit_duration_weekend_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v303, "objectForKeyedSubscript:", CFSTR("median_daily_longest_visit_duration_weekend_others"));
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v304, v4);
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v306, "setObject:forKeyedSubscript:", v305, CFSTR("median_daily_longest_visit_duration_weekend_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_visit_duration_weekend_others"));
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v308, v4);
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v310, "setObject:forKeyedSubscript:", v309, CFSTR("mean_daily_longest_visit_duration_weekend_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v311, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_charging_home"));
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v312, v313);
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v315, "setObject:forKeyedSubscript:", v314, CFSTR("percentage_of_days_with_charging_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v316, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_charging_work"));
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v317, v318);
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v320, "setObject:forKeyedSubscript:", v319, CFSTR("percentage_of_days_with_charging_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v321, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_charging_others"));
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v322, v323);
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v325, "setObject:forKeyedSubscript:", v324, CFSTR("percentage_of_days_with_charging_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v326, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_staticMotion_home"));
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v327, v328);
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v330, "setObject:forKeyedSubscript:", v329, CFSTR("percentage_of_days_with_static_motion_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v331, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_staticMotion_work"));
  v332 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v332, v333);
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v335, "setObject:forKeyedSubscript:", v334, CFSTR("percentage_of_days_with_static_motion_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v336, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_staticMotion_others"));
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
  v338 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v337, v338);
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v340, "setObject:forKeyedSubscript:", v339, CFSTR("percentage_of_days_with_static_motion_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v341, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_screenLock_home"));
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v342, v343);
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v345, "setObject:forKeyedSubscript:", v344, CFSTR("percentage_of_days_with_screen_lock_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v346, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_screenLock_work"));
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v347, v348);
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v350, "setObject:forKeyedSubscript:", v349, CFSTR("percentage_of_days_with_screen_lock_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v351, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_screenLock_others"));
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v352, v353);
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v355, "setObject:forKeyedSubscript:", v354, CFSTR("percentage_of_days_with_screen_lock_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v356 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v356, "objectForKeyedSubscript:", CFSTR("median_daily_total_charging_duration_home"));
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v358 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v357, v358);
  v359 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v360, "setObject:forKeyedSubscript:", v359, CFSTR("median_daily_total_charging_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v361, "objectForKeyedSubscript:", CFSTR("mean_daily_total_charging_duration_home"));
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v363 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v362, v363);
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v365, "setObject:forKeyedSubscript:", v364, CFSTR("mean_daily_total_charging_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("median_daily_total_charging_duration_work"));
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v368 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v367, v368);
  v369 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v370, "setObject:forKeyedSubscript:", v369, CFSTR("median_daily_total_charging_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v371 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v371, "objectForKeyedSubscript:", CFSTR("mean_daily_total_charging_duration_work"));
  v372 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v372, v373);
  v374 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v375 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v375, "setObject:forKeyedSubscript:", v374, CFSTR("mean_daily_total_charging_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v376 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v376, "objectForKeyedSubscript:", CFSTR("median_daily_total_charging_duration_others"));
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v378 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v377, v378);
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v380, "setObject:forKeyedSubscript:", v379, CFSTR("median_daily_total_charging_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v381, "objectForKeyedSubscript:", CFSTR("mean_daily_total_charging_duration_others"));
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v382, v383);
  v384 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v385, "setObject:forKeyedSubscript:", v384, CFSTR("mean_daily_total_charging_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v386 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v386, "objectForKeyedSubscript:", CFSTR("median_daily_longest_charging_duration_home"));
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v388 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v387, v388);
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v390 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v390, "setObject:forKeyedSubscript:", v389, CFSTR("median_daily_longest_charging_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_charging_duration_home"));
  v392 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v393 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v392, v393);
  v394 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v395 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v395, "setObject:forKeyedSubscript:", v394, CFSTR("mean_daily_longest_charging_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v396, "objectForKeyedSubscript:", CFSTR("median_daily_longest_charging_duration_work"));
  v397 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v398 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v397, v398);
  v399 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v400 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v400, "setObject:forKeyedSubscript:", v399, CFSTR("median_daily_longest_charging_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v401 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v401, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_charging_duration_work"));
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v403 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v402, v403);
  v404 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v405, "setObject:forKeyedSubscript:", v404, CFSTR("mean_daily_longest_charging_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v406 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v406, "objectForKeyedSubscript:", CFSTR("median_daily_longest_charging_duration_others"));
  v407 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v408 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v407, v408);
  v409 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v410, "setObject:forKeyedSubscript:", v409, CFSTR("median_dailylongestchargingdurationothers_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v411, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_charging_duration_others"));
  v412 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v413 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v412, v413);
  v414 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v415 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v415, "setObject:forKeyedSubscript:", v414, CFSTR("mean_daily_longest_charging_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v416 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v416, "objectForKeyedSubscript:", CFSTR("median_daily_total_static_motion_duration_home"));
  v417 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v418 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v417, v418);
  v419 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v420 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v420, "setObject:forKeyedSubscript:", v419, CFSTR("median_daily_total_static_motion_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v421 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v421, "objectForKeyedSubscript:", CFSTR("mean_daily_total_static_motion_duration_home"));
  v422 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v423 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v422, v423);
  v424 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v425 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v425, "setObject:forKeyedSubscript:", v424, CFSTR("mean_daily_total_static_motion_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v426 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v426, "objectForKeyedSubscript:", CFSTR("median_daily_total_static_motion_duration_work"));
  v427 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v428 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v427, v428);
  v429 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v430 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v430, "setObject:forKeyedSubscript:", v429, CFSTR("median_daily_total_static_motion_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v431 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v431, "objectForKeyedSubscript:", CFSTR("mean_daily_total_static_motion_duration_work"));
  v432 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v433 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v432, v433);
  v434 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v435 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v435, "setObject:forKeyedSubscript:", v434, CFSTR("mean_daily_total_static_motion_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v436 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v436, "objectForKeyedSubscript:", CFSTR("median_daily_total_static_motion_duration_others"));
  v437 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v438 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v437, v438);
  v439 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v440 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v440, "setObject:forKeyedSubscript:", v439, CFSTR("median_daily_total_static_motion_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v441 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v441, "objectForKeyedSubscript:", CFSTR("mean_daily_total_static_motion_duration_others"));
  v442 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v443 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v442, v443);
  v444 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v445 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v445, "setObject:forKeyedSubscript:", v444, CFSTR("mean_daily_total_static_motion_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v446 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v446, "objectForKeyedSubscript:", CFSTR("median_daily_longest_static_motion_duration_home"));
  v447 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v448 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v447, v448);
  v449 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v450 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v450, "setObject:forKeyedSubscript:", v449, CFSTR("median_daily_longest_static_motion_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v451 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v451, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_static_motion_duration_home"));
  v452 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v453 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v452, v453);
  v454 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v455 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v455, "setObject:forKeyedSubscript:", v454, CFSTR("mean_daily_longest_static_motion_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v456 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v456, "objectForKeyedSubscript:", CFSTR("median_daily_longest_static_motion_duration_work"));
  v457 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v458 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v457, v458);
  v459 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v460 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v460, "setObject:forKeyedSubscript:", v459, CFSTR("median_daily_longest_static_motion_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v461 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v461, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_static_motion_duration_work"));
  v462 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v463 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v462, v463);
  v464 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v465 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v465, "setObject:forKeyedSubscript:", v464, CFSTR("mean_daily_longest_static_motion_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v466 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v466, "objectForKeyedSubscript:", CFSTR("median_daily_longest_static_motion_duration_others"));
  v467 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v468 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v467, v468);
  v469 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v470 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v470, "setObject:forKeyedSubscript:", v469, CFSTR("median_daily_longest_static_motion_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v471 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v471, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_static_motion_duration_others"));
  v472 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v473 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v472, v473);
  v474 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v475 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v475, "setObject:forKeyedSubscript:", v474, CFSTR("mean_daily_longest_static_motion_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v476 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v476, "objectForKeyedSubscript:", CFSTR("median_daily_total_screen_lock_duration_home"));
  v477 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v478 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v477, v478);
  v479 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v480 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v480, "setObject:forKeyedSubscript:", v479, CFSTR("median_daily_total_screen_lock_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v481 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v481, "objectForKeyedSubscript:", CFSTR("mean_daily_total_screen_lock_duration_home"));
  v482 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v483 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v482, v483);
  v484 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v485 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v485, "setObject:forKeyedSubscript:", v484, CFSTR("mean_daily_total_screen_lock_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v486 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v486, "objectForKeyedSubscript:", CFSTR("median_daily_total_screen_lock_duration_work"));
  v487 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v488 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v487, v488);
  v489 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v490 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v490, "setObject:forKeyedSubscript:", v489, CFSTR("median_daily_total_screen_lock_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v491 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v491, "objectForKeyedSubscript:", CFSTR("mean_daily_total_screen_lock_duration_work"));
  v492 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v493 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v492, v493);
  v494 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v495 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v495, "setObject:forKeyedSubscript:", v494, CFSTR("mean_daily_total_screen_lock_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v496 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v496, "objectForKeyedSubscript:", CFSTR("median_daily_total_screen_lock_duration_others"));
  v497 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v498 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v497, v498);
  v499 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v500 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v500, "setObject:forKeyedSubscript:", v499, CFSTR("median_daily_total_screen_lock_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v501 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v501, "objectForKeyedSubscript:", CFSTR("mean_daily_total_screen_lock_duration_others"));
  v502 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v503 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v502, v503);
  v504 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v505 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v505, "setObject:forKeyedSubscript:", v504, CFSTR("mean_daily_total_screen_lock_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v506 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v506, "objectForKeyedSubscript:", CFSTR("median_daily_longest_screen_lock_duration_home"));
  v507 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v508 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v507, v508);
  v509 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v510 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v510, "setObject:forKeyedSubscript:", v509, CFSTR("median_daily_longest_screen_lock_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v511 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v511, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_screen_lock_duration_home"));
  v512 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v513 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v512, v513);
  v514 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v515 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v515, "setObject:forKeyedSubscript:", v514, CFSTR("mean_daily_longest_screen_lock_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v516 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v516, "objectForKeyedSubscript:", CFSTR("median_daily_longest_screen_lock_duration_work"));
  v517 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v518 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v517, v518);
  v519 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v520 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v520, "setObject:forKeyedSubscript:", v519, CFSTR("median_daily_longest_screen_lock_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v521 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v521, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_screen_lock_duration_work"));
  v522 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v523 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v522, v523);
  v524 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v525 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v525, "setObject:forKeyedSubscript:", v524, CFSTR("mean_daily_longest_screen_lock_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v526 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v526, "objectForKeyedSubscript:", CFSTR("median_daily_longest_screen_lock_duration_others"));
  v527 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v528 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v527, v528);
  v529 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v530 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v530, "setObject:forKeyedSubscript:", v529, CFSTR("median_daily_longest_screen_lock_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v531 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v531, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_screen_lock_duration_others"));
  v532 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v533 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v532, v533);
  v534 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v535 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v535, "setObject:forKeyedSubscript:", v534, CFSTR("mean_daily_longest_screen_lock_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v536 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v536, "objectForKeyedSubscript:", CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration_home"));
  v537 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v538 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v537, v538);
  v539 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v540 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v540, "setObject:forKeyedSubscript:", v539, CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v541 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v541, "objectForKeyedSubscript:", CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration_home"));
  v542 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v543 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v542, v543);
  v544 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v545 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v545, "setObject:forKeyedSubscript:", v544, CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v546 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v546, "objectForKeyedSubscript:", CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio_home"));
  v547 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
  v548 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v547, v548);
  v549 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v550 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v550, "setObject:forKeyedSubscript:", v549, CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v551 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v551, "objectForKeyedSubscript:", CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration_work"));
  v552 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v553 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v552, v553);
  v554 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v555 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v555, "setObject:forKeyedSubscript:", v554, CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v556 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v556, "objectForKeyedSubscript:", CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration_work"));
  v557 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v558 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v557, v558);
  v559 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v560 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v560, "setObject:forKeyedSubscript:", v559, CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v561 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v561, "objectForKeyedSubscript:", CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio_work"));
  v562 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
  v563 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v562, v563);
  v564 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v565 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v565, "setObject:forKeyedSubscript:", v564, CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v566 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v566, "objectForKeyedSubscript:", CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration_others"));
  v567 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v568 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v567, v568);
  v569 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v570 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v570, "setObject:forKeyedSubscript:", v569, CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v571 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v571, "objectForKeyedSubscript:", CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration_others"));
  v572 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v573 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v572, v573);
  v574 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v575 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v575, "setObject:forKeyedSubscript:", v574, CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v576 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v576, "objectForKeyedSubscript:", CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio_others"));
  v577 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
  v578 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v577, v578);
  v579 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v580 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v580, "setObject:forKeyedSubscript:", v579, CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v581 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v581, "objectForKeyedSubscript:", CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration_home"));
  v582 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v583 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v582, v583);
  v584 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v585 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v585, "setObject:forKeyedSubscript:", v584, CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v586 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v586, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration_home"));
  v587 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v588 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v587, v588);
  v589 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v590 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v590, "setObject:forKeyedSubscript:", v589, CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v591 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v591, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection_home"));
  v592 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
  v593 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v592, v593);
  v594 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v595 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v595, "setObject:forKeyedSubscript:", v594, CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v596 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v596, "objectForKeyedSubscript:", CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration_work"));
  v597 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v598 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v597, v598);
  v599 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v600 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v600, "setObject:forKeyedSubscript:", v599, CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v601 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v601, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration_work"));
  v602 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v603 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v602, v603);
  v604 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v605 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v605, "setObject:forKeyedSubscript:", v604, CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v606 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v606, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection_work"));
  v607 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
  v608 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v607, v608);
  v609 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v610 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v610, "setObject:forKeyedSubscript:", v609, CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v611 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v611, "objectForKeyedSubscript:", CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration_others"));
  v612 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v613 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v612, v613);
  v614 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v615 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v615, "setObject:forKeyedSubscript:", v614, CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v616 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v616, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration_others"));
  v617 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v618 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v617, v618);
  v619 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v620 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v620, "setObject:forKeyedSubscript:", v619, CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v621 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v621, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection_others"));
  v622 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
  v623 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v622, v623);
  v624 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v625 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v625, "setObject:forKeyedSubscript:", v624, CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v626 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v626, "objectForKeyedSubscript:", CFSTR("intervalToCalculateStats"));
  v627 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v627, v961);
  v628 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v629 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v629, "setObject:forKeyedSubscript:", v628, CFSTR("intervalToCalculateStats_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v630 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v630, "objectForKeyedSubscript:", CFSTR("numPlacesAfterWeeksWithNonZeroDwellTimePruning"));
  v631 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v631, v958);
  v632 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v633 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v633, "setObject:forKeyedSubscript:", v632, CFSTR("numPlacesAfterWeeksWithNonZeroDwellTimePruning_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v634 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v634, "objectForKeyedSubscript:", CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_home"));
  v635 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v635, v959);
  v636 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v637 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v637, "setObject:forKeyedSubscript:", v636, CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v638 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v638, "objectForKeyedSubscript:", CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_work"));
  v639 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v639, v959);
  v640 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v641 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v641, "setObject:forKeyedSubscript:", v640, CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v642 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v642, "objectForKeyedSubscript:", CFSTR("weeklyTotalDailyVisitCountAverage_home"));
  v643 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v643, v958);
  v644 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v645 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v645, "setObject:forKeyedSubscript:", v644, CFSTR("weeklyTotalDailyVisitCountAverage_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v646 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v646, "objectForKeyedSubscript:", CFSTR("weeklyTotalDailyVisitCountAverage_work"));
  v647 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v647, v958);
  v648 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v649 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v649, "setObject:forKeyedSubscript:", v648, CFSTR("weeklyTotalDailyVisitCountAverage_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v650 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v650, "objectForKeyedSubscript:", CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_home"));
  v651 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v651, v958);
  v652 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v653 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v653, "setObject:forKeyedSubscript:", v652, CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v654 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v654, "objectForKeyedSubscript:", CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_work"));
  v655 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v655, v958);
  v656 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v657 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v657, "setObject:forKeyedSubscript:", v656, CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v658 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v658, "objectForKeyedSubscript:", CFSTR("topMedianDwellTime_home"));
  v659 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v659, v959);
  v660 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v661 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v661, "setObject:forKeyedSubscript:", v660, CFSTR("topMedianDwellTime_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v662 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v662, "objectForKeyedSubscript:", CFSTR("topMedianDwellTime_work"));
  v663 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v663, v959);
  v664 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v665 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v665, "setObject:forKeyedSubscript:", v664, CFSTR("topMedianDwellTime_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v666 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v666, "objectForKeyedSubscript:", CFSTR("weeksWithNonZeroDwellTime_home"));
  v667 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v667, v958);
  v668 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v669 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v669, "setObject:forKeyedSubscript:", v668, CFSTR("weeksWithNonZeroDwellTime_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v670 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v670, "objectForKeyedSubscript:", CFSTR("weeksWithNonZeroDwellTime_work"));
  v671 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v671, v958);
  v672 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v673 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v673, "setObject:forKeyedSubscript:", v672, CFSTR("weeksWithNonZeroDwellTime_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v674 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v674, "objectForKeyedSubscript:", CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_1stPlaceDailyPatterns"));
  v675 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v675, v959);
  v676 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v677 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v677, "setObject:forKeyedSubscript:", v676, CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_1stPlaceDailyPatterns_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v678 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v678, "objectForKeyedSubscript:", CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_2ndPlaceDailyPatterns"));
  v679 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v679, v959);
  v680 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v681 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v681, "setObject:forKeyedSubscript:", v680, CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_2ndPlaceDailyPatterns_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v682 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v682, "objectForKeyedSubscript:", CFSTR("weeklyTotalDailyVisitCountAverage_1stPlaceDailyPatterns"));
  v683 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v683, v958);
  v684 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v685 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v685, "setObject:forKeyedSubscript:", v684, CFSTR("weeklyTotalDailyVisitCountAverage_1stPlaceDailyPatterns_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v686 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v686, "objectForKeyedSubscript:", CFSTR("weeklyTotalDailyVisitCountAverage_2ndPlaceDailyPatterns"));
  v687 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v687, v958);
  v688 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v689 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v689, "setObject:forKeyedSubscript:", v688, CFSTR("weeklyTotalDailyVisitCountAverage_2ndPlaceDailyPatterns_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v690 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v690, "objectForKeyedSubscript:", CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDailyPatterns"));
  v691 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v691, v958);
  v692 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v693 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v693, "setObject:forKeyedSubscript:", v692, CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDailyPatterns_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v694 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v694, "objectForKeyedSubscript:", CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_2ndPlaceDailyPatterns"));
  v695 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v695, v958);
  v696 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v697 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v697, "setObject:forKeyedSubscript:", v696, CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_2ndPlaceDailyPatterns_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v698 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v698, "objectForKeyedSubscript:", CFSTR("numPlacesAfterDailyPatternsPruning"));
  v699 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v699, v958);
  v700 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v701 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v701, "setObject:forKeyedSubscript:", v700, CFSTR("numPlacesAfterDailyPatternsPruning_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v702 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v702, "objectForKeyedSubscript:", CFSTR("homeRankDailyPatterns"));
  v703 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v703, v958);
  v704 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v705 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v705, "setObject:forKeyedSubscript:", v704, CFSTR("homeRankDailyPatterns_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v706 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v706, "objectForKeyedSubscript:", CFSTR("workRankDailyPatterns"));
  v707 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v707, v958);
  v708 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v709 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v709, "setObject:forKeyedSubscript:", v708, CFSTR("workRankDailyPatterns_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v710 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v710, "objectForKeyedSubscript:", CFSTR("weeklyTotalDailyVisitCountAverage_1stPlaceDwellTime"));
  v711 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v711, v958);
  v712 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v713 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v713, "setObject:forKeyedSubscript:", v712, CFSTR("weeklyTotalDailyVisitCountAverage_1stPlaceDwellTime_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v714 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v714, "objectForKeyedSubscript:", CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDwellTime"));
  v715 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v715, v958);
  v716 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v717 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v717, "setObject:forKeyedSubscript:", v716, CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDwellTime_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v718 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v718, "objectForKeyedSubscript:", CFSTR("topMedianDwellTime_1stPlaceDwellTime"));
  v719 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v719, v959);
  v720 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v721 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v721, "setObject:forKeyedSubscript:", v720, CFSTR("topMedianDwellTime_1stPlaceDwellTime_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v722 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v722, "objectForKeyedSubscript:", CFSTR("homeRankDwellTime"));
  v723 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v723, v958);
  v724 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v725 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v725, "setObject:forKeyedSubscript:", v724, CFSTR("homeRankDwellTime_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v726 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v726, "objectForKeyedSubscript:", CFSTR("workRankDwellTime"));
  v727 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v727, v958);
  v728 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v729 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v729, "setObject:forKeyedSubscript:", v728, CFSTR("workRankDwellTime_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v730 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v730, "objectForKeyedSubscript:", CFSTR("SD_visit_time_home"));
  v731 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v731, v3);
  v732 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v733 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v733, "setObject:forKeyedSubscript:", v732, CFSTR("SD_visit_time_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v734 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v734, "objectForKeyedSubscript:", CFSTR("SD_visit_time_work"));
  v735 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v735, v3);
  v736 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v737 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v737, "setObject:forKeyedSubscript:", v736, CFSTR("SD_visit_time_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v738 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v738, "objectForKeyedSubscript:", CFSTR("SD_visit_time_others"));
  v739 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v739, v3);
  v740 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v741 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v741, "setObject:forKeyedSubscript:", v740, CFSTR("SD_visit_time_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v742 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v742, "objectForKeyedSubscript:", CFSTR("SD_daily_visits_weekdays_home"));
  v743 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v743, v958);
  v744 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v745 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v745, "setObject:forKeyedSubscript:", v744, CFSTR("SD_daily_visits_weekdays_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v746 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v746, "objectForKeyedSubscript:", CFSTR("SD_daily_visits_weekdays_work"));
  v747 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v747, v958);
  v748 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v749 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v749, "setObject:forKeyedSubscript:", v748, CFSTR("SD_daily_visits_weekdays_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v750 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v750, "objectForKeyedSubscript:", CFSTR("SD_daily_visits_weekdays_others"));
  v751 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v751, v958);
  v752 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v753 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v753, "setObject:forKeyedSubscript:", v752, CFSTR("SD_daily_visits_weekdays_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v754 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v754, "objectForKeyedSubscript:", CFSTR("SD_daily_visits_weekend_home"));
  v755 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v755, v958);
  v756 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v757 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v757, "setObject:forKeyedSubscript:", v756, CFSTR("SD_daily_visits_weekend_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v758 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v758, "objectForKeyedSubscript:", CFSTR("SD_daily_visits_weekend_work"));
  v759 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v759, v958);
  v760 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v761 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v761, "setObject:forKeyedSubscript:", v760, CFSTR("SD_daily_visits_weekend_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v762 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v762, "objectForKeyedSubscript:", CFSTR("SD_daily_visits_weekend_others"));
  v763 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v763, v958);
  v764 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v765 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v765, "setObject:forKeyedSubscript:", v764, CFSTR("SD_daily_visits_weekend_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v766 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v766, "objectForKeyedSubscript:", CFSTR("SD_visit_duration_weekdays_home"));
  v767 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v767, v4);
  v768 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v769 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v769, "setObject:forKeyedSubscript:", v768, CFSTR("SD_visit_duration_weekdays_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v770 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v770, "objectForKeyedSubscript:", CFSTR("SD_visit_duration_weekdays_work"));
  v771 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v771, v4);
  v772 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v773 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v773, "setObject:forKeyedSubscript:", v772, CFSTR("SD_visit_duration_weekdays_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v774 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v774, "objectForKeyedSubscript:", CFSTR("SD_visit_duration_weekdays_others"));
  v775 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v775, v4);
  v776 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v777 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v777, "setObject:forKeyedSubscript:", v776, CFSTR("SD_visit_duration_weekdays_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v778 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v778, "objectForKeyedSubscript:", CFSTR("SD_visit_duration_weekend_home"));
  v779 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v779, v4);
  v780 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v781 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v781, "setObject:forKeyedSubscript:", v780, CFSTR("SD_visit_duration_weekend_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v782 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v782, "objectForKeyedSubscript:", CFSTR("SD_visit_duration_weekend_work"));
  v783 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v783, v4);
  v784 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v785 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v785, "setObject:forKeyedSubscript:", v784, CFSTR("SD_visit_duration_weekend_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v786 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v786, "objectForKeyedSubscript:", CFSTR("SD_visit_duration_weekend_others"));
  v787 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v787, v4);
  v788 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v789 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v789, "setObject:forKeyedSubscript:", v788, CFSTR("SD_visit_duration_weekend_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v790 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v790, "objectForKeyedSubscript:", CFSTR("SD_daily_total_visit_duration_weekdays_home"));
  v791 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v791, v4);
  v792 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v793 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v793, "setObject:forKeyedSubscript:", v792, CFSTR("SD_daily_total_visit_duration_weekdays_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v794 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v794, "objectForKeyedSubscript:", CFSTR("SD_daily_total_visit_duration_weekdays_work"));
  v795 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v795, v4);
  v796 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v797 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v797, "setObject:forKeyedSubscript:", v796, CFSTR("SD_daily_total_visit_duration_weekdays_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v798 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v798, "objectForKeyedSubscript:", CFSTR("SD_daily_total_visit_duration_weekdays_others"));
  v799 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v799, v4);
  v800 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v801 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v801, "setObject:forKeyedSubscript:", v800, CFSTR("SD_daily_total_visit_duration_weekdays_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v802 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v802, "objectForKeyedSubscript:", CFSTR("SD_daily_total_visit_duration_weekend_home"));
  v803 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v803, v4);
  v804 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v805 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v805, "setObject:forKeyedSubscript:", v804, CFSTR("SD_daily_total_visit_duration_weekend_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v806 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v806, "objectForKeyedSubscript:", CFSTR("SD_daily_total_visit_duration_weekend_work"));
  v807 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v807, v4);
  v808 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v809 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v809, "setObject:forKeyedSubscript:", v808, CFSTR("SD_daily_total_visit_duration_weekend_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v810 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v810, "objectForKeyedSubscript:", CFSTR("SD_daily_total_visit_duration_weekend_others"));
  v811 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v811, v4);
  v812 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v813 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v813, "setObject:forKeyedSubscript:", v812, CFSTR("SD_daily_total_visit_duration_weekend_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v814 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v814, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_visit_duration_weekdays_home"));
  v815 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v815, v4);
  v816 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v817 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v817, "setObject:forKeyedSubscript:", v816, CFSTR("SD_daily_longest_visit_duration_weekdays_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v818 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v818, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_visit_duration_weekdays_work"));
  v819 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v819, v4);
  v820 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v821 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v821, "setObject:forKeyedSubscript:", v820, CFSTR("SD_daily_longest_visit_duration_weekdays_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v822 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v822, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_visit_duration_weekdays_others"));
  v823 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v823, v4);
  v824 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v825 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v825, "setObject:forKeyedSubscript:", v824, CFSTR("SD_daily_longest_visit_duration_weekdays_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v826 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v826, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_visit_duration_weekend_home"));
  v827 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v827, v4);
  v828 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v829 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v829, "setObject:forKeyedSubscript:", v828, CFSTR("SD_daily_longest_visit_duration_weekend_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v830 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v830, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_visit_duration_weekend_work"));
  v831 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v831, v4);
  v832 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v833 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v833, "setObject:forKeyedSubscript:", v832, CFSTR("SD_daily_longest_visit_duration_weekend_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v834 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v834, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_visit_duration_weekend_others"));
  v835 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v835, v4);
  v836 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v837 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v837, "setObject:forKeyedSubscript:", v836, CFSTR("SD_daily_longest_visit_duration_weekend_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v838 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v838, "objectForKeyedSubscript:", CFSTR("SD_daily_total_charging_duration_home"));
  v839 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v840 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v839, v840);
  v841 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v842 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v842, "setObject:forKeyedSubscript:", v841, CFSTR("SD_daily_total_charging_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v843 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v843, "objectForKeyedSubscript:", CFSTR("SD_daily_total_charging_duration_work"));
  v844 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v845 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v844, v845);
  v846 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v847 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v847, "setObject:forKeyedSubscript:", v846, CFSTR("SD_daily_total_charging_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v848 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v848, "objectForKeyedSubscript:", CFSTR("SD_daily_total_charging_duration_others"));
  v849 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v850 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v849, v850);
  v851 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v852 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v852, "setObject:forKeyedSubscript:", v851, CFSTR("SD_daily_total_charging_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v853 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v853, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_charging_duration_home"));
  v854 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v855 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v854, v855);
  v856 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v857 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v857, "setObject:forKeyedSubscript:", v856, CFSTR("SD_daily_longest_charging_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v858 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v858, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_charging_duration_work"));
  v859 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v860 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v859, v860);
  v861 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v862 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v862, "setObject:forKeyedSubscript:", v861, CFSTR("SD_daily_longest_charging_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v863 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v863, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_charging_duration_others"));
  v864 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v865 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v864, v865);
  v866 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v867 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v867, "setObject:forKeyedSubscript:", v866, CFSTR("SD_daily_longest_charging_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v868 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v868, "objectForKeyedSubscript:", CFSTR("SD_daily_total_static_motion_duration_home"));
  v869 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v870 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v869, v870);
  v871 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v872 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v872, "setObject:forKeyedSubscript:", v871, CFSTR("SD_daily_total_static_motion_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v873 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v873, "objectForKeyedSubscript:", CFSTR("SD_daily_total_static_motion_duration_work"));
  v874 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v875 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v874, v875);
  v876 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v877 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v877, "setObject:forKeyedSubscript:", v876, CFSTR("SD_daily_total_static_motion_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v878 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v878, "objectForKeyedSubscript:", CFSTR("SD_daily_total_static_motion_duration_others"));
  v879 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v880 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v879, v880);
  v881 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v882 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v882, "setObject:forKeyedSubscript:", v881, CFSTR("SD_daily_total_static_motion_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v883 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v883, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_static_motion_duration_home"));
  v884 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v885 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v884, v885);
  v886 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v887 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v887, "setObject:forKeyedSubscript:", v886, CFSTR("SD_daily_longest_static_motion_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v888 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v888, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_static_motion_duration_work"));
  v889 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v890 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v889, v890);
  v891 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v892 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v892, "setObject:forKeyedSubscript:", v891, CFSTR("SD_daily_longest_static_motion_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v893 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v893, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_static_motion_duration_others"));
  v894 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v895 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v894, v895);
  v896 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v897 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v897, "setObject:forKeyedSubscript:", v896, CFSTR("SD_daily_longest_static_motion_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v898 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v898, "objectForKeyedSubscript:", CFSTR("SD_daily_total_screen_lock_duration_home"));
  v899 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v900 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v899, v900);
  v901 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v902 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v902, "setObject:forKeyedSubscript:", v901, CFSTR("SD_daily_total_screen_lock_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v903 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v903, "objectForKeyedSubscript:", CFSTR("SD_daily_total_screen_lock_duration_work"));
  v904 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v905 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v904, v905);
  v906 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v907 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v907, "setObject:forKeyedSubscript:", v906, CFSTR("SD_daily_total_screen_lock_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v908 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v908, "objectForKeyedSubscript:", CFSTR("SD_daily_total_screen_lock_duration_others"));
  v909 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v910 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v909, v910);
  v911 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v912 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v912, "setObject:forKeyedSubscript:", v911, CFSTR("SD_daily_total_screen_lock_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v913 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v913, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_screen_lock_duration_home"));
  v914 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v915 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v914, v915);
  v916 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v917 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v917, "setObject:forKeyedSubscript:", v916, CFSTR("SD_daily_longest_screen_lock_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v918 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v918, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_screen_lock_duration_work"));
  v919 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v920 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v919, v920);
  v921 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v922 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v922, "setObject:forKeyedSubscript:", v921, CFSTR("SD_daily_longest_screen_lock_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v923 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v923, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_screen_lock_duration_others"));
  v924 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v925 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v924, v925);
  v926 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v927 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v927, "setObject:forKeyedSubscript:", v926, CFSTR("SD_daily_longest_screen_lock_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v928 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v928, "objectForKeyedSubscript:", CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration_home"));
  v929 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v930 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v929, v930);
  v931 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v932 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v932, "setObject:forKeyedSubscript:", v931, CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v933 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v933, "objectForKeyedSubscript:", CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration_work"));
  v934 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v935 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v934, v935);
  v936 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v937 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v937, "setObject:forKeyedSubscript:", v936, CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v938 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v938, "objectForKeyedSubscript:", CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration_others"));
  v939 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v940 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v939, v940);
  v941 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v942 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v942, "setObject:forKeyedSubscript:", v941, CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration_others_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v943 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v943, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration_home"));
  v944 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v945 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v944, v945);
  v946 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v947 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v947, "setObject:forKeyedSubscript:", v946, CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration_home_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v948 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v948, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration_work"));
  v949 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v950 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v949, v950);
  v951 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v952 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v952, "setObject:forKeyedSubscript:", v951, CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration_work_bucketed"));

  -[RTMetric metrics](self, "metrics");
  v953 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v953, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration_others"));
  v954 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
  v955 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v954, v955);
  v956 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v957 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v957, "setObject:forKeyedSubscript:", v956, CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration_others_bucketed"));

}

- (BOOL)submitMetricsWithError:(id *)a3
{
  objc_super v6;

  -[RTPlaceDataMetrics setDerivedMetrics](self, "setDerivedMetrics");
  v6.receiver = self;
  v6.super_class = (Class)RTPlaceDataMetrics;
  return -[RTMetric submitMetricsWithError:](&v6, sel_submitMetricsWithError_, a3);
}

+ (id)medianOf:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      v4 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "doubleValue");
      objc_msgSend(v4, "numberWithDouble:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v3, "count");
      v8 = (unint64_t)objc_msgSend(v5, "count") >> 1;
      v9 = (void *)MEMORY[0x1E0CB37E8];
      if ((v7 & 1) != 0)
      {
        objc_msgSend(v5, "objectAtIndex:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        objc_msgSend(v9, "numberWithDouble:");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v5, "objectAtIndex:", v8 - 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        v12 = v11;
        objc_msgSend(v5, "objectAtIndex:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        objc_msgSend(v9, "numberWithDouble:", (v12 + v14) * 0.5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  else
  {
    v6 = &unk_1E932CE00;
  }

  return v6;
}

+ (id)meanOf:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  unint64_t v8;
  void *v9;
  double v10;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      v4 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "doubleValue");
      objc_msgSend(v4, "numberWithDouble:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0.0;
      if (objc_msgSend(v3, "count"))
      {
        v8 = 1;
        do
        {
          if (objc_msgSend(v3, "count") >= v8)
          {
            objc_msgSend(v3, "objectAtIndexedSubscript:", v8 - 1);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "doubleValue");
            v7 = v7 + (v10 - v7) / (double)(int)v8;

          }
          else
          {
            v7 = v7 - v7 / (double)(int)v8;
          }
        }
        while (objc_msgSend(v3, "count") > v8++);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = &unk_1E932CE00;
  }

  return v6;
}

+ (id)standardDeviationOf:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      v4 = &unk_1E932CED0;
    }
    else
    {
      +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "doubleValue");
      v7 = v6;

      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = v3;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        v12 = 0.0;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "doubleValue", (_QWORD)v16);
            v12 = v12 + (v14 - v7) * (v14 - v7);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }
      else
      {
        v12 = 0.0;
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqrt(v12 / (double)(unint64_t)objc_msgSend(v8, "count")));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = &unk_1E932CE00;
  }

  return v4;
}

- (int64_t)daysBetweenDate:(id)a3 andDate:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int64_t v12;
  id v14;
  id v15;

  v5 = (void *)MEMORY[0x1E0C99D48];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v8, "rangeOfUnit:startDate:interval:forDate:", 16, &v15, 0, v7);

  v9 = v15;
  v14 = 0;
  objc_msgSend(v8, "rangeOfUnit:startDate:interval:forDate:", 16, &v14, 0, v6);

  v10 = v14;
  objc_msgSend(v8, "components:fromDate:toDate:options:", 16, v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "day") + 1;

  return v12;
}

- (id)removeTimeFromDateTime:(id)a3 withCalendar:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(v5, "components:fromDate:", 1564, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D78]), "init");
  objc_msgSend(v7, "setWeekday:", objc_msgSend(v6, "weekday"));
  objc_msgSend(v7, "setWeekdayOrdinal:", objc_msgSend(v6, "weekdayOrdinal"));
  objc_msgSend(v7, "setDay:", objc_msgSend(v6, "day"));
  objc_msgSend(v7, "setMonth:", objc_msgSend(v6, "month"));
  objc_msgSend(v7, "setYear:", objc_msgSend(v6, "year"));
  objc_msgSend(v5, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)numberOfWeeksBetweenDatesBasedOnCalendar:(id)a3 startDateTime:(id)a4 endDateTime:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v22;
  id v23;

  v23 = 0;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "rangeOfUnit:startDate:interval:forDate:", 16, &v23, 0, v8);
  v10 = v23;
  v22 = 0;
  objc_msgSend(v9, "rangeOfUnit:startDate:interval:forDate:", 16, &v22, 0, v7);
  v11 = v22;
  objc_msgSend(v9, "components:fromDate:toDate:options:", 16, v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "components:fromDate:", 12800, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "components:fromDate:", 12800, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v12, "day");
  v16 = objc_msgSend(v9, "maximumRangeOfUnit:", 512);
  v18 = v17;

  v19 = objc_msgSend(v13, "weekday");
  v20 = (v15 - v16 + v18 + v19 - objc_msgSend(v14, "weekday") + 1) / v18;

  return v20;
}

- (int64_t)convertDateTime2SecondsBasedOnCalendar:(id)a3 dateTime:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;

  objc_msgSend(a3, "components:fromDate:", 224, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hour");
  v6 = objc_msgSend(v4, "minute");
  v7 = 3600 * v5 + 60 * v6 + objc_msgSend(v4, "second");

  return v7;
}

- (id)findHomeWorkOthersIntervals
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  id v13;
  RTLocation *locationWork;
  double v15;
  double v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  double distanceThreshold;
  BOOL v24;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  NSArray *obj;
  uint64_t v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = self->_visitArray;
  v32 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v32)
  {
    v4 = *(_QWORD *)v36;
    v5 = 0x1ED938000uLL;
    v30 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v36 != v4)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v7, "location");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "location");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(uint64_t *)((char *)&self->super.super.isa + *(int *)(v5 + 1124));
        if (v10)
        {
          v34 = 0;
          objc_msgSend(v3, "distanceFromLocation:toLocation:error:", v9, v10, &v34);
          v12 = v11;
          v13 = v34;
        }
        else
        {
          v13 = 0;
          v12 = 1.79769313e308;
        }
        locationWork = self->_locationWork;
        if (locationWork)
        {
          v33 = v13;
          objc_msgSend(v3, "distanceFromLocation:toLocation:error:", v9, locationWork, &v33);
          v16 = v15;
          v17 = v33;

          v13 = v17;
          if (v17)
            goto LABEL_23;
        }
        else
        {
          v16 = 1.79769313e308;
          if (v13)
            goto LABEL_23;
        }
        v18 = v3;
        v19 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v7, "entryDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "exitDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v19, "initWithStartDate:endDate:", v20, v21);

        distanceThreshold = self->_distanceThreshold;
        if (v12 <= distanceThreshold)
        {
          objc_msgSend(v29, "addObject:", v22);
          distanceThreshold = self->_distanceThreshold;
        }
        if (v16 <= distanceThreshold)
        {
          objc_msgSend(v28, "addObject:", v22);
          distanceThreshold = self->_distanceThreshold;
        }
        v24 = v12 <= distanceThreshold || v16 <= distanceThreshold;
        v3 = v18;
        v4 = v30;
        if (!v24)
          objc_msgSend(v27, "addObject:", v22);

        v5 = 0x1ED938000;
LABEL_23:

      }
      v32 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v32);
  }

  objc_msgSend(v26, "setObject:forKeyedSubscript:", v29, CFSTR("Home"));
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("Work"));
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("Others"));

  return v26;
}

- (void)calculateAndSetVisitMetrics
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  unint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  RTLocation *locationHome;
  double v17;
  double v18;
  id v19;
  RTLocation *locationWork;
  double v21;
  double v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id *p_isa;
  unint64_t v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id *v42;
  uint64_t v43;
  int v44;
  double v45;
  double v46;
  uint64_t v47;
  NSObject *v48;
  id *v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  id *v54;
  void *v55;
  void *v56;
  id v57;
  double v58;
  double v59;
  id v60;
  id *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  double v69;
  double v70;
  id v71;
  double distanceThreshold;
  void *v73;
  RTPlaceDataMetrics *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  char v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  char v92;
  id v93;
  id *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  char v108;
  id v109;
  void *v110;
  void *v111;
  unint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  double v119;
  double v120;
  void *v121;
  void *v122;
  void *v123;
  double v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  int v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  const __CFString *v155;
  void *v156;
  void *v157;
  char v158;
  id v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  unint64_t v170;
  int v171;
  double v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  double v177;
  double v178;
  void *v179;
  void *v180;
  double v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  unint64_t v200;
  int v201;
  double v202;
  double v203;
  double v204;
  void *v205;
  void *v206;
  void *v207;
  double v208;
  void *v209;
  double v210;
  void *v211;
  double v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  char *v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  void *v235;
  unsigned int v236;
  int v237;
  int v238;
  void *v239;
  void *v240;
  int v241;
  int v242;
  int v243;
  int v244;
  int v245;
  int v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t j;
  uint64_t v285;
  void *v286;
  int v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t k;
  uint64_t v307;
  void *v308;
  int v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  unint64_t v326;
  double v327;
  double v328;
  double v329;
  double v330;
  double v331;
  double v332;
  void *v333;
  void *v334;
  void *v335;
  id v336;
  id v337;
  void *v338;
  void *v339;
  void *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t m;
  uint64_t v345;
  void *v346;
  int v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  double v353;
  void *v354;
  double v355;
  void *v356;
  double v357;
  void *v358;
  double v359;
  void *v360;
  double v361;
  void *v362;
  double v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t n;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t ii;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t jj;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  void *v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t kk;
  void *v420;
  void *v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  unint64_t v427;
  int v428;
  double v429;
  double v430;
  double v431;
  void *v432;
  void *v433;
  void *v434;
  id v435;
  void *v436;
  void *v437;
  void *v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t mm;
  uint64_t v443;
  void *v444;
  void *v445;
  void *v446;
  void *v447;
  double v448;
  void *v449;
  double v450;
  void *v451;
  double v452;
  void *v453;
  void *v454;
  void *v455;
  void *v456;
  void *v457;
  void *v458;
  unint64_t v459;
  int v460;
  double v461;
  double v462;
  double v463;
  void *v464;
  void *v465;
  void *v466;
  id v467;
  void *v468;
  void *v469;
  void *v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t nn;
  uint64_t v475;
  void *v476;
  void *v477;
  void *v478;
  void *v479;
  double v480;
  void *v481;
  double v482;
  void *v483;
  double v484;
  void *v485;
  void *v486;
  void *v487;
  void *v488;
  void *v489;
  void *v490;
  void *v491;
  uint64_t v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t i1;
  void *v496;
  void *v497;
  void *v498;
  void *v499;
  void *v500;
  void *v501;
  void *v502;
  void *v503;
  void *v504;
  void *v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t i2;
  void *v510;
  void *v511;
  void *v512;
  void *v513;
  void *v514;
  void *v515;
  void *v516;
  void *v517;
  void *v518;
  void *v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t i3;
  void *v524;
  void *v525;
  void *v526;
  void *v527;
  void *v528;
  void *v529;
  void *v530;
  void *v531;
  void *v532;
  void *v533;
  uint64_t v534;
  uint64_t v535;
  uint64_t v536;
  uint64_t i4;
  void *v538;
  void *v539;
  void *v540;
  void *v541;
  void *v542;
  void *v543;
  void *v544;
  void *v545;
  void *v546;
  unint64_t v547;
  int v548;
  const __CFString *v549;
  double v550;
  double v551;
  double v552;
  void *v553;
  void *v554;
  void *v555;
  id v556;
  void *v557;
  void *v558;
  void *v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  uint64_t i5;
  uint64_t v564;
  void *v565;
  void *v566;
  void *v567;
  const __CFString *v568;
  void *v569;
  void *v570;
  double v571;
  void *v572;
  double v573;
  void *v574;
  double v575;
  void *v576;
  void *v577;
  void *v578;
  void *v579;
  void *v580;
  void *v581;
  unint64_t v582;
  int v583;
  const __CFString *v584;
  double v585;
  double v586;
  double v587;
  void *v588;
  void *v589;
  void *v590;
  id v591;
  void *v592;
  void *v593;
  void *v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  uint64_t i6;
  uint64_t v599;
  void *v600;
  void *v601;
  void *v602;
  const __CFString *v603;
  void *v604;
  void *v605;
  double v606;
  void *v607;
  double v608;
  void *v609;
  double v610;
  void *v611;
  void *v612;
  void *v613;
  void *v614;
  void *v615;
  void *v616;
  void *v617;
  uint64_t v618;
  uint64_t v619;
  uint64_t v620;
  uint64_t i7;
  void *v622;
  void *v623;
  void *v624;
  void *v625;
  void *v626;
  void *v627;
  void *v628;
  void *v629;
  void *v630;
  void *v631;
  uint64_t v632;
  uint64_t v633;
  uint64_t v634;
  uint64_t i8;
  void *v636;
  void *v637;
  void *v638;
  void *v639;
  void *v640;
  void *v641;
  void *v642;
  void *v643;
  void *v644;
  void *v645;
  uint64_t v646;
  uint64_t v647;
  uint64_t v648;
  uint64_t i9;
  void *v650;
  void *v651;
  void *v652;
  void *v653;
  void *v654;
  void *v655;
  void *v656;
  void *v657;
  void *v658;
  void *v659;
  uint64_t v660;
  uint64_t v661;
  uint64_t v662;
  uint64_t i10;
  void *v664;
  void *v665;
  void *v666;
  void *v667;
  void *v668;
  void *v669;
  void *v670;
  void *v671;
  void *v672;
  unint64_t v673;
  int v674;
  double v675;
  double v676;
  double v677;
  void *v678;
  void *v679;
  id v680;
  void *v681;
  void *v682;
  void *v683;
  uint64_t v684;
  uint64_t v685;
  uint64_t v686;
  uint64_t i11;
  uint64_t v688;
  void *v689;
  void *v690;
  void *v691;
  void *v692;
  void *v693;
  double v694;
  void *v695;
  double v696;
  void *v697;
  double v698;
  double v699;
  void *v700;
  void *v701;
  void *v702;
  void *v703;
  void *v704;
  void *v705;
  unint64_t v706;
  int v707;
  const __CFString *v708;
  double v709;
  double v710;
  double v711;
  void *v712;
  void *v713;
  void *v714;
  id v715;
  unint64_t v716;
  void *v717;
  const __CFString *v718;
  void *v719;
  void *v720;
  uint64_t v721;
  uint64_t v722;
  uint64_t v723;
  uint64_t i12;
  uint64_t v725;
  void *v726;
  void *v727;
  void *v728;
  void *v729;
  void *v730;
  double v731;
  void *v732;
  double v733;
  void *v734;
  double v735;
  void *v736;
  void *v737;
  void *v738;
  void *v739;
  void *v740;
  void *v741;
  id v742;
  id v743;
  void *v744;
  void *v745;
  double v746;
  double v747;
  double v748;
  double v749;
  double v750;
  double v751;
  double v752;
  double v753;
  char v754;
  int v755;
  int v756;
  int v757;
  void *v758;
  int v759;
  int v760;
  void *v761;
  void *v762;
  void *v763;
  void *v764;
  void *v765;
  int v766;
  id v767;
  id v768;
  void *v769;
  void *v770;
  void *v771;
  id v772;
  uint64_t v773;
  id v774;
  uint64_t v775;
  void *v776;
  void *v777;
  id v778;
  uint64_t v779;
  int v780;
  void *v781;
  id v782;
  uint64_t v783;
  uint64_t v784;
  void *v785;
  int v786;
  id v787;
  uint64_t v788;
  id v789;
  void *v790;
  uint64_t v791;
  id v792;
  int v793;
  uint64_t v794;
  void *v795;
  void *v796;
  id v797;
  unint64_t v798;
  uint64_t v799;
  int v800;
  int v801;
  id v802;
  void *v803;
  uint64_t v804;
  int v805;
  id v806;
  void *v807;
  uint64_t v808;
  int v809;
  id v810;
  void *v811;
  uint64_t v812;
  void *v813;
  id v814;
  void *context;
  char *contexta;
  void *contextb;
  id contextc;
  void *v819;
  uint64_t v820;
  id v821;
  void *v822;
  uint64_t v823;
  id v824;
  uint64_t v825;
  unint64_t v826;
  uint64_t v827;
  id v828;
  void *v829;
  uint64_t v830;
  id v831;
  id v832;
  void *v833;
  void *v834;
  RTPlaceDataMetrics *v835;
  id v836;
  void *v837;
  id v838;
  id v839;
  id v840;
  id v841;
  char *v842;
  id v843;
  id v844;
  id v845;
  id v846;
  id v847;
  id v848;
  id v849;
  void *v850;
  id v851;
  NSArray *obj;
  id obja;
  __int128 v854;
  __int128 v855;
  __int128 v856;
  __int128 v857;
  __int128 v858;
  __int128 v859;
  __int128 v860;
  __int128 v861;
  __int128 v862;
  __int128 v863;
  __int128 v864;
  __int128 v865;
  __int128 v866;
  __int128 v867;
  __int128 v868;
  __int128 v869;
  __int128 v870;
  __int128 v871;
  __int128 v872;
  __int128 v873;
  __int128 v874;
  __int128 v875;
  __int128 v876;
  __int128 v877;
  __int128 v878;
  __int128 v879;
  __int128 v880;
  __int128 v881;
  __int128 v882;
  __int128 v883;
  __int128 v884;
  __int128 v885;
  __int128 v886;
  __int128 v887;
  __int128 v888;
  __int128 v889;
  __int128 v890;
  __int128 v891;
  __int128 v892;
  __int128 v893;
  __int128 v894;
  __int128 v895;
  __int128 v896;
  __int128 v897;
  __int128 v898;
  __int128 v899;
  __int128 v900;
  __int128 v901;
  __int128 v902;
  __int128 v903;
  __int128 v904;
  __int128 v905;
  __int128 v906;
  __int128 v907;
  __int128 v908;
  __int128 v909;
  __int128 v910;
  __int128 v911;
  __int128 v912;
  __int128 v913;
  __int128 v914;
  __int128 v915;
  __int128 v916;
  __int128 v917;
  __int128 v918;
  __int128 v919;
  __int128 v920;
  __int128 v921;
  __int128 v922;
  __int128 v923;
  __int128 v924;
  __int128 v925;
  __int128 v926;
  __int128 v927;
  __int128 v928;
  __int128 v929;
  __int128 v930;
  __int128 v931;
  __int128 v932;
  __int128 v933;
  __int128 v934;
  __int128 v935;
  __int128 v936;
  __int128 v937;
  id v938;
  id v939;
  id v940;
  id v941;
  id v942;
  __int128 v943;
  __int128 v944;
  __int128 v945;
  __int128 v946;
  _BYTE v947[128];
  _BYTE v948[128];
  _BYTE v949[128];
  _BYTE v950[128];
  _BYTE v951[128];
  _BYTE v952[128];
  _BYTE v953[128];
  _BYTE v954[128];
  _BYTE v955[128];
  _BYTE v956[128];
  _BYTE v957[128];
  _BYTE v958[128];
  _BYTE v959[128];
  _BYTE v960[128];
  _BYTE v961[128];
  _BYTE v962[128];
  _BYTE v963[128];
  _BYTE v964[128];
  _BYTE v965[128];
  _BYTE v966[128];
  _BYTE v967[128];
  int v968;
  uint64_t v969;
  __int16 v970;
  uint64_t v971;
  __int16 v972;
  uint64_t v973;
  __int16 v974;
  void *v975;
  _QWORD v976[19];

  v976[16] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = objc_claimAutoreleasedReturnValue();
  -[RTPlaceDataMetrics removeTimeFromDateTime:withCalendar:](self, "removeTimeFromDateTime:withCalendar:", self->_startDateTime, v3);
  v770 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceDataMetrics removeTimeFromDateTime:withCalendar:](self, "removeTimeFromDateTime:withCalendar:", self->_endDateTime, v3);
  v769 = (void *)objc_claimAutoreleasedReturnValue();
  v835 = self;
  v850 = (void *)v3;
  v4 = -[RTPlaceDataMetrics numberOfWeeksBetweenDatesBasedOnCalendar:startDateTime:endDateTime:](self, "numberOfWeeksBetweenDatesBasedOnCalendar:startDateTime:endDateTime:", v3, self->_startDateTime, self->_endDateTime);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v743 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v742 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = 0x1E0C99000uLL;
  v768 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v767 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v851 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v851, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  v832 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v840 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v839 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v838 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v763 = (void *)v4;
  if (v4 >= 1)
  {
    do
    {
      objc_msgSend(v5, "addObject:", &unk_1E9327320);
      objc_msgSend(v6, "addObject:", &unk_1E9327320);
      --v4;
    }
    while (v4);
  }
  v837 = v9;
  v834 = v8;
  v744 = v6;
  v745 = v5;
  v10 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v771 = (void *)objc_claimAutoreleasedReturnValue();
  v943 = 0u;
  v944 = 0u;
  v945 = 0u;
  v946 = 0u;
  obj = v835->_locationsOfOthers;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v943, v976, 16);
  v833 = v10;
  if (v11)
  {
    v12 = v11;
    v836 = 0;
    v13 = *(_QWORD *)v944;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v944 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v943 + 1) + 8 * i);
        locationHome = v835->_locationHome;
        v942 = v836;
        objc_msgSend(v10, "distanceFromLocation:toLocation:error:", v15, locationHome, &v942);
        v18 = v17;
        v19 = v942;

        if (v18 <= v835->_distanceThreshold)
        {
          v836 = v19;
        }
        else
        {
          locationWork = v835->_locationWork;
          v941 = v19;
          objc_msgSend(v10, "distanceFromLocation:toLocation:error:", v15, locationWork, &v941);
          v22 = v21;
          v836 = v941;

          if (v22 > v835->_distanceThreshold)
            objc_msgSend(v771, "addObject:", v15);
        }
        v7 = 0x1E0C99000;
        v10 = v833;
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v943, v976, 16);
    }
    while (v12);
  }
  else
  {
    v836 = 0;
  }

  v23 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v771, "count"))
  {
    v25 = 0;
    do
    {
      v26 = objc_alloc(MEMORY[0x1E0C99E08]);
      v27 = objc_alloc_init(*(Class *)(v23 + 3560));
      v28 = objc_alloc_init(*(Class *)(v7 + 3616));
      v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v32 = (void *)objc_msgSend(v26, "initWithObjectsAndKeys:", &unk_1E9327320, CFSTR("numberOthers"), v27, CFSTR("othersVisitTimeArray"), v28, CFSTR("othersVisitDateSet"), v29, CFSTR("dictNumDailyVisitsOthers"), v30, CFSTR("dictVisitDurationWeekendOthers"), v31, CFSTR("dictVisitDurationWeekdaysOthers"), &unk_1E932CED0, CFSTR("sumDistanceOtherFromOther"), 0);
      objc_msgSend(v24, "addObject:", v32);

      v7 = 0x1E0C99000;
      v23 = 0x1E0C99000;

      ++v25;
    }
    while (objc_msgSend(v771, "count") > v25);
  }
  obja = v24;
  v772 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  p_isa = (id *)&v835->super.super.isa;
  if (!-[NSArray count](v835->_visitArray, "count"))
  {
    v37 = (void *)v3;
    goto LABEL_92;
  }
  v34 = 0;
  v755 = 0;
  v759 = 0;
  v35 = 0.0;
  v36 = 0.0;
  v37 = (void *)v3;
  do
  {
    v38 = v24;
    context = (void *)MEMORY[0x1D8231EA8]();
    objc_msgSend(p_isa[4], "objectAtIndex:", v34);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "entryDate");
    v40 = objc_claimAutoreleasedReturnValue();
    v822 = v39;
    objc_msgSend(v39, "exitDate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "removeTimeFromDateTime:withCalendar:", v40, v37);
    v42 = p_isa;
    v43 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "removeTimeFromDateTime:withCalendar:", v41, v37);
    v829 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v37, "isDateInWeekend:", v40);
    v807 = v41;
    objc_msgSend(v41, "timeIntervalSinceDate:", v40);
    v46 = v45;
    v841 = (id)v43;
    v47 = v43;
    p_isa = v42;
    objc_msgSend(v851, "stringFromDate:", v47);
    v819 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42[8], "earlierDate:", v40);
    v48 = objc_claimAutoreleasedReturnValue();
    v811 = (void *)v40;
    if (v48 != v42[8])
    {
      v24 = v38;
LABEL_23:

      goto LABEL_86;
    }
    v793 = v44;
    v798 = v34;
    v49 = v42;
    objc_msgSend(v42[9], "laterDate:", v40);
    v50 = (id)objc_claimAutoreleasedReturnValue();
    v51 = v49[9];

    if (v50 == v51)
    {
      v783 = objc_msgSend(v49, "convertDateTime2SecondsBasedOnCalendar:dateTime:", v37, v40);
      v52 = objc_msgSend(v49, "numberOfWeeksBetweenDatesBasedOnCalendar:startDateTime:endDateTime:", v37, v49[8], v40);
      v53 = v52 - 1;
      v24 = v38;
      if (v52 < 1 || v52 > (uint64_t)v763)
      {
        v61 = v49;
        v62 = objc_msgSend(v37, "maximumRangeOfUnit:", 512);
        v64 = v63;
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v37, "calendarIdentifier");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v968 = 134218754;
          v969 = v53;
          v970 = 2048;
          v971 = v62;
          v972 = 2048;
          v973 = v64;
          v974 = 2112;
          v975 = v65;
          _os_log_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_INFO, "weekIndx is out of range. weekIndx: %lu, minimum weekday: %lu , maximum weekday: %ld, calendar: %@", (uint8_t *)&v968, 0x2Au);

        }
        v34 = v798;
        p_isa = v61;
        goto LABEL_23;
      }
      v54 = v49;
      if (v49[5])
      {
        objc_msgSend(v822, "location");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "location");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v54[5];
        v940 = v836;
        objc_msgSend(v833, "distanceFromLocation:toLocation:error:", v56, v57, &v940);
        v59 = v58;
        v60 = v940;

        v836 = v60;
      }
      else
      {
        v59 = 1.79769313e308;
      }
      if (v54[6])
      {
        objc_msgSend(v822, "location");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "location");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = v54[6];
        v939 = v836;
        objc_msgSend(v833, "distanceFromLocation:toLocation:error:", v67, v68, &v939);
        v70 = v69;
        v71 = v939;

        v836 = v71;
      }
      else
      {
        v70 = 1.79769313e308;
      }
      p_isa = v54;
      v34 = v798;
      distanceThreshold = *((double *)v54 + 3);
      if (v59 <= distanceThreshold)
      {
        v74 = (RTPlaceDataMetrics *)v54;
        v825 = v53;
        objc_msgSend(v745, "setObject:atIndexedSubscript:", &unk_1E93273F8, v53);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v783);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v743, "addObject:", v75);

        objc_msgSend(v772, "setDay:", 0);
        objc_msgSend(v37, "dateByAddingComponents:toDate:options:", v772, v841, 0);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "earlierDate:", v829);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        if (v77 == v76)
        {
          do
          {
            objc_msgSend(v768, "addObject:", v76);
            objc_msgSend(v851, "stringFromDate:", v76);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v832, "allKeys");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = objc_msgSend(v80, "containsObject:", v79);

            if (v81)
            {
              v82 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v832, "objectForKeyedSubscript:", v79);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "numberWithInt:", objc_msgSend(v83, "intValue") + 1);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v832, "setObject:forKeyedSubscript:", v84, v79);

            }
            else
            {
              objc_msgSend(v832, "setObject:forKeyedSubscript:", &unk_1E93273F8, v79);
            }
            objc_msgSend(v772, "setDay:", objc_msgSend(v772, "day") + 1);
            objc_msgSend(v37, "dateByAddingComponents:toDate:options:", v772, v841, 0);
            v78 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v78, "earlierDate:", v829);
            v85 = (void *)objc_claimAutoreleasedReturnValue();

            v76 = v78;
          }
          while (v85 == v78);
        }
        else
        {
          v78 = v76;
        }
        if (v793)
        {
          objc_msgSend(v837, "allKeys");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = objc_msgSend(v86, "containsObject:", v819);

          if ((v87 & 1) == 0)
          {
            v88 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v837, "setObject:forKeyedSubscript:", v88, v819);

          }
          objc_msgSend(v837, "objectForKeyedSubscript:", v819);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "addObject:", v90);
          v74 = v835;
        }
        else
        {
          objc_msgSend(v840, "allKeys");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = objc_msgSend(v91, "containsObject:", v819);

          if ((v92 & 1) == 0)
          {
            v93 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v840, "setObject:forKeyedSubscript:", v93, v819);

          }
          objc_msgSend(v840, "objectForKeyedSubscript:", v819);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "addObject:", v90);
        }
        v53 = v825;
        v35 = v35 + v59;
        ++v755;

        distanceThreshold = v74->_distanceThreshold;
        v73 = v744;
        v34 = v798;
        p_isa = (id *)&v74->super.super.isa;
      }
      else
      {
        v73 = v744;
      }
      if (v70 <= distanceThreshold)
      {
        v94 = p_isa;
        objc_msgSend(v73, "setObject:atIndexedSubscript:", &unk_1E93273F8, v53);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v783);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v742, "addObject:", v95);

        objc_msgSend(v772, "setDay:", 0);
        objc_msgSend(v37, "dateByAddingComponents:toDate:options:", v772, v841, 0);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "earlierDate:", v829);
        v97 = (void *)objc_claimAutoreleasedReturnValue();

        if (v97 == v96)
        {
          do
          {
            objc_msgSend(v767, "addObject:", v96);
            objc_msgSend(v851, "stringFromDate:", v96);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v834, "allKeys");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = objc_msgSend(v100, "containsObject:", v99);

            if (v101)
            {
              v102 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v834, "objectForKeyedSubscript:", v99);
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "numberWithInt:", objc_msgSend(v103, "intValue") + 1);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v834, "setObject:forKeyedSubscript:", v104, v99);

            }
            else
            {
              objc_msgSend(v834, "setObject:forKeyedSubscript:", &unk_1E93273F8, v99);
            }
            objc_msgSend(v772, "setDay:", objc_msgSend(v772, "day") + 1);
            objc_msgSend(v37, "dateByAddingComponents:toDate:options:", v772, v841, 0);
            v98 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v98, "earlierDate:", v829);
            v105 = (void *)objc_claimAutoreleasedReturnValue();

            v96 = v98;
          }
          while (v105 == v98);
        }
        else
        {
          v98 = v96;
        }
        if (v793)
          v106 = v839;
        else
          v106 = v838;
        objc_msgSend(v106, "allKeys");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = objc_msgSend(v107, "containsObject:", v819);

        if ((v108 & 1) == 0)
        {
          v109 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v106, "setObject:forKeyedSubscript:", v109, v819);

        }
        objc_msgSend(v106, "objectForKeyedSubscript:", v819);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "addObject:", v111);
        v36 = v36 + v70;
        ++v759;

        p_isa = v94;
        distanceThreshold = *((double *)v94 + 3);
        v34 = v798;
      }
      if (v59 > distanceThreshold && v70 > distanceThreshold && objc_msgSend(v771, "count"))
      {
        v112 = 0;
        v113 = v771;
        do
        {
          v114 = v836;
          v115 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(v113, "objectAtIndexedSubscript:", v112);
          v116 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v822, "location");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "location");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          v938 = v836;
          v803 = (void *)v116;
          objc_msgSend(v833, "distanceFromLocation:toLocation:error:", v118, v116, &v938);
          v120 = v119;
          v836 = v938;

          p_isa = (id *)&v835->super.super.isa;
          if (v120 < v835->_distanceThreshold)
          {
            v790 = v115;
            v121 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(obja, "objectAtIndexedSubscript:", v112);
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v122, "objectForKeyedSubscript:", CFSTR("sumDistanceOthersFromOther"));
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "doubleValue");
            objc_msgSend(v121, "numberWithDouble:", v120 + v124);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obja, "objectAtIndexedSubscript:", v112);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v126, "setObject:forKeyedSubscript:", v125, CFSTR("sumDistanceOtherFromOther"));

            v127 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(obja, "objectAtIndexedSubscript:", v112);
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("numberOthers"));
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v127, "numberWithInt:", objc_msgSend(v129, "intValue") + 1);
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obja, "objectAtIndexedSubscript:", v112);
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v131, "setObject:forKeyedSubscript:", v130, CFSTR("numberOthers"));

            objc_msgSend(obja, "objectAtIndexedSubscript:", v112);
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v132, "objectForKeyedSubscript:", CFSTR("othersVisitTimeArray"));
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v783);
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v133, "addObject:", v134);

            objc_msgSend(v772, "setDay:", 0);
            objc_msgSend(v37, "dateByAddingComponents:toDate:options:", v772, v841, 0);
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v135, "earlierDate:", v829);
            v136 = (void *)objc_claimAutoreleasedReturnValue();

            v826 = v112;
            if (v136 == v135)
            {
              do
              {
                objc_msgSend(obja, "objectAtIndexedSubscript:", v112);
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("othersVisitDateSet"));
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v139, "addObject:", v135);

                objc_msgSend(v851, "stringFromDate:", v135);
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(obja, "objectAtIndexedSubscript:", v112);
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("dictNumDailyVisitsOthers"));
                v142 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v142, "allKeys");
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                v144 = objc_msgSend(v143, "containsObject:", v140);

                if (v144)
                {
                  v145 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(obja, "objectAtIndexedSubscript:", v112);
                  v146 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v146, "objectForKeyedSubscript:", CFSTR("dictNumDailyVisitsOthers"));
                  v147 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v147, "objectForKeyedSubscript:", v140);
                  v148 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v145, "numberWithInt:", objc_msgSend(v148, "intValue") + 1);
                  v149 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(obja, "objectAtIndexedSubscript:", v112);
                  v150 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v150, "objectForKeyedSubscript:", CFSTR("dictNumDailyVisitsOthers"));
                  v151 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v151, "setObject:forKeyedSubscript:", v149, v140);

                  v37 = v850;
                }
                else
                {
                  objc_msgSend(obja, "objectAtIndexedSubscript:", v112);
                  v146 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v146, "objectForKeyedSubscript:", CFSTR("dictNumDailyVisitsOthers"));
                  v147 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v147, "setObject:forKeyedSubscript:", &unk_1E93273F8, v140);
                }

                objc_msgSend(v772, "setDay:", objc_msgSend(v772, "day") + 1);
                objc_msgSend(v37, "dateByAddingComponents:toDate:options:", v772, v841, 0);
                v137 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v137, "earlierDate:", v829);
                v152 = (void *)objc_claimAutoreleasedReturnValue();

                v135 = v137;
                v112 = v826;
              }
              while (v152 == v137);
            }
            else
            {
              v137 = v135;
            }
            objc_msgSend(obja, "objectAtIndexedSubscript:", v112);
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            v154 = v153;
            if (v793)
              v155 = CFSTR("dictVisitDurationWeekendOthers");
            else
              v155 = CFSTR("dictVisitDurationWeekdaysOthers");
            objc_msgSend(v153, "objectForKeyedSubscript:", v155);
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v156, "allKeys");
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            v158 = objc_msgSend(v157, "containsObject:", v819);

            if ((v158 & 1) == 0)
            {
              v159 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(obja, "objectAtIndexedSubscript:", v826);
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v160, "objectForKeyedSubscript:", v155);
              v161 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v161, "setObject:forKeyedSubscript:", v159, v819);

            }
            objc_msgSend(obja, "objectAtIndexedSubscript:", v826);
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v162, "objectForKeyedSubscript:", v155);
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v163, "objectForKeyedSubscript:", v819);
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46);
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v164, "addObject:", v165);

            p_isa = (id *)&v835->super.super.isa;
            v112 = v826;
            v115 = v790;
          }

          objc_autoreleasePoolPop(v115);
          ++v112;
          v113 = v771;
        }
        while (objc_msgSend(v771, "count") > v112);
        v24 = obja;
        v34 = v798;
      }
      else
      {
        v24 = obja;
      }
    }
    else
    {
      p_isa = v49;
      v34 = v798;
      v24 = v38;
    }
LABEL_86:

    objc_autoreleasePoolPop(context);
    ++v34;
  }
  while (objc_msgSend(p_isa[4], "count") > v34);
  if (v755 > 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35 / (double)v755);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "metrics");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "setObject:forKeyedSubscript:", v166, CFSTR("mean_distance_homeVisit_from_homeAddress"));

    p_isa = (id *)&v835->super.super.isa;
  }
  if (v759 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36 / (double)v759);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "metrics");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "setObject:forKeyedSubscript:", v168, CFSTR("mean_distance_workVisit_from_workAddress"));

  }
LABEL_92:
  if (objc_msgSend(v24, "count"))
  {
    v170 = 0;
    v171 = 0;
    v172 = 0.0;
    do
    {
      objc_msgSend(v24, "objectAtIndexedSubscript:", v170);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "objectForKeyedSubscript:", CFSTR("numberOthers"));
      v174 = (void *)objc_claimAutoreleasedReturnValue();

      if (v174)
      {
        objc_msgSend(v24, "objectAtIndexedSubscript:", v170);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v175, "objectForKeyedSubscript:", CFSTR("sumDistanceOtherFromOther"));
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v176, "doubleValue");
        v178 = v177;
        objc_msgSend(v24, "objectAtIndexedSubscript:", v170);
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v179, "objectForKeyedSubscript:", CFSTR("numberOthers"));
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "doubleValue");
        v172 = v172 + v178 / v181;

        ++v171;
      }
      ++v170;
    }
    while (objc_msgSend(v24, "count") > v170);
    if (v171 > 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v172 / (double)v171);
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "setObject:forKeyedSubscript:", v182, CFSTR("mean_distance_otherVisit_from_otherAddress"));

    }
  }
  objc_msgSend(v745, "valueForKeyPath:", CFSTR("@avg.self"));
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "setObject:forKeyedSubscript:", v184, CFSTR("weekly_occurrence_rate_home"));

  objc_msgSend(v744, "valueForKeyPath:", CFSTR("@avg.self"));
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", v186, CFSTR("weekly_occurrence_rate_work"));

  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v743);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "setObject:forKeyedSubscript:", v188, CFSTR("mean_visit_time_home"));

  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v743);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "setObject:forKeyedSubscript:", v190, CFSTR("median_visit_time_home"));

  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v743);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "setObject:forKeyedSubscript:", v192, CFSTR("SD_visit_time_home"));

  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v742);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "setObject:forKeyedSubscript:", v194, CFSTR("mean_visit_time_work"));

  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v742);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "setObject:forKeyedSubscript:", v196, CFSTR("median_visit_time_work"));

  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v742);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "setObject:forKeyedSubscript:", v198, CFSTR("SD_visit_time_work"));

  if (objc_msgSend(v24, "count"))
  {
    v200 = 0;
    v201 = 0;
    v202 = 0.0;
    v203 = 0.0;
    v204 = 0.0;
    do
    {
      objc_msgSend(v24, "objectAtIndexedSubscript:", v200);
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "objectForKeyedSubscript:", CFSTR("othersVisitTimeArray"));
      v206 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v206, "count"))
      {
        ++v201;
        +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v206);
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v207, "doubleValue");
        v202 = v202 + v208;

        +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v206);
        v209 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v209, "doubleValue");
        v203 = v203 + v210;

        +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v206);
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v211, "doubleValue");
        v204 = v212;

      }
      ++v200;
    }
    while (objc_msgSend(v24, "count") > v200);
    if (v201 > 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v202 / (double)v201);
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v214, "setObject:forKeyedSubscript:", v213, CFSTR("mean_visit_time_others"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v203 / (double)v201);
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v216, "setObject:forKeyedSubscript:", v215, CFSTR("median_visit_time_others"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v204 / (double)v201);
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v218, "setObject:forKeyedSubscript:", v217, CFSTR("SD_visit_time_others"));

    }
  }
  if (objc_msgSend(v24, "count"))
  {
    v219 = 0;
    v756 = 0;
    v760 = 0;
    v220 = 0.0;
    v221 = 0.0;
    v222 = 0.0;
    v223 = 0.0;
    v224 = 0.0;
    v225 = 0.0;
    v226 = 0.0;
    v746 = 0.0;
    v747 = 0.0;
    v748 = 0.0;
    v749 = 0.0;
    v750 = 0.0;
    v751 = 0.0;
    v752 = 0.0;
    v753 = 0.0;
    v227 = 0.0;
    while (1)
    {
      objc_msgSend(v24, "objectAtIndexedSubscript:", v219);
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v228, "objectForKeyedSubscript:", CFSTR("othersVisitDateSet"));
      v229 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v229, "count"))
        goto LABEL_157;
      objc_msgSend(v772, "setDay:", 0);
      objc_msgSend(v37, "dateByAddingComponents:toDate:options:", v772, v770, 0);
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v230, "earlierDate:", v769);
      v231 = (void *)objc_claimAutoreleasedReturnValue();

      if (v231 != v230)
        goto LABEL_156;
      v764 = v229;
      v842 = v219;
      v232 = 0;
      v233 = 0;
      v773 = 0;
      v775 = 0;
      v779 = 0;
      v784 = 0;
      v788 = 0;
      v791 = 0;
      v794 = 0;
      v799 = 0;
      v804 = 0;
      v808 = 0;
      contexta = 0;
      v820 = 0;
      v827 = 0;
      v830 = 0;
      v823 = 0;
      v812 = 0;
      do
      {
        v234 = v230;
        v235 = (void *)MEMORY[0x1D8231EA8]();
        v236 = objc_msgSend(v37, "isDateInWeekend:", v230);
        v237 = objc_msgSend(v768, "containsObject:", v234);
        v238 = objc_msgSend(v767, "containsObject:", v234);
        objc_msgSend(obja, "objectAtIndexedSubscript:", v842);
        v239 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v239, "objectForKeyedSubscript:", CFSTR("othersVisitDateSet"));
        v240 = (void *)objc_claimAutoreleasedReturnValue();
        v241 = objc_msgSend(v240, "containsObject:", v234);

        v242 = v237 ^ 1 | v238 ^ 1;
        v243 = v241 ^ 1;
        if ((v242 & 1) != 0 || (v243 & 1) != 0)
        {
          v244 = v237 ^ 1 | v238;
          if (((v244 | v243) & 1) != 0)
          {
            v37 = v850;
            goto LABEL_123;
          }
          v37 = v850;
          if (v236)
          {
LABEL_119:
            v244 = 0;
            ++v808;
            goto LABEL_123;
          }
        }
        else
        {
          if ((v236 & 1) != 0)
          {
            ++v804;
            v37 = v850;
            if ((v238 & 1) == 0)
              goto LABEL_119;
LABEL_121:
            v244 = 1;
            goto LABEL_123;
          }
          v37 = v850;
          ++v773;
          if ((v238 & 1) != 0)
            goto LABEL_121;
        }
        v244 = 0;
        ++v775;
LABEL_123:
        v245 = v237 | v238 ^ 1;
        if (((v245 | v243) & 1) != 0)
        {
          v246 = v237 | v238;
          if (((v237 | v238 | v243) & 1) != 0)
            goto LABEL_133;
          if (v236)
          {
LABEL_129:
            v246 = 0;
            ++v820;
            goto LABEL_133;
          }
        }
        else
        {
          if ((v236 & 1) != 0)
          {
            ++contexta;
            if ((v238 & 1) == 0)
              goto LABEL_129;
LABEL_131:
            v246 = 1;
            goto LABEL_133;
          }
          ++v779;
          if ((v238 & 1) != 0)
            goto LABEL_131;
        }
        v246 = 0;
        ++v784;
LABEL_133:
        if (((v242 | v241) & 1) != 0)
        {
          if (((v244 | v241) & 1) != 0)
            goto LABEL_142;
          if (v236)
            goto LABEL_139;
LABEL_141:
          ++v791;
          goto LABEL_142;
        }
        if ((v236 & 1) != 0)
        {
          ++v812;
          if ((v244 & 1) != 0)
            goto LABEL_142;
LABEL_139:
          ++v823;
          goto LABEL_142;
        }
        ++v788;
        if ((v244 & 1) == 0)
          goto LABEL_141;
LABEL_142:
        if (((v245 | v241) & 1) != 0)
        {
          if (((v246 | v241) & 1) != 0)
            goto LABEL_151;
          if (v236)
            goto LABEL_148;
LABEL_150:
          ++v799;
          goto LABEL_151;
        }
        if ((v236 & 1) != 0)
        {
          ++v827;
          if ((v246 & 1) != 0)
            goto LABEL_151;
LABEL_148:
          ++v830;
          goto LABEL_151;
        }
        ++v794;
        if ((v246 & 1) == 0)
          goto LABEL_150;
LABEL_151:
        v233 += v236;
        v232 += v236 ^ 1;
        objc_msgSend(v772, "setDay:", objc_msgSend(v772, "day") + 1);
        objc_msgSend(v37, "dateByAddingComponents:toDate:options:", v772, v770, 0);
        v230 = (void *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v235);
        objc_msgSend(v230, "earlierDate:", v769);
        v247 = (void *)objc_claimAutoreleasedReturnValue();

      }
      while (v247 == v230);
      if (v232)
      {
        ++v756;
        v220 = v220 + (double)v773 / (double)v232;
        v221 = v221 + (double)v775 / (double)v232;
        v222 = v222 + (double)v779 / (double)v232;
        v223 = v223 + (double)v784 / (double)v232;
        v224 = v224 + (double)v788 / (double)v232;
        v225 = v225 + (double)v791 / (double)v232;
        v226 = v226 + (double)v794 / (double)v232;
        v746 = v746 + (double)v799 / (double)v232;
      }
      v24 = obja;
      v219 = v842;
      v229 = v764;
      if (v233)
      {
        ++v760;
        v747 = v747 + (double)v804 / (double)v233;
        v748 = v748 + (double)v808 / (double)v233;
        v749 = v749 + (double)(uint64_t)contexta / (double)v233;
        v750 = v750 + (double)v820 / (double)v233;
        v751 = v751 + (double)v812 / (double)v233;
        v752 = v752 + (double)v823 / (double)v233;
        v753 = v753 + (double)v827 / (double)v233;
        v227 = v227 + (double)v830 / (double)v233;
      }
LABEL_156:

LABEL_157:
      if (objc_msgSend(v24, "count") <= (unint64_t)++v219)
      {
        if (v756 > 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v220 / (double)v756);
          v248 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](v835, "metrics");
          v249 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v249, "setObject:forKeyedSubscript:", v248, CFSTR("average_occurrence_weekdays_Home_Work_Others"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v221 / (double)v756);
          v250 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](v835, "metrics");
          v251 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v251, "setObject:forKeyedSubscript:", v250, CFSTR("average_occurrence_weekdays_Home_NoWork_Others"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v222 / (double)v756);
          v252 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](v835, "metrics");
          v253 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v253, "setObject:forKeyedSubscript:", v252, CFSTR("average_occurrence_weekdays_NoHome_Work_Others"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v223 / (double)v756);
          v254 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](v835, "metrics");
          v255 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v255, "setObject:forKeyedSubscript:", v254, CFSTR("average_occurrence_weekdays_NoHome_NoWork_Others"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v224 / (double)v756);
          v256 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](v835, "metrics");
          v257 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v257, "setObject:forKeyedSubscript:", v256, CFSTR("average_occurrence_weekdays_Home_Work_NoOthers"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v225 / (double)v756);
          v258 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](v835, "metrics");
          v259 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v259, "setObject:forKeyedSubscript:", v258, CFSTR("average_occurrence_weekdays_Home_NoWork_NoOthers"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v226 / (double)v756);
          v260 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](v835, "metrics");
          v261 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v261, "setObject:forKeyedSubscript:", v260, CFSTR("average_occurrence_weekdays_NoHome_Work_NoOthers"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v746 / (double)v756);
          v262 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](v835, "metrics");
          v263 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v263, "setObject:forKeyedSubscript:", v262, CFSTR("average_occurrence_weekdays_NoHome_NoWork_NoOthers"));

        }
        if (v760 >= 1)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v747 / (double)v760);
          v264 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](v835, "metrics");
          v265 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v265, "setObject:forKeyedSubscript:", v264, CFSTR("average_occurrence_weekend_Home_Work_Others"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v748 / (double)v760);
          v266 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](v835, "metrics");
          v267 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v267, "setObject:forKeyedSubscript:", v266, CFSTR("average_occurrence_weekend_Home_NoWork_Others"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v749 / (double)v760);
          v268 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](v835, "metrics");
          v269 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v269, "setObject:forKeyedSubscript:", v268, CFSTR("average_occurrence_weekend_NoHome_Work_Others"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v750 / (double)v760);
          v270 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](v835, "metrics");
          v271 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v271, "setObject:forKeyedSubscript:", v270, CFSTR("average_occurrence_weekend_NoHome_NoWork_Others"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v751 / (double)v760);
          v272 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](v835, "metrics");
          v273 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v273, "setObject:forKeyedSubscript:", v272, CFSTR("average_occurrence_weekend_Home_Work_NoOthers"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v752 / (double)v760);
          v274 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](v835, "metrics");
          v275 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v275, "setObject:forKeyedSubscript:", v274, CFSTR("average_occurrence_weekend_Home_NoWork_NoOthers"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v753 / (double)v760);
          v276 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](v835, "metrics");
          v277 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v277, "setObject:forKeyedSubscript:", v276, CFSTR("average_occurrence_weekend_NoHome_Work_NoOthers"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v227 / (double)v760);
          v278 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](v835, "metrics");
          v279 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v279, "setObject:forKeyedSubscript:", v278, CFSTR("average_occurrence_weekend_NoHome_NoWork_NoOthers"));

        }
        break;
      }
    }
  }
  v831 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v828 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v934 = 0u;
  v935 = 0u;
  v936 = 0u;
  v937 = 0u;
  objc_msgSend(v832, "allKeys");
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  v281 = objc_msgSend(v280, "countByEnumeratingWithState:objects:count:", &v934, v967, 16);
  if (v281)
  {
    v282 = v281;
    v283 = *(_QWORD *)v935;
    do
    {
      for (j = 0; j != v282; ++j)
      {
        if (*(_QWORD *)v935 != v283)
          objc_enumerationMutation(v280);
        v285 = *(_QWORD *)(*((_QWORD *)&v934 + 1) + 8 * j);
        objc_msgSend(v851, "dateFromString:", v285);
        v286 = (void *)objc_claimAutoreleasedReturnValue();
        v287 = objc_msgSend(v37, "isDateInWeekend:", v286);

        objc_msgSend(v832, "objectForKeyedSubscript:", v285);
        v288 = (void *)objc_claimAutoreleasedReturnValue();
        if (v287)
          v289 = v831;
        else
          v289 = v828;
        objc_msgSend(v289, "addObject:", v288);

      }
      v282 = objc_msgSend(v280, "countByEnumeratingWithState:objects:count:", &v934, v967, 16);
    }
    while (v282);
  }

  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v828);
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v291, "setObject:forKeyedSubscript:", v290, CFSTR("mean_daily_visits_weekdays_home"));

  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v828);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v293, "setObject:forKeyedSubscript:", v292, CFSTR("median_daily_visits_weekdays_home"));

  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v828);
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v295, "setObject:forKeyedSubscript:", v294, CFSTR("SD_daily_visits_weekdays_home"));

  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v831);
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v297, "setObject:forKeyedSubscript:", v296, CFSTR("mean_daily_visits_weekend_home"));

  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v831);
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v299, "setObject:forKeyedSubscript:", v298, CFSTR("median_daily_visits_weekend_home"));

  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v831);
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v301, "setObject:forKeyedSubscript:", v300, CFSTR("SD_daily_visits_weekend_home"));

  v824 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v821 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v930 = 0u;
  v931 = 0u;
  v932 = 0u;
  v933 = 0u;
  objc_msgSend(v834, "allKeys");
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  v303 = objc_msgSend(v302, "countByEnumeratingWithState:objects:count:", &v930, v966, 16);
  if (v303)
  {
    v304 = v303;
    v305 = *(_QWORD *)v931;
    do
    {
      for (k = 0; k != v304; ++k)
      {
        if (*(_QWORD *)v931 != v305)
          objc_enumerationMutation(v302);
        v307 = *(_QWORD *)(*((_QWORD *)&v930 + 1) + 8 * k);
        objc_msgSend(v851, "dateFromString:", v307);
        v308 = (void *)objc_claimAutoreleasedReturnValue();
        v309 = objc_msgSend(v37, "isDateInWeekend:", v308);

        objc_msgSend(v834, "objectForKeyedSubscript:", v307);
        v310 = (void *)objc_claimAutoreleasedReturnValue();
        if (v309)
          v311 = v824;
        else
          v311 = v821;
        objc_msgSend(v311, "addObject:", v310);

      }
      v304 = objc_msgSend(v302, "countByEnumeratingWithState:objects:count:", &v930, v966, 16);
    }
    while (v304);
  }

  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v821);
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "setObject:forKeyedSubscript:", v312, CFSTR("mean_daily_visits_weekdays_work"));

  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v821);
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v315, "setObject:forKeyedSubscript:", v314, CFSTR("median_daily_visits_weekdays_work"));

  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v821);
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v317, "setObject:forKeyedSubscript:", v316, CFSTR("SD_daily_visits_weekdays_work"));

  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v824);
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v319, "setObject:forKeyedSubscript:", v318, CFSTR("mean_daily_visits_weekend_work"));

  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v824);
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v321, "setObject:forKeyedSubscript:", v320, CFSTR("median_daily_visits_weekend_work"));

  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v824);
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v323, "setObject:forKeyedSubscript:", v322, CFSTR("SD_daily_visits_weekend_work"));

  v324 = obja;
  v325 = v837;
  if (objc_msgSend(obja, "count"))
  {
    v326 = 0;
    v809 = 0;
    v805 = 0;
    v327 = 0.0;
    v328 = 0.0;
    v329 = 0.0;
    v330 = 0.0;
    v331 = 0.0;
    v332 = 0.0;
    do
    {
      v333 = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(v324, "objectAtIndexedSubscript:", v326);
      v334 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v334, "objectForKeyedSubscript:", CFSTR("dictNumDailyVisitsOthers"));
      v335 = (void *)objc_claimAutoreleasedReturnValue();

      contextb = v335;
      if (objc_msgSend(v335, "count"))
      {
        v813 = v333;
        v336 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v337 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v926 = 0u;
        v927 = 0u;
        v928 = 0u;
        v929 = 0u;
        v843 = (id)v326;
        objc_msgSend(v324, "objectAtIndexedSubscript:", v326);
        v338 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v338, "objectForKeyedSubscript:", CFSTR("dictNumDailyVisitsOthers"));
        v339 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v339, "allKeys");
        v340 = (void *)objc_claimAutoreleasedReturnValue();

        v341 = objc_msgSend(v340, "countByEnumeratingWithState:objects:count:", &v926, v965, 16);
        if (v341)
        {
          v342 = v341;
          v343 = *(_QWORD *)v927;
          do
          {
            for (m = 0; m != v342; ++m)
            {
              if (*(_QWORD *)v927 != v343)
                objc_enumerationMutation(v340);
              v345 = *(_QWORD *)(*((_QWORD *)&v926 + 1) + 8 * m);
              objc_msgSend(v851, "dateFromString:", v345);
              v346 = (void *)objc_claimAutoreleasedReturnValue();
              v347 = objc_msgSend(v850, "isDateInWeekend:", v346);

              objc_msgSend(v324, "objectAtIndexedSubscript:", v843);
              v348 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v348, "objectForKeyedSubscript:", CFSTR("dictNumDailyVisitsOthers"));
              v349 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v349, "objectForKeyedSubscript:", v345);
              v350 = (void *)objc_claimAutoreleasedReturnValue();
              if (v347)
                v351 = v337;
              else
                v351 = v336;
              objc_msgSend(v351, "addObject:", v350);

              v324 = obja;
            }
            v342 = objc_msgSend(v340, "countByEnumeratingWithState:objects:count:", &v926, v965, 16);
          }
          while (v342);
        }

        if (objc_msgSend(v336, "count"))
        {
          +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v336);
          v352 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v352, "doubleValue");
          v332 = v332 + v353;

          +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v336);
          v354 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v354, "doubleValue");
          v331 = v331 + v355;

          +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v336);
          v356 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v356, "doubleValue");
          v330 = v330 + v357;

          ++v805;
        }
        v37 = v850;
        if (objc_msgSend(v337, "count"))
        {
          +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v337);
          v358 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v358, "doubleValue");
          v329 = v329 + v359;

          +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v337);
          v360 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v360, "doubleValue");
          v328 = v328 + v361;

          +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v337);
          v362 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v362, "doubleValue");
          v327 = v327 + v363;

          ++v809;
        }
        v326 = (unint64_t)v843;
        v333 = v813;

        v325 = v837;
      }

      objc_autoreleasePoolPop(v333);
      ++v326;
    }
    while (objc_msgSend(v324, "count") > v326);
    if (v805 > 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v332 / (double)v805);
      v364 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v365 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v365, "setObject:forKeyedSubscript:", v364, CFSTR("mean_daily_visits_weekdays_others"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v331 / (double)v805);
      v366 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v367 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v367, "setObject:forKeyedSubscript:", v366, CFSTR("median_daily_visits_weekdays_others"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v330 / (double)v805);
      v368 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v369 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v369, "setObject:forKeyedSubscript:", v368, CFSTR("SD_daily_visits_weekdays_others"));

    }
    if (v809 >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v329 / (double)v809);
      v370 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v371 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v371, "setObject:forKeyedSubscript:", v370, CFSTR("mean_daily_visits_weekend_others"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v328 / (double)v809);
      v372 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v373 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v373, "setObject:forKeyedSubscript:", v372, CFSTR("median_daily_visits_weekend_others"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v327 / (double)v809);
      v374 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v375 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v375, "setObject:forKeyedSubscript:", v374, CFSTR("SD_daily_visits_weekend_others"));

    }
  }
  contextc = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v922 = 0u;
  v923 = 0u;
  v924 = 0u;
  v925 = 0u;
  objc_msgSend(v325, "allKeys");
  v376 = (void *)objc_claimAutoreleasedReturnValue();
  v377 = objc_msgSend(v376, "countByEnumeratingWithState:objects:count:", &v922, v964, 16);
  if (v377)
  {
    v378 = v377;
    v379 = *(_QWORD *)v923;
    do
    {
      for (n = 0; n != v378; ++n)
      {
        if (*(_QWORD *)v923 != v379)
          objc_enumerationMutation(v376);
        objc_msgSend(v325, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v922 + 1) + 8 * n));
        v381 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(contextc, "addObjectsFromArray:", v381);

      }
      v378 = objc_msgSend(v376, "countByEnumeratingWithState:objects:count:", &v922, v964, 16);
    }
    while (v378);
  }

  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", contextc);
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v383, "setObject:forKeyedSubscript:", v382, CFSTR("median_visit_duration_weekend_home"));

  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", contextc);
  v384 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v385, "setObject:forKeyedSubscript:", v384, CFSTR("mean_visit_duration_weekend_home"));

  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", contextc);
  v386 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v387, "setObject:forKeyedSubscript:", v386, CFSTR("SD_visit_duration_weekend_home"));

  v814 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v918 = 0u;
  v919 = 0u;
  v920 = 0u;
  v921 = 0u;
  v388 = v840;
  objc_msgSend(v840, "allKeys");
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  v390 = objc_msgSend(v389, "countByEnumeratingWithState:objects:count:", &v918, v963, 16);
  if (v390)
  {
    v391 = v390;
    v392 = *(_QWORD *)v919;
    do
    {
      for (ii = 0; ii != v391; ++ii)
      {
        if (*(_QWORD *)v919 != v392)
          objc_enumerationMutation(v389);
        objc_msgSend(v388, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v918 + 1) + 8 * ii));
        v394 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v814, "addObjectsFromArray:", v394);

        v388 = v840;
      }
      v391 = objc_msgSend(v389, "countByEnumeratingWithState:objects:count:", &v918, v963, 16);
    }
    while (v391);
  }

  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v814);
  v395 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v396, "setObject:forKeyedSubscript:", v395, CFSTR("median_visit_duration_weekdays_home"));

  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v814);
  v397 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v398 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v398, "setObject:forKeyedSubscript:", v397, CFSTR("mean_visit_duration_weekdays_home"));

  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v814);
  v399 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v400 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v400, "setObject:forKeyedSubscript:", v399, CFSTR("SD_visit_duration_weekdays_home"));

  v810 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v914 = 0u;
  v915 = 0u;
  v916 = 0u;
  v917 = 0u;
  v401 = v839;
  objc_msgSend(v839, "allKeys");
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  v403 = objc_msgSend(v402, "countByEnumeratingWithState:objects:count:", &v914, v962, 16);
  if (v403)
  {
    v404 = v403;
    v405 = *(_QWORD *)v915;
    do
    {
      for (jj = 0; jj != v404; ++jj)
      {
        if (*(_QWORD *)v915 != v405)
          objc_enumerationMutation(v402);
        objc_msgSend(v401, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v914 + 1) + 8 * jj));
        v407 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v810, "addObjectsFromArray:", v407);

        v401 = v839;
      }
      v404 = objc_msgSend(v402, "countByEnumeratingWithState:objects:count:", &v914, v962, 16);
    }
    while (v404);
  }

  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v810);
  v408 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v409 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v409, "setObject:forKeyedSubscript:", v408, CFSTR("median_visit_duration_weekend_work"));

  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v810);
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v411, "setObject:forKeyedSubscript:", v410, CFSTR("mean_visit_duration_weekend_work"));

  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v810);
  v412 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v413 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v413, "setObject:forKeyedSubscript:", v412, CFSTR("SD_visit_duration_weekend_work"));

  v806 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v910 = 0u;
  v911 = 0u;
  v912 = 0u;
  v913 = 0u;
  v414 = v838;
  objc_msgSend(v838, "allKeys");
  v415 = (void *)objc_claimAutoreleasedReturnValue();
  v416 = objc_msgSend(v415, "countByEnumeratingWithState:objects:count:", &v910, v961, 16);
  if (v416)
  {
    v417 = v416;
    v418 = *(_QWORD *)v911;
    do
    {
      for (kk = 0; kk != v417; ++kk)
      {
        if (*(_QWORD *)v911 != v418)
          objc_enumerationMutation(v415);
        objc_msgSend(v414, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v910 + 1) + 8 * kk));
        v420 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v806, "addObjectsFromArray:", v420);

        v414 = v838;
      }
      v417 = objc_msgSend(v415, "countByEnumeratingWithState:objects:count:", &v910, v961, 16);
    }
    while (v417);
  }

  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v806);
  v421 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v422 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v422, "setObject:forKeyedSubscript:", v421, CFSTR("median_visit_duration_weekdays_work"));

  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v806);
  v423 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v424 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v424, "setObject:forKeyedSubscript:", v423, CFSTR("mean_visit_duration_weekdays_work"));

  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v806);
  v425 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v426 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v426, "setObject:forKeyedSubscript:", v425, CFSTR("SD_visit_duration_weekdays_work"));

  if (objc_msgSend(v324, "count"))
  {
    v427 = 0;
    v428 = 0;
    v429 = 0.0;
    v430 = 0.0;
    v431 = 0.0;
    do
    {
      v432 = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(v324, "objectAtIndexedSubscript:", v427);
      v433 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v433, "objectForKeyedSubscript:", CFSTR("dictVisitDurationWeekendOthers"));
      v434 = (void *)objc_claimAutoreleasedReturnValue();

      v844 = v434;
      if (objc_msgSend(v434, "count"))
      {
        v795 = v432;
        v800 = v428;
        v435 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v906 = 0u;
        v907 = 0u;
        v908 = 0u;
        v909 = 0u;
        objc_msgSend(v324, "objectAtIndexedSubscript:", v427);
        v436 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v436, "objectForKeyedSubscript:", CFSTR("dictVisitDurationWeekendOthers"));
        v437 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v437, "allKeys");
        v438 = (void *)objc_claimAutoreleasedReturnValue();

        v439 = objc_msgSend(v438, "countByEnumeratingWithState:objects:count:", &v906, v960, 16);
        if (v439)
        {
          v440 = v439;
          v441 = *(_QWORD *)v907;
          do
          {
            for (mm = 0; mm != v440; ++mm)
            {
              if (*(_QWORD *)v907 != v441)
                objc_enumerationMutation(v438);
              v443 = *(_QWORD *)(*((_QWORD *)&v906 + 1) + 8 * mm);
              objc_msgSend(obja, "objectAtIndexedSubscript:", v427);
              v444 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v444, "objectForKeyedSubscript:", CFSTR("dictVisitDurationWeekendOthers"));
              v445 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v445, "objectForKeyedSubscript:", v443);
              v446 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v435, "addObjectsFromArray:", v446);

            }
            v440 = objc_msgSend(v438, "countByEnumeratingWithState:objects:count:", &v906, v960, 16);
          }
          while (v440);
        }

        +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v435);
        v447 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v447, "doubleValue");
        v431 = v448;

        +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v435);
        v449 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v449, "doubleValue");
        v430 = v450;

        +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v435);
        v451 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v451, "doubleValue");
        v429 = v452;

        v428 = v800 + 1;
        v37 = v850;
        v325 = v837;
        v324 = obja;
        v432 = v795;
      }

      objc_autoreleasePoolPop(v432);
      ++v427;
    }
    while (objc_msgSend(v324, "count") > v427);
    if (v428 > 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v431 / (double)v428);
      v453 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v454 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v454, "setObject:forKeyedSubscript:", v453, CFSTR("median_visit_duration_weekend_others"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v430 / (double)v428);
      v455 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v456 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v456, "setObject:forKeyedSubscript:", v455, CFSTR("mean_visit_duration_weekend_others"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v429 / (double)v428);
      v457 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v458 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v458, "setObject:forKeyedSubscript:", v457, CFSTR("SD_visit_duration_weekend_others"));

    }
  }
  if (objc_msgSend(v324, "count"))
  {
    v459 = 0;
    v460 = 0;
    v461 = 0.0;
    v462 = 0.0;
    v463 = 0.0;
    do
    {
      v464 = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(v324, "objectAtIndexedSubscript:", v459);
      v465 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v465, "objectForKeyedSubscript:", CFSTR("dictVisitDurationWeekdaysOthers"));
      v466 = (void *)objc_claimAutoreleasedReturnValue();

      v845 = v466;
      if (objc_msgSend(v466, "count"))
      {
        v796 = v464;
        v801 = v460;
        v467 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v902 = 0u;
        v903 = 0u;
        v904 = 0u;
        v905 = 0u;
        objc_msgSend(v324, "objectAtIndexedSubscript:", v459);
        v468 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v468, "objectForKeyedSubscript:", CFSTR("dictVisitDurationWeekdaysOthers"));
        v469 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v469, "allKeys");
        v470 = (void *)objc_claimAutoreleasedReturnValue();

        v471 = objc_msgSend(v470, "countByEnumeratingWithState:objects:count:", &v902, v959, 16);
        if (v471)
        {
          v472 = v471;
          v473 = *(_QWORD *)v903;
          do
          {
            for (nn = 0; nn != v472; ++nn)
            {
              if (*(_QWORD *)v903 != v473)
                objc_enumerationMutation(v470);
              v475 = *(_QWORD *)(*((_QWORD *)&v902 + 1) + 8 * nn);
              objc_msgSend(obja, "objectAtIndexedSubscript:", v459);
              v476 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v476, "objectForKeyedSubscript:", CFSTR("dictVisitDurationWeekdaysOthers"));
              v477 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v477, "objectForKeyedSubscript:", v475);
              v478 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v467, "addObjectsFromArray:", v478);

            }
            v472 = objc_msgSend(v470, "countByEnumeratingWithState:objects:count:", &v902, v959, 16);
          }
          while (v472);
        }

        +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v467);
        v479 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v479, "doubleValue");
        v463 = v480;

        +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v467);
        v481 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v481, "doubleValue");
        v462 = v482;

        +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v467);
        v483 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v483, "doubleValue");
        v461 = v484;

        v460 = v801 + 1;
        v37 = v850;
        v325 = v837;
        v324 = obja;
        v464 = v796;
      }

      objc_autoreleasePoolPop(v464);
      ++v459;
    }
    while (objc_msgSend(v324, "count") > v459);
    if (v460 > 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v463 / (double)v460);
      v485 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v486 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v486, "setObject:forKeyedSubscript:", v485, CFSTR("median_visit_duration_weekdays_others"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v462 / (double)v460);
      v487 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v488 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v488, "setObject:forKeyedSubscript:", v487, CFSTR("mean_visit_duration_weekdays_others"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v461 / (double)v460);
      v489 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v490 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v490, "setObject:forKeyedSubscript:", v489, CFSTR("SD_visit_duration_weekdays_others"));

    }
  }
  v802 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v898 = 0u;
  v899 = 0u;
  v900 = 0u;
  v901 = 0u;
  objc_msgSend(v325, "allKeys");
  v491 = (void *)objc_claimAutoreleasedReturnValue();
  v492 = objc_msgSend(v491, "countByEnumeratingWithState:objects:count:", &v898, v958, 16);
  if (v492)
  {
    v493 = v492;
    v494 = *(_QWORD *)v899;
    do
    {
      for (i1 = 0; i1 != v493; ++i1)
      {
        if (*(_QWORD *)v899 != v494)
          objc_enumerationMutation(v491);
        objc_msgSend(v837, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v898 + 1) + 8 * i1));
        v496 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v496, "valueForKeyPath:", CFSTR("@sum.self"));
        v497 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v802, "addObject:", v497);
      }
      v493 = objc_msgSend(v491, "countByEnumeratingWithState:objects:count:", &v898, v958, 16);
    }
    while (v493);
  }

  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v802);
  v498 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v499 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v499, "setObject:forKeyedSubscript:", v498, CFSTR("median_daily_total_visit_duration_weekend_home"));

  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v802);
  v500 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v501 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v501, "setObject:forKeyedSubscript:", v500, CFSTR("mean_daily_total_visit_duration_weekend_home"));

  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v802);
  v502 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v503 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v503, "setObject:forKeyedSubscript:", v502, CFSTR("SD_daily_total_visit_duration_weekend_home"));

  v797 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v894 = 0u;
  v895 = 0u;
  v896 = 0u;
  v897 = 0u;
  v504 = v840;
  objc_msgSend(v840, "allKeys");
  v505 = (void *)objc_claimAutoreleasedReturnValue();
  v506 = objc_msgSend(v505, "countByEnumeratingWithState:objects:count:", &v894, v957, 16);
  if (v506)
  {
    v507 = v506;
    v508 = *(_QWORD *)v895;
    do
    {
      for (i2 = 0; i2 != v507; ++i2)
      {
        if (*(_QWORD *)v895 != v508)
          objc_enumerationMutation(v505);
        objc_msgSend(v504, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v894 + 1) + 8 * i2));
        v510 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v510, "valueForKeyPath:", CFSTR("@sum.self"));
        v511 = (void *)objc_claimAutoreleasedReturnValue();

        v504 = v840;
        objc_msgSend(v797, "addObject:", v511);

      }
      v507 = objc_msgSend(v505, "countByEnumeratingWithState:objects:count:", &v894, v957, 16);
    }
    while (v507);
  }

  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v797);
  v512 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v513 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v513, "setObject:forKeyedSubscript:", v512, CFSTR("median_daily_total_visit_duration_weekdays_home"));

  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v797);
  v514 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v515 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v515, "setObject:forKeyedSubscript:", v514, CFSTR("mean_daily_total_visit_duration_weekdays_home"));

  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v797);
  v516 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v517 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v517, "setObject:forKeyedSubscript:", v516, CFSTR("SD_daily_total_visit_duration_weekdays_home"));

  v792 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v890 = 0u;
  v891 = 0u;
  v892 = 0u;
  v893 = 0u;
  v518 = v839;
  objc_msgSend(v839, "allKeys");
  v519 = (void *)objc_claimAutoreleasedReturnValue();
  v520 = objc_msgSend(v519, "countByEnumeratingWithState:objects:count:", &v890, v956, 16);
  if (v520)
  {
    v521 = v520;
    v522 = *(_QWORD *)v891;
    do
    {
      for (i3 = 0; i3 != v521; ++i3)
      {
        if (*(_QWORD *)v891 != v522)
          objc_enumerationMutation(v519);
        objc_msgSend(v518, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v890 + 1) + 8 * i3));
        v524 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v524, "valueForKeyPath:", CFSTR("@sum.self"));
        v525 = (void *)objc_claimAutoreleasedReturnValue();

        v518 = v839;
        objc_msgSend(v792, "addObject:", v525);

      }
      v521 = objc_msgSend(v519, "countByEnumeratingWithState:objects:count:", &v890, v956, 16);
    }
    while (v521);
  }

  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v792);
  v526 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v527 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v527, "setObject:forKeyedSubscript:", v526, CFSTR("median_daily_total_visit_duration_weekend_work"));

  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v792);
  v528 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v529 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v529, "setObject:forKeyedSubscript:", v528, CFSTR("mean_daily_total_visit_duration_weekend_work"));

  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v792);
  v530 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v531 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v531, "setObject:forKeyedSubscript:", v530, CFSTR("SD_daily_total_visit_duration_weekend_work"));

  v789 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v886 = 0u;
  v887 = 0u;
  v888 = 0u;
  v889 = 0u;
  v532 = v838;
  objc_msgSend(v838, "allKeys");
  v533 = (void *)objc_claimAutoreleasedReturnValue();
  v534 = objc_msgSend(v533, "countByEnumeratingWithState:objects:count:", &v886, v955, 16);
  if (v534)
  {
    v535 = v534;
    v536 = *(_QWORD *)v887;
    do
    {
      for (i4 = 0; i4 != v535; ++i4)
      {
        if (*(_QWORD *)v887 != v536)
          objc_enumerationMutation(v533);
        objc_msgSend(v532, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v886 + 1) + 8 * i4));
        v538 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v538, "valueForKeyPath:", CFSTR("@sum.self"));
        v539 = (void *)objc_claimAutoreleasedReturnValue();

        v532 = v838;
        objc_msgSend(v789, "addObject:", v539);

      }
      v535 = objc_msgSend(v533, "countByEnumeratingWithState:objects:count:", &v886, v955, 16);
    }
    while (v535);
  }

  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v789);
  v540 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v541 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v541, "setObject:forKeyedSubscript:", v540, CFSTR("median_daily_total_visit_duration_weekdays_work"));

  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v789);
  v542 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v543 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v543, "setObject:forKeyedSubscript:", v542, CFSTR("mean_daily_total_visit_duration_weekdays_work"));

  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v789);
  v544 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v545 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v545, "setObject:forKeyedSubscript:", v544, CFSTR("SD_daily_total_visit_duration_weekdays_work"));

  v546 = obja;
  if (!objc_msgSend(obja, "count"))
    goto LABEL_303;
  v547 = 0;
  v548 = 0;
  v549 = CFSTR("dictVisitDurationWeekendOthers");
  v550 = 0.0;
  v551 = 0.0;
  v552 = 0.0;
  do
  {
    v553 = (void *)MEMORY[0x1D8231EA8]();
    objc_msgSend(v546, "objectAtIndexedSubscript:", v547);
    v554 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v554, "objectForKeyedSubscript:", v549);
    v555 = (void *)objc_claimAutoreleasedReturnValue();

    v785 = v555;
    if (objc_msgSend(v555, "count"))
    {
      v776 = v553;
      v780 = v548;
      v556 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v882 = 0u;
      v883 = 0u;
      v884 = 0u;
      v885 = 0u;
      objc_msgSend(v546, "objectAtIndexedSubscript:", v547);
      v557 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v557, "objectForKeyedSubscript:", v549);
      v558 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v558, "allKeys");
      v559 = (void *)objc_claimAutoreleasedReturnValue();

      v846 = v559;
      v560 = objc_msgSend(v559, "countByEnumeratingWithState:objects:count:", &v882, v954, 16);
      if (v560)
      {
        v561 = v560;
        v562 = *(_QWORD *)v883;
        do
        {
          for (i5 = 0; i5 != v561; ++i5)
          {
            if (*(_QWORD *)v883 != v562)
              objc_enumerationMutation(v846);
            v564 = *(_QWORD *)(*((_QWORD *)&v882 + 1) + 8 * i5);
            objc_msgSend(v546, "objectAtIndexedSubscript:", v547);
            v565 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v565, "objectForKeyedSubscript:", v549);
            v566 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v566, "objectForKeyedSubscript:", v564);
            v567 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v567, "valueForKeyPath:", CFSTR("@sum.self"));
            v568 = v549;
            v569 = (void *)objc_claimAutoreleasedReturnValue();

            v546 = obja;
            objc_msgSend(v556, "addObject:", v569);

            v549 = v568;
          }
          v561 = objc_msgSend(v846, "countByEnumeratingWithState:objects:count:", &v882, v954, 16);
        }
        while (v561);
      }

      +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v556);
      v570 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v570, "doubleValue");
      v552 = v571;

      +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v556);
      v572 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v572, "doubleValue");
      v551 = v573;

      +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v556);
      v574 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v574, "doubleValue");
      v550 = v575;

      v548 = v780 + 1;
      v37 = v850;
      v553 = v776;
    }

    objc_autoreleasePoolPop(v553);
    ++v547;
  }
  while (objc_msgSend(v546, "count") > v547);
  if (v548 > 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v552 / (double)v548);
    v576 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v835, "metrics");
    v577 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v577, "setObject:forKeyedSubscript:", v576, CFSTR("median_daily_total_visit_duration_weekend_others"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v551 / (double)v548);
    v578 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v835, "metrics");
    v579 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v579, "setObject:forKeyedSubscript:", v578, CFSTR("mean_daily_total_visit_duration_weekend_others"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v550 / (double)v548);
    v580 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v835, "metrics");
    v581 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v581, "setObject:forKeyedSubscript:", v580, CFSTR("SD_daily_total_visit_duration_weekend_others"));

    v754 = 1;
  }
  else
  {
LABEL_303:
    v754 = 0;
  }
  if (objc_msgSend(v546, "count"))
  {
    v582 = 0;
    v583 = 0;
    v584 = CFSTR("dictVisitDurationWeekdaysOthers");
    v585 = 0.0;
    v586 = 0.0;
    v587 = 0.0;
    do
    {
      v588 = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(v546, "objectAtIndexedSubscript:", v582);
      v589 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v589, "objectForKeyedSubscript:", v584);
      v590 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v590, "count"))
      {
        v777 = v590;
        v781 = v588;
        v786 = v583;
        v591 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v878 = 0u;
        v879 = 0u;
        v880 = 0u;
        v881 = 0u;
        objc_msgSend(v546, "objectAtIndexedSubscript:", v582);
        v592 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v592, "objectForKeyedSubscript:", v584);
        v593 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v593, "allKeys");
        v594 = (void *)objc_claimAutoreleasedReturnValue();

        v847 = v594;
        v595 = objc_msgSend(v594, "countByEnumeratingWithState:objects:count:", &v878, v953, 16);
        if (v595)
        {
          v596 = v595;
          v597 = *(_QWORD *)v879;
          do
          {
            for (i6 = 0; i6 != v596; ++i6)
            {
              if (*(_QWORD *)v879 != v597)
                objc_enumerationMutation(v847);
              v599 = *(_QWORD *)(*((_QWORD *)&v878 + 1) + 8 * i6);
              objc_msgSend(v546, "objectAtIndexedSubscript:", v582);
              v600 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v600, "objectForKeyedSubscript:", v584);
              v601 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v601, "objectForKeyedSubscript:", v599);
              v602 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v602, "valueForKeyPath:", CFSTR("@sum.self"));
              v603 = v584;
              v604 = (void *)objc_claimAutoreleasedReturnValue();

              v546 = obja;
              objc_msgSend(v591, "addObject:", v604);

              v584 = v603;
            }
            v596 = objc_msgSend(v847, "countByEnumeratingWithState:objects:count:", &v878, v953, 16);
          }
          while (v596);
        }

        +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v591);
        v605 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v605, "doubleValue");
        v587 = v606;

        +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v591);
        v607 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v607, "doubleValue");
        v586 = v608;

        +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v591);
        v609 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v609, "doubleValue");
        v585 = v610;

        v583 = v786 + 1;
        v37 = v850;
        v590 = v777;
        v588 = v781;
      }

      objc_autoreleasePoolPop(v588);
      ++v582;
    }
    while (objc_msgSend(v546, "count") > v582);
    if (v583 > 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v587 / (double)v583);
      v611 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v612 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v612, "setObject:forKeyedSubscript:", v611, CFSTR("median_daily_total_visit_duration_weekdays_others"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v586 / (double)v583);
      v613 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v614 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v614, "setObject:forKeyedSubscript:", v613, CFSTR("mean_daily_total_visit_duration_weekdays_others"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v585 / (double)v583);
      v615 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v616 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v616, "setObject:forKeyedSubscript:", v615, CFSTR("SD_daily_total_visit_duration_weekdays_others"));

    }
  }
  v787 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v874 = 0u;
  v875 = 0u;
  v876 = 0u;
  v877 = 0u;
  objc_msgSend(v837, "allKeys");
  v617 = (void *)objc_claimAutoreleasedReturnValue();
  v618 = objc_msgSend(v617, "countByEnumeratingWithState:objects:count:", &v874, v952, 16);
  if (v618)
  {
    v619 = v618;
    v620 = *(_QWORD *)v875;
    do
    {
      for (i7 = 0; i7 != v619; ++i7)
      {
        if (*(_QWORD *)v875 != v620)
          objc_enumerationMutation(v617);
        objc_msgSend(v837, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v874 + 1) + 8 * i7));
        v622 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v622, "valueForKeyPath:", CFSTR("@max.doubleValue"));
        v623 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v787, "addObject:", v623);
      }
      v619 = objc_msgSend(v617, "countByEnumeratingWithState:objects:count:", &v874, v952, 16);
    }
    while (v619);
  }

  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v787);
  v624 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v625 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v625, "setObject:forKeyedSubscript:", v624, CFSTR("median_daily_longest_visit_duration_weekend_home"));

  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v787);
  v626 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v627 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v627, "setObject:forKeyedSubscript:", v626, CFSTR("mean_daily_longest_visit_duration_weekend_home"));

  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v787);
  v628 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v629 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v629, "setObject:forKeyedSubscript:", v628, CFSTR("SD_daily_longest_visit_duration_weekend_home"));

  v782 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v870 = 0u;
  v871 = 0u;
  v872 = 0u;
  v873 = 0u;
  v630 = v840;
  objc_msgSend(v840, "allKeys");
  v631 = (void *)objc_claimAutoreleasedReturnValue();
  v632 = objc_msgSend(v631, "countByEnumeratingWithState:objects:count:", &v870, v951, 16);
  if (v632)
  {
    v633 = v632;
    v634 = *(_QWORD *)v871;
    do
    {
      for (i8 = 0; i8 != v633; ++i8)
      {
        if (*(_QWORD *)v871 != v634)
          objc_enumerationMutation(v631);
        objc_msgSend(v630, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v870 + 1) + 8 * i8));
        v636 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v636, "valueForKeyPath:", CFSTR("@max.doubleValue"));
        v637 = (void *)objc_claimAutoreleasedReturnValue();

        v630 = v840;
        objc_msgSend(v782, "addObject:", v637);

      }
      v633 = objc_msgSend(v631, "countByEnumeratingWithState:objects:count:", &v870, v951, 16);
    }
    while (v633);
  }

  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v782);
  v638 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v639 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v639, "setObject:forKeyedSubscript:", v638, CFSTR("median_daily_longest_visit_duration_weekdays_home"));

  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v782);
  v640 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v641 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v641, "setObject:forKeyedSubscript:", v640, CFSTR("mean_daily_longest_visit_duration_weekdays_home"));

  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v782);
  v642 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v643 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v643, "setObject:forKeyedSubscript:", v642, CFSTR("SD_daily_longest_visit_duration_weekdays_home"));

  v778 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v866 = 0u;
  v867 = 0u;
  v868 = 0u;
  v869 = 0u;
  v644 = v839;
  objc_msgSend(v839, "allKeys");
  v645 = (void *)objc_claimAutoreleasedReturnValue();
  v646 = objc_msgSend(v645, "countByEnumeratingWithState:objects:count:", &v866, v950, 16);
  if (v646)
  {
    v647 = v646;
    v648 = *(_QWORD *)v867;
    do
    {
      for (i9 = 0; i9 != v647; ++i9)
      {
        if (*(_QWORD *)v867 != v648)
          objc_enumerationMutation(v645);
        objc_msgSend(v644, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v866 + 1) + 8 * i9));
        v650 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v650, "valueForKeyPath:", CFSTR("@max.doubleValue"));
        v651 = (void *)objc_claimAutoreleasedReturnValue();

        v644 = v839;
        objc_msgSend(v778, "addObject:", v651);

      }
      v647 = objc_msgSend(v645, "countByEnumeratingWithState:objects:count:", &v866, v950, 16);
    }
    while (v647);
  }

  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v778);
  v652 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v653 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v653, "setObject:forKeyedSubscript:", v652, CFSTR("median_daily_longest_visit_duration_weekend_work"));

  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v778);
  v654 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v655 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v655, "setObject:forKeyedSubscript:", v654, CFSTR("mean_daily_longest_visit_duration_weekend_work"));

  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v778);
  v656 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v657 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v657, "setObject:forKeyedSubscript:", v656, CFSTR("SD_daily_longest_visit_duration_weekend_work"));

  v774 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v862 = 0u;
  v863 = 0u;
  v864 = 0u;
  v865 = 0u;
  v658 = v838;
  objc_msgSend(v838, "allKeys");
  v659 = (void *)objc_claimAutoreleasedReturnValue();
  v660 = objc_msgSend(v659, "countByEnumeratingWithState:objects:count:", &v862, v949, 16);
  if (v660)
  {
    v661 = v660;
    v662 = *(_QWORD *)v863;
    do
    {
      for (i10 = 0; i10 != v661; ++i10)
      {
        if (*(_QWORD *)v863 != v662)
          objc_enumerationMutation(v659);
        objc_msgSend(v658, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v862 + 1) + 8 * i10));
        v664 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v664, "valueForKeyPath:", CFSTR("@max.doubleValue"));
        v665 = (void *)objc_claimAutoreleasedReturnValue();

        v658 = v838;
        objc_msgSend(v774, "addObject:", v665);

      }
      v661 = objc_msgSend(v659, "countByEnumeratingWithState:objects:count:", &v862, v949, 16);
    }
    while (v661);
  }

  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v774);
  v666 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v667 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v667, "setObject:forKeyedSubscript:", v666, CFSTR("median_daily_longest_visit_duration_weekdays_work"));

  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v774);
  v668 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v669 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v669, "setObject:forKeyedSubscript:", v668, CFSTR("mean_daily_longest_visit_duration_weekdays_work"));

  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v774);
  v670 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v835, "metrics");
  v671 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v671, "setObject:forKeyedSubscript:", v670, CFSTR("SD_daily_longest_visit_duration_weekdays_work"));

  v672 = obja;
  if (objc_msgSend(obja, "count"))
  {
    v673 = 0;
    v674 = 0;
    v675 = 0.0;
    v676 = 0.0;
    v677 = 0.0;
    do
    {
      v765 = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(v672, "objectAtIndexedSubscript:", v673);
      v678 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v678, "objectForKeyedSubscript:", CFSTR("dictVisitDurationWeekendOthers"));
      v679 = (void *)objc_claimAutoreleasedReturnValue();

      v761 = v679;
      if (objc_msgSend(v679, "count"))
      {
        v757 = v674;
        v680 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v858 = 0u;
        v859 = 0u;
        v860 = 0u;
        v861 = 0u;
        objc_msgSend(v672, "objectAtIndexedSubscript:", v673);
        v681 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v681, "objectForKeyedSubscript:", CFSTR("dictVisitDurationWeekendOthers"));
        v682 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v682, "allKeys");
        v683 = (void *)objc_claimAutoreleasedReturnValue();

        v848 = v683;
        v684 = objc_msgSend(v683, "countByEnumeratingWithState:objects:count:", &v858, v948, 16);
        if (v684)
        {
          v685 = v684;
          v686 = *(_QWORD *)v859;
          do
          {
            for (i11 = 0; i11 != v685; ++i11)
            {
              if (*(_QWORD *)v859 != v686)
                objc_enumerationMutation(v848);
              v688 = *(_QWORD *)(*((_QWORD *)&v858 + 1) + 8 * i11);
              objc_msgSend(v672, "objectAtIndexedSubscript:", v673);
              v689 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v689, "objectForKeyedSubscript:", CFSTR("dictVisitDurationWeekendOthers"));
              v690 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v690, "objectForKeyedSubscript:", v688);
              v691 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v691, "valueForKeyPath:", CFSTR("@max.doubleValue"));
              v692 = (void *)objc_claimAutoreleasedReturnValue();

              v672 = obja;
              objc_msgSend(v680, "addObject:", v692);

            }
            v685 = objc_msgSend(v848, "countByEnumeratingWithState:objects:count:", &v858, v948, 16);
          }
          while (v685);
        }

        +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v680);
        v693 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v693, "doubleValue");
        v677 = v694;

        +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v680);
        v695 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v695, "doubleValue");
        v676 = v696;

        +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v680);
        v697 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v697, "doubleValue");
        v675 = v698;

        v674 = v757 + 1;
        v37 = v850;
      }

      objc_autoreleasePoolPop(v765);
      ++v673;
    }
    while (objc_msgSend(v672, "count") > v673);
  }
  else
  {
    v674 = 0;
    v677 = 0.0;
    v676 = 0.0;
    v675 = 0.0;
  }
  if ((v754 & 1) != 0)
  {
    v699 = (double)v674;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v677 / (double)v674);
    v700 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v835, "metrics");
    v701 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v701, "setObject:forKeyedSubscript:", v700, CFSTR("median_daily_longest_visit_duration_weekend_others"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v676 / v699);
    v702 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v835, "metrics");
    v703 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v703, "setObject:forKeyedSubscript:", v702, CFSTR("mean_daily_longest_visit_duration_weekend_others"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v675 / v699);
    v704 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v835, "metrics");
    v705 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v705, "setObject:forKeyedSubscript:", v704, CFSTR("SD_daily_longest_visit_duration_weekend_others"));

  }
  if (objc_msgSend(v672, "count"))
  {
    v706 = 0;
    v707 = 0;
    v708 = CFSTR("dictVisitDurationWeekdaysOthers");
    v709 = 0.0;
    v710 = 0.0;
    v711 = 0.0;
    do
    {
      v712 = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(v672, "objectAtIndexedSubscript:", v706);
      v713 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v713, "objectForKeyedSubscript:", v708);
      v714 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v714, "count"))
      {
        v758 = v714;
        v762 = v712;
        v766 = v707;
        v715 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v854 = 0u;
        v855 = 0u;
        v856 = 0u;
        v857 = 0u;
        v716 = v706;
        objc_msgSend(v672, "objectAtIndexedSubscript:", v706);
        v717 = (void *)objc_claimAutoreleasedReturnValue();
        v718 = v708;
        objc_msgSend(v717, "objectForKeyedSubscript:", v708);
        v719 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v719, "allKeys");
        v720 = (void *)objc_claimAutoreleasedReturnValue();

        v849 = v720;
        v721 = objc_msgSend(v720, "countByEnumeratingWithState:objects:count:", &v854, v947, 16);
        if (v721)
        {
          v722 = v721;
          v723 = *(_QWORD *)v855;
          do
          {
            for (i12 = 0; i12 != v722; ++i12)
            {
              if (*(_QWORD *)v855 != v723)
                objc_enumerationMutation(v849);
              v725 = *(_QWORD *)(*((_QWORD *)&v854 + 1) + 8 * i12);
              objc_msgSend(v672, "objectAtIndexedSubscript:", v716);
              v726 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v726, "objectForKeyedSubscript:", v718);
              v727 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v727, "objectForKeyedSubscript:", v725);
              v728 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v728, "valueForKeyPath:", CFSTR("@max.doubleValue"));
              v729 = (void *)objc_claimAutoreleasedReturnValue();

              v672 = obja;
              objc_msgSend(v715, "addObject:", v729);

            }
            v722 = objc_msgSend(v849, "countByEnumeratingWithState:objects:count:", &v854, v947, 16);
          }
          while (v722);
        }

        +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v715);
        v730 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v730, "doubleValue");
        v711 = v731;

        +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v715);
        v732 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v732, "doubleValue");
        v710 = v733;

        +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v715);
        v734 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v734, "doubleValue");
        v709 = v735;

        v707 = v766 + 1;
        v37 = v850;
        v708 = v718;
        v706 = v716;
        v714 = v758;
        v712 = v762;
      }

      objc_autoreleasePoolPop(v712);
      ++v706;
    }
    while (objc_msgSend(v672, "count") > v706);
    if (v707 > 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v711 / (double)v707);
      v736 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v737 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v737, "setObject:forKeyedSubscript:", v736, CFSTR("median_daily_longest_visit_duration_weekdays_others"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v710 / (double)v707);
      v738 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v739 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v739, "setObject:forKeyedSubscript:", v738, CFSTR("mean_daily_longest_visit_duration_weekdays_others"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v709 / (double)v707);
      v740 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMetric metrics](v835, "metrics");
      v741 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v741, "setObject:forKeyedSubscript:", v740, CFSTR("SD_daily_longest_visit_duration_weekdays_others"));

    }
  }

}

- (void)setCurrentInferenceReplayableMetricsFromDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intervalToCalculateStats"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("intervalToCalculateStats"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numPlacesAfterWeeksWithNonZeroDwellTimePruning"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("numPlacesAfterWeeksWithNonZeroDwellTimePruning"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("agreeDailyPatternsAndDwellTimeOnHome"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("agreeDailyPatternsAndDwellTimeOnHome"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_home"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_home"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_work"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_work"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weeklyTotalDailyVisitCountAverage_home"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("weeklyTotalDailyVisitCountAverage_home"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weeklyTotalDailyVisitCountAverage_work"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("weeklyTotalDailyVisitCountAverage_work"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_home"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_home"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_work"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_work"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topMedianDwellTime_home"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("topMedianDwellTime_home"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topMedianDwellTime_work"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, CFSTR("topMedianDwellTime_work"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weeksWithNonZeroDwellTime_home"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, CFSTR("weeksWithNonZeroDwellTime_home"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weeksWithNonZeroDwellTime_work"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, CFSTR("weeksWithNonZeroDwellTime_work"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_1stPlaceDailyPatterns"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_1stPlaceDailyPatterns"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_2ndPlaceDailyPatterns"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_2ndPlaceDailyPatterns"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weeklyTotalDailyVisitCountAverage_1stPlaceDailyPatterns"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, CFSTR("weeklyTotalDailyVisitCountAverage_1stPlaceDailyPatterns"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weeklyTotalDailyVisitCountAverage_2ndPlaceDailyPatterns"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, CFSTR("weeklyTotalDailyVisitCountAverage_2ndPlaceDailyPatterns"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDailyPatterns"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v39, CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDailyPatterns"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_2ndPlaceDailyPatterns"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_2ndPlaceDailyPatterns"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numPlacesAfterDailyPatternsPruning"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, CFSTR("numPlacesAfterDailyPatternsPruning"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeRankDailyPatterns"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setObject:forKeyedSubscript:", v45, CFSTR("homeRankDailyPatterns"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("workRankDailyPatterns"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v47, CFSTR("workRankDailyPatterns"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weeklyTotalDailyVisitCountAverage_1stPlaceDwellTime"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v49, CFSTR("weeklyTotalDailyVisitCountAverage_1stPlaceDwellTime"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDwellTime"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v51, CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDwellTime"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topMedianDwellTime_1stPlaceDwellTime"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v53, CFSTR("topMedianDwellTime_1stPlaceDwellTime"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeRankDwellTime"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setObject:forKeyedSubscript:", v55, CFSTR("homeRankDwellTime"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("workRankDwellTime"));
  v58 = (id)objc_claimAutoreleasedReturnValue();

  -[RTMetric metrics](self, "metrics");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v58, CFSTR("workRankDwellTime"));

}

+ (id)generateDictionaryOfOldMetricsWithLearnedLocationStore:(id)a3 locationsOfInterest:(id)a4 homeMapItem:(id)a5 workMapItem:(id)a6 locationsOfOthers:(id *)a7
{
  id v10;
  id v11;
  id v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  RTLearnedPlaceTypeInferencePlaceStats *v28;
  RTPlaceStatsAndType *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  id v47;
  void *v48;
  void *v49;
  double v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  uint64_t k;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  double v70;
  void *v71;
  double v72;
  void *v73;
  double v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  double v79;
  void *v80;
  double v81;
  void *v82;
  double v83;
  void *v84;
  double v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  unint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  double v114;
  void *v115;
  void *v116;
  void *v117;
  double v118;
  void *v119;
  void *v120;
  void *v121;
  double v122;
  void *v123;
  void *v124;
  void *v125;
  double v126;
  void *v127;
  void *v128;
  void *v129;
  double v130;
  void *v131;
  void *v132;
  void *v133;
  double v134;
  void *v135;
  void *v136;
  void *v137;
  unint64_t v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  unint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  double v151;
  void *v152;
  void *v153;
  void *v154;
  double v155;
  void *v156;
  void *v157;
  void *v158;
  double v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  id v168;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  uint64_t v183;
  void *v184;
  uint64_t v185;
  void *v186;
  void *v187;
  void *v188;
  double v189;
  double v190;
  void *v191;
  double v192;
  uint64_t v193;
  void *v194;
  id v196;
  double v197;
  void *v198;
  id v199;
  void *v200;
  double v201;
  void *v202;
  id v203;
  id v204;
  id v205;
  uint64_t v206;
  double v207;
  void *v208;
  uint64_t v209;
  double v210;
  void *v211;
  void *v212;
  double v213;
  void *v214;
  RTLearnedPlaceTypeInferencePlaceStats *v215;
  double v216;
  void *v217;
  void *v218;
  double v219;
  void *v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  NSObject *obj;
  uint64_t obja;
  id objb;
  uint64_t v227;
  uint64_t v228;
  void *v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  _QWORD v242[27];
  _QWORD v243[27];
  void *v244;
  _QWORD v245[2];
  _QWORD v246[2];
  _BYTE v247[5];
  uint8_t v248[128];
  uint8_t buf[4];
  void *v250;
  _BYTE v251[128];
  uint64_t v252;

  v252 = *MEMORY[0x1E0C80C00];
  v205 = a3;
  v10 = a4;
  v204 = a5;
  v199 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v196 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v238 = 0u;
  v239 = 0u;
  v240 = 0u;
  v241 = 0u;
  v11 = v10;
  v209 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v238, v251, 16);
  if (v209)
  {
    v12 = 0;
    v229 = 0;
    v206 = *(_QWORD *)v239;
    v203 = v11;
    do
    {
      for (i = 0; i != v209; ++i)
      {
        if (*(_QWORD *)v239 != v206)
          objc_enumerationMutation(v11);
        v14 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * i);
        objc_msgSend(v14, "place");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "mapItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "location");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v15, "mapItem");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToMapItem:", v204);

          v20 = v12;
          if ((v19 & 1) != 0)
          {
            v21 = 1;
          }
          else
          {
            objc_msgSend(v15, "mapItem");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToMapItem:", v199);

            if ((v24 & 1) != 0)
            {
              v21 = 2;
            }
            else
            {
              objc_msgSend(v15, "mapItem");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "location");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v196, "addObject:", v26);

              v21 = 0;
            }
          }
          v221 = i;
          objc_msgSend(v14, "visits");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[RTLearnedPlaceTypeInferencePlaceStats initWithLearnedLocationStore:place:visits:]([RTLearnedPlaceTypeInferencePlaceStats alloc], "initWithLearnedLocationStore:place:visits:", v205, v15, v27);
          v29 = [RTPlaceStatsAndType alloc];
          objc_msgSend(v15, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v215 = v28;
          v31 = -[RTPlaceStatsAndType initWithPlaceStats:type:placeIdentifier:](v29, "initWithPlaceStats:type:placeIdentifier:", v28, v21, v30);

          if (v31)
            objc_msgSend(v200, "addObject:", v31);
          v218 = v15;
          v236 = 0u;
          v237 = 0u;
          v234 = 0u;
          v235 = 0u;
          obj = v27;
          v32 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v234, v248, 16);
          v12 = v20;
          v212 = (void *)v31;
          if (v32)
          {
            v33 = v32;
            v227 = *(_QWORD *)v235;
            do
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v235 != v227)
                  objc_enumerationMutation(obj);
                v35 = *(void **)(*((_QWORD *)&v234 + 1) + 8 * j);
                if (!v12)
                {
                  v12 = v35;

                  v229 = v12;
                }
                objc_msgSend(v35, "entryDate");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "entryDate");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "earlierDate:", v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "entryDate");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v38, "isEqualToDate:", v39);

                if (v40)
                {
                  v41 = v35;

                }
                else
                {
                  v41 = v12;
                }
                objc_msgSend(v35, "exitDate");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v229, "exitDate");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "laterDate:", v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "exitDate");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = objc_msgSend(v44, "isEqualToDate:", v45);

                if (v46)
                {
                  v47 = v35;

                  v229 = v47;
                }
                v12 = v41;
              }
              v33 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v234, v248, 16);
            }
            while (v33);
          }
          v22 = obj;

          v11 = v203;
          v15 = v218;
          i = v221;
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v250 = v15;
            _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "Place with incomplete mapItem. Place: %@", buf, 0xCu);
          }
        }

      }
      v209 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v238, v251, 16);
    }
    while (v209);

    if (!v12 || !v229)
    {
      v190 = 0.0;
      goto LABEL_39;
    }
    objc_msgSend(v229, "exitDate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "entryDate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "timeIntervalSinceDate:", v49);
    v190 = v50;

  }
  else
  {
    v229 = 0;
    v12 = 0;
    v190 = 0.0;
    v48 = v11;
  }

LABEL_39:
  v194 = v12;
  v232 = 0u;
  v233 = 0u;
  v230 = 0u;
  v231 = 0u;
  v51 = v200;
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v230, v247, 16);
  v219 = -1.0;
  if (!v52)
  {
    v54 = -1.0;
    v57 = -1;
    v55 = -1.0;
    v58 = -1;
    v59 = -1.0;
    v60 = -1.0;
    v61 = -1.0;
    v62 = -1.0;
    v63 = -1.0;
    v64 = -1.0;
    goto LABEL_53;
  }
  v53 = v52;
  v54 = -1.0;
  v55 = -1.0;
  v56 = *(_QWORD *)v231;
  v57 = -1;
  v58 = -1;
  v59 = -1.0;
  v60 = -1.0;
  v61 = -1.0;
  v62 = -1.0;
  v63 = -1.0;
  v64 = -1.0;
  do
  {
    for (k = 0; k != v53; ++k)
    {
      if (*(_QWORD *)v231 != v56)
        objc_enumerationMutation(v51);
      v66 = *(void **)(*((_QWORD *)&v230 + 1) + 8 * k);
      objc_msgSend(v66, "placeStats");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v66, "type");
      if (v68 == 2)
      {
        objc_msgSend(v67, "stats");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "weeklyAggregateDwellTimeBetweenDateRangeAverage");
        v63 = v79;

        objc_msgSend(v67, "stats");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "weeklyTotalDailyVisitCountAverage");
        v61 = v81;

        objc_msgSend(v67, "stats");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "weeklyDaysWithNonZeroDwellTimeAverage");
        v59 = v83;

        objc_msgSend(v67, "stats");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "topMedianDwellTime");
        v54 = v85;

        objc_msgSend(v67, "stats");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v77, "weeksWithNonZeroDwellTime");
      }
      else
      {
        if (v68 != 1)
          goto LABEL_49;
        objc_msgSend(v67, "stats");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "weeklyAggregateDwellTimeBetweenDateRangeAverage");
        v64 = v70;

        objc_msgSend(v67, "stats");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "weeklyTotalDailyVisitCountAverage");
        v62 = v72;

        objc_msgSend(v67, "stats");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "weeklyDaysWithNonZeroDwellTimeAverage");
        v60 = v74;

        objc_msgSend(v67, "stats");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "topMedianDwellTime");
        v55 = v76;

        objc_msgSend(v67, "stats");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v77, "weeksWithNonZeroDwellTime");
      }

LABEL_49:
    }
    v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v230, v247, 16);
  }
  while (v53);
LABEL_53:

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_30);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "filterUsingPredicate:", v86);

  v87 = objc_msgSend(v51, "count");
  v88 = v87;
  if (v87 < 2)
  {
    v107 = 0;
    v192 = -1.0;
    v189 = -1.0;
    v108 = -1;
    v109 = -1;
    v193 = -1;
    v228 = -1;
    v110 = -1;
    v207 = -1.0;
    v210 = -1.0;
    v197 = -1.0;
    v213 = -1.0;
    v216 = -1.0;
    v201 = -1.0;
  }
  else
  {
    v183 = v87;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("placeStats"), CFSTR("stats"), CFSTR("weeklyDaysWithNonZeroDwellTimeAverage"));
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("placeStats"), CFSTR("stats"), CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage"));
    v89 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("placeStats"), CFSTR("stats"), CFSTR("weeklyTotalDailyVisitCountAverage"));
    v90 = objc_claimAutoreleasedReturnValue();
    v91 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %@"), v89, &unk_1E932CEE0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v246[0] = v92;
    v179 = (void *)v90;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), v90, &unk_1E932CEF0);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v246[1] = v93;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v246, 2);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "andPredicateWithSubpredicates:", v94);
    v95 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v187, 0);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v245[0] = v96;
    v181 = (void *)v89;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v89, 0);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v245[1] = v97;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v245, 2);
    v98 = objc_claimAutoreleasedReturnValue();

    v177 = (void *)v95;
    objc_msgSend(v51, "filteredArrayUsingPredicate:", v95);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = (void *)v98;
    objc_msgSend(v99, "sortedArrayUsingDescriptors:", v98);
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    v185 = objc_msgSend(v100, "count");
    if (objc_msgSend(v100, "count"))
    {
      v101 = 0;
      v222 = -1;
      obja = -1;
      do
      {
        objc_msgSend(v100, "objectAtIndexedSubscript:", v101);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = objc_msgSend(v102, "type");

        if (v103 == 1)
        {
          v222 = ++v101;
        }
        else
        {
          objc_msgSend(v100, "objectAtIndexedSubscript:", v101);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = objc_msgSend(v104, "type");

          v106 = obja;
          if (v105 == 2)
            v106 = v101 + 1;
          obja = v106;
          ++v101;
        }
      }
      while (objc_msgSend(v100, "count") > v101);
    }
    else
    {
      v222 = -1;
      obja = -1;
    }
    v207 = -1.0;
    v210 = -1.0;
    v213 = -1.0;
    v216 = -1.0;
    if (objc_msgSend(v100, "count"))
    {
      objc_msgSend(v100, "objectAtIndexedSubscript:", 0);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "placeStats");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "stats");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "weeklyAggregateDwellTimeBetweenDateRangeAverage");
      v216 = v114;

      objc_msgSend(v100, "objectAtIndexedSubscript:", 0);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "placeStats");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "stats");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "weeklyTotalDailyVisitCountAverage");
      v213 = v118;

      objc_msgSend(v100, "objectAtIndexedSubscript:", 0);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "placeStats");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "stats");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "weeklyDaysWithNonZeroDwellTimeAverage");
      v210 = v122;

    }
    v197 = -1.0;
    v201 = -1.0;
    if ((unint64_t)objc_msgSend(v100, "count") >= 2)
    {
      objc_msgSend(v100, "objectAtIndexedSubscript:", 1);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "placeStats");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "stats");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "weeklyAggregateDwellTimeBetweenDateRangeAverage");
      v201 = v126;

      objc_msgSend(v100, "objectAtIndexedSubscript:", 1);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "placeStats");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "stats");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "weeklyTotalDailyVisitCountAverage");
      v197 = v130;

      objc_msgSend(v100, "objectAtIndexedSubscript:", 1);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "placeStats");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "stats");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "weeklyDaysWithNonZeroDwellTimeAverage");
      v207 = v134;

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("placeStats"), CFSTR("stats"), CFSTR("topMedianDwellTime"));
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v244 = v135;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v244, 1);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "sortedArrayUsingDescriptors:", v136);
    v137 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v137, "count"))
    {
      v138 = 0;
      v228 = -1;
      v139 = -1;
      do
      {
        objc_msgSend(v137, "objectAtIndexedSubscript:", v138);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        v141 = objc_msgSend(v140, "type");

        if (v141 == 1)
        {
          v139 = ++v138;
        }
        else
        {
          objc_msgSend(v137, "objectAtIndexedSubscript:", v138);
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          v143 = objc_msgSend(v142, "type");

          v144 = v228;
          if (v143 == 2)
            v144 = v138 + 1;
          v228 = v144;
          ++v138;
        }
      }
      while (objc_msgSend(v137, "count") > v138);
    }
    else
    {
      v139 = -1;
      v228 = -1;
    }
    v193 = v139;
    if (objc_msgSend(v137, "count"))
    {
      objc_msgSend(v100, "firstObject");
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v220, "placeIdentifier");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "firstObject");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "placeIdentifier");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = objc_msgSend(v145, "isEqual:", v147);

      objc_msgSend(v137, "firstObject");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "placeStats");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v149, "stats");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "weeklyTotalDailyVisitCountAverage");
      v219 = v151;

      objc_msgSend(v137, "firstObject");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "placeStats");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "stats");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "weeklyDaysWithNonZeroDwellTimeAverage");
      v192 = v155;

      objc_msgSend(v137, "firstObject");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "placeStats");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "stats");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "topMedianDwellTime");
      v189 = v159;

    }
    else
    {
      v107 = 0;
      v219 = -1.0;
      v192 = -1.0;
      v189 = -1.0;
    }
    v108 = v222;
    v109 = obja;

    v88 = v183;
    v110 = v185;
  }
  v242[0] = CFSTR("intervalToCalculateStats");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v190);
  objb = (id)objc_claimAutoreleasedReturnValue();
  v243[0] = objb;
  v242[1] = CFSTR("numPlacesAfterWeeksWithNonZeroDwellTimePruning");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v88);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v243[1] = v223;
  v242[2] = CFSTR("agreeDailyPatternsAndDwellTimeOnHome");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v107);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v243[2] = v191;
  v242[3] = CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_home");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v64);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v243[3] = v188;
  v242[4] = CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_work");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v63);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v243[4] = v186;
  v242[5] = CFSTR("weeklyTotalDailyVisitCountAverage_home");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v62);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v243[5] = v184;
  v242[6] = CFSTR("weeklyTotalDailyVisitCountAverage_work");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v61);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v243[6] = v182;
  v242[7] = CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_home");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v60);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v243[7] = v180;
  v242[8] = CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_work");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v59);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v243[8] = v178;
  v242[9] = CFSTR("topMedianDwellTime_home");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v55);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v243[9] = v176;
  v242[10] = CFSTR("topMedianDwellTime_work");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v54);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v243[10] = v174;
  v242[11] = CFSTR("weeksWithNonZeroDwellTime_home");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v58);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v243[11] = v172;
  v242[12] = CFSTR("weeksWithNonZeroDwellTime_work");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v57);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v243[12] = v171;
  v242[13] = CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_1stPlaceDailyPatterns");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v216);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v243[13] = v217;
  v242[14] = CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage_2ndPlaceDailyPatterns");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v201);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v243[14] = v202;
  v242[15] = CFSTR("weeklyTotalDailyVisitCountAverage_1stPlaceDailyPatterns");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v213);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v243[15] = v214;
  v242[16] = CFSTR("weeklyTotalDailyVisitCountAverage_2ndPlaceDailyPatterns");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v197);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v243[16] = v198;
  v242[17] = CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDailyPatterns");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v210);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v243[17] = v211;
  v242[18] = CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_2ndPlaceDailyPatterns");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v207);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v243[18] = v208;
  v242[19] = CFSTR("numPlacesAfterDailyPatternsPruning");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v110);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v243[19] = v170;
  v242[20] = CFSTR("homeRankDailyPatterns");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v108);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v243[20] = v160;
  v242[21] = CFSTR("workRankDailyPatterns");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v109);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v243[21] = v161;
  v242[22] = CFSTR("weeklyTotalDailyVisitCountAverage_1stPlaceDwellTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v219);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v243[22] = v162;
  v242[23] = CFSTR("weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDwellTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v192);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v243[23] = v163;
  v242[24] = CFSTR("topMedianDwellTime_1stPlaceDwellTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v189);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v243[24] = v164;
  v242[25] = CFSTR("homeRankDwellTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v193);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v243[25] = v165;
  v242[26] = CFSTR("workRankDwellTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v228);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v243[26] = v166;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v243, v242, 27);
  v167 = (void *)objc_claimAutoreleasedReturnValue();

  v168 = objc_retainAutorelease(v196);
  *a7 = v168;

  return v167;
}

BOOL __139__RTPlaceDataMetrics_generateDictionaryOfOldMetricsWithLearnedLocationStore_locationsOfInterest_homeMapItem_workMapItem_locationsOfOthers___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "placeStats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)objc_msgSend(v3, "weeksWithNonZeroDwellTime") / 5.0 > 0.6;

  return v4;
}

+ (id)labelAnEventInterval:(id)a3 basedOnIntervalDict:(id)a4
{
  id v5;
  __CFString *v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  __CFString *v20;
  id obj;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v24 = a4;
  objc_msgSend(v24, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v25)
  {
    v23 = *(_QWORD *)v32;
    v6 = CFSTR("Unknown");
    v7 = 0.0;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(obj);
        v26 = v8;
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v8);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v24, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v28 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v5, "intersectionWithDateInterval:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "endDate");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "startDate");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "timeIntervalSinceDate:", v17);
              v19 = v18;

              if (v19 > v7)
              {
                v20 = v9;

                v7 = v19;
                v6 = v20;
              }

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v12);
        }

        v8 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v25);
  }
  else
  {
    v6 = CFSTR("Unknown");
  }

  return v6;
}

+ (id)calculateMLFeatures:(id)a3 startDate:(id)a4 endDate:(id)a5 createBucketedFeatures:(BOOL)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;
  _BOOL4 v130;
  void *v131;
  void *kk;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  BOOL v195;
  void *v196;
  BOOL v197;
  uint64_t v198;
  id v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t k;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  _BOOL4 v209;
  void *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t m;
  uint64_t v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  uint64_t v219;
  uint64_t n;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  double v228;
  double v229;
  double v230;
  void *v231;
  void *v232;
  double v233;
  double v234;
  void *v235;
  void *v236;
  double v237;
  _BOOL4 v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  double v246;
  double v247;
  void *v248;
  void *v249;
  void *v250;
  double v251;
  void *v252;
  void *v253;
  void *v254;
  uint64_t v255;
  uint64_t v256;
  void *v257;
  void *v258;
  double v259;
  _BOOL4 v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t ii;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  double v283;
  double v284;
  void *v285;
  void *v286;
  void *v287;
  double v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  double v293;
  double v294;
  void *v295;
  void *v296;
  double v297;
  double v298;
  void *v299;
  void *v300;
  void *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t jj;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  BOOL v309;
  uint64_t v310;
  void *v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t mm;
  uint64_t v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  uint64_t nn;
  uint64_t v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  void *v415;
  void *v416;
  void *v417;
  void *v418;
  void *v419;
  void *v420;
  void *v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  void *v433;
  void *v434;
  void *v435;
  void *v436;
  void *v437;
  void *v438;
  void *v439;
  void *v440;
  void *v441;
  void *v442;
  void *v443;
  void *v444;
  void *v445;
  void *v446;
  void *v447;
  void *v448;
  void *v449;
  void *v450;
  void *v451;
  void *v452;
  void *v453;
  void *v454;
  void *v455;
  void *v456;
  void *v457;
  void *v458;
  void *v459;
  void *v460;
  void *v461;
  void *v462;
  void *v463;
  void *v464;
  void *v465;
  void *v466;
  void *v467;
  void *v468;
  void *v469;
  void *v470;
  void *v471;
  void *v473;
  uint64_t v474;
  RTDuetKnowledgeStream *v475;
  RTDuetKnowledgeStream *v476;
  RTDuetKnowledgeStream *v477;
  RTDuetKnowledgeStream *v478;
  uint64_t v479;
  void *v480;
  id obj;
  void *v482;
  void *v483;
  uint64_t v484;
  void *v485;
  _BOOL4 v486;
  void *v487;
  id v488;
  void *v489;
  id v490;
  id v491;
  id v492;
  void *v493;
  void *v494;
  void *v495;
  int v496;
  void *v497;
  void *v498;
  void *v499;
  uint64_t v500;
  id v501;
  id v502;
  void *context;
  void *contexta;
  void *v506;
  uint64_t v507;
  id v508;
  void *v509;
  void *v510;
  uint64_t v511;
  id v512;
  id v513;
  id v514;
  void *v515;
  uint64_t v516;
  uint64_t v517;
  void *v518;
  void *v519;
  void *v520;
  uint64_t v521;
  void *v522;
  void *v523;
  uint64_t v524;
  id v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  __int128 v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int128 v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  __int128 v545;
  __int128 v546;
  __int128 v547;
  __int128 v548;
  __int128 v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  __int128 v559;
  __int128 v560;
  __int128 v561;
  _QWORD v562[5];
  uint64_t v563;
  uint64_t *v564;
  uint64_t v565;
  uint64_t (*v566)(uint64_t, uint64_t);
  void (*v567)(uint64_t);
  id v568;
  __int128 v569;
  __int128 v570;
  __int128 v571;
  __int128 v572;
  __int128 v573;
  __int128 v574;
  __int128 v575;
  __int128 v576;
  __int128 v577;
  __int128 v578;
  __int128 v579;
  __int128 v580;
  _QWORD v581[4];
  id v582;
  _BYTE v583[128];
  _BYTE v584[128];
  _BYTE v585[128];
  _BYTE v586[128];
  _BYTE v587[128];
  _BYTE v588[128];
  _BYTE v589[128];
  _BYTE v590[128];
  _BYTE v591[128];
  _BYTE v592[128];
  _QWORD v593[4];
  _BYTE v594[128];
  _BYTE v595[128];
  uint64_t v596;

  v486 = a6;
  v596 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v491 = a5;
  v525 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = (void *)MEMORY[0x1E0CB3880];
  v581[0] = MEMORY[0x1E0C809B0];
  v581[1] = 3221225472;
  v581[2] = __83__RTPlaceDataMetrics_calculateMLFeatures_startDate_endDate_createBucketedFeatures___block_invoke;
  v581[3] = &unk_1E929B790;
  v492 = v9;
  v582 = v492;
  objc_msgSend(v10, "predicateWithBlock:", v581);
  v518 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v580 = 0u;
  v579 = 0u;
  v578 = 0u;
  v577 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v577, v595, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v578;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v578 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v577 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "filteredArrayUsingPredicate:", v518);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v16);

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v577, v595, 16);
    }
    while (v13);
  }

  v508 = v11;
  if (objc_msgSend(v508, "count") && objc_msgSend(v492, "compare:", v491) != 1)
  {
    v576 = 0u;
    v575 = 0u;
    v574 = 0u;
    v573 = 0u;
    objc_msgSend(v508, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v573, v594, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v574;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v574 != v21)
            objc_enumerationMutation(v19);
          v23 = *(_QWORD *)(*((_QWORD *)&v573 + 1) + 8 * j);
          v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v525, "setObject:forKeyedSubscript:", v24, v23);

          v25 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v25, "numberWithDouble:");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, CFSTR("percentage_of_days_with_charging"));

          v28 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v28, "numberWithDouble:");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, CFSTR("median_daily_total_charging_duration"));

          v31 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v31, "numberWithDouble:");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, CFSTR("mean_daily_total_charging_duration"));

          v34 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v34, "numberWithDouble:");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, CFSTR("SD_daily_total_charging_duration"));

          v37 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v37, "numberWithDouble:");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v38, CFSTR("median_daily_longest_charging_duration"));

          v40 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v40, "numberWithDouble:");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, CFSTR("mean_daily_longest_charging_duration"));

          v43 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v43, "numberWithDouble:");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setObject:forKeyedSubscript:", v44, CFSTR("SD_daily_longest_charging_duration"));

          v46 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v46, "numberWithDouble:");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setObject:forKeyedSubscript:", v47, CFSTR("percentage_of_days_with_staticMotion"));

          v49 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v49, "numberWithDouble:");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setObject:forKeyedSubscript:", v50, CFSTR("median_daily_total_static_motion_duration"));

          v52 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v52, "numberWithDouble:");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setObject:forKeyedSubscript:", v53, CFSTR("mean_daily_total_static_motion_duration"));

          v55 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v55, "numberWithDouble:");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setObject:forKeyedSubscript:", v56, CFSTR("SD_daily_total_static_motion_duration"));

          v58 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v58, "numberWithDouble:");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setObject:forKeyedSubscript:", v59, CFSTR("median_daily_longest_static_motion_duration"));

          v61 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v61, "numberWithDouble:");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setObject:forKeyedSubscript:", v62, CFSTR("mean_daily_longest_static_motion_duration"));

          v64 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v64, "numberWithDouble:");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "setObject:forKeyedSubscript:", v65, CFSTR("SD_daily_longest_static_motion_duration"));

          v67 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v67, "numberWithDouble:");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v68, CFSTR("percentage_of_days_with_screenLock"));

          v70 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v70, "numberWithDouble:");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setObject:forKeyedSubscript:", v71, CFSTR("median_daily_total_screen_lock_duration"));

          v73 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v73, "numberWithDouble:");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "setObject:forKeyedSubscript:", v74, CFSTR("mean_daily_total_screen_lock_duration"));

          v76 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v76, "numberWithDouble:");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setObject:forKeyedSubscript:", v77, CFSTR("SD_daily_total_screen_lock_duration"));

          v79 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v79, "numberWithDouble:");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "setObject:forKeyedSubscript:", v80, CFSTR("median_daily_longest_screen_lock_duration"));

          v82 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v82, "numberWithDouble:");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "setObject:forKeyedSubscript:", v83, CFSTR("mean_daily_longest_screen_lock_duration"));

          v85 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v85, "numberWithDouble:");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "setObject:forKeyedSubscript:", v86, CFSTR("SD_daily_longest_screen_lock_duration"));

          v88 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v88, "numberWithDouble:");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "setObject:forKeyedSubscript:", v89, CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection"));

          v91 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v91, "numberWithDouble:");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "setObject:forKeyedSubscript:", v92, CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration"));

          v94 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v94, "numberWithDouble:");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "setObject:forKeyedSubscript:", v95, CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration"));

          v97 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v97, "numberWithDouble:");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "setObject:forKeyedSubscript:", v98, CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration"));

          v100 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v100, "numberWithDouble:");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "setObject:forKeyedSubscript:", v101, CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration"));

          v103 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v103, "numberWithDouble:");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "setObject:forKeyedSubscript:", v104, CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration"));

          v106 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v106, "numberWithDouble:");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "setObject:forKeyedSubscript:", v107, CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration"));

          v109 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v109, "numberWithDouble:");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "setObject:forKeyedSubscript:", v110, CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio"));

          v112 = (void *)objc_opt_new();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "setObject:forKeyedSubscript:", v112, CFSTR("eventHappenedArray"));

          v114 = (void *)objc_opt_new();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "setObject:forKeyedSubscript:", v114, CFSTR("eventLongestArray"));

          v116 = (void *)objc_opt_new();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "setObject:forKeyedSubscript:", v116, CFSTR("eventTotalArray"));

          v118 = (void *)objc_opt_new();
          objc_msgSend(v525, "objectForKeyedSubscript:", v23);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "setObject:forKeyedSubscript:", v118, CFSTR("wifiStabilityArray"));

        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v573, v594, 16);
      }
      while (v20);
    }

    v487 = (void *)objc_opt_new();
    v478 = -[RTDuetKnowledgeStream initWithDuetKnowledgeStore:streamType:]([RTDuetKnowledgeStream alloc], "initWithDuetKnowledgeStore:streamType:", v487, 0);
    v477 = -[RTDuetKnowledgeStream initWithDuetKnowledgeStore:streamType:]([RTDuetKnowledgeStream alloc], "initWithDuetKnowledgeStore:streamType:", v487, 2);
    v476 = -[RTDuetKnowledgeStream initWithDuetKnowledgeStore:streamType:]([RTDuetKnowledgeStream alloc], "initWithDuetKnowledgeStore:streamType:", v487, 1);
    v475 = -[RTDuetKnowledgeStream initWithDuetKnowledgeStore:streamType:]([RTDuetKnowledgeStream alloc], "initWithDuetKnowledgeStore:streamType:", v487, 3);
    v120 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18408]), "initWithFirstObject:secondObject:", CFSTR("Charging"), v478);
    v593[0] = v120;
    v121 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18408]), "initWithFirstObject:secondObject:", CFSTR("StaticMotion"), v477);
    v593[1] = v121;
    v122 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18408]), "initWithFirstObject:secondObject:", CFSTR("ScreenLock"), v476);
    v593[2] = v122;
    v123 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18408]), "initWithFirstObject:secondObject:", CFSTR("WiFiConnection"), v475);
    v593[3] = v123;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v593, 4);
    v124 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v489 = (void *)objc_claimAutoreleasedReturnValue();
    v490 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    v488 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v491, "dateByAddingTimeInterval:", -2419200.0);
    v482 = (void *)objc_claimAutoreleasedReturnValue();
    v571 = 0u;
    v572 = 0u;
    v569 = 0u;
    v570 = 0u;
    obj = v124;
    v484 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v569, v592, 16);
    if (v484)
    {
      v474 = *(_QWORD *)v570;
      do
      {
        v125 = 0;
        do
        {
          if (*(_QWORD *)v570 != v474)
          {
            v126 = v125;
            objc_enumerationMutation(obj);
            v125 = v126;
          }
          v479 = v125;
          v127 = *(void **)(*((_QWORD *)&v569 + 1) + 8 * v125);
          v480 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(v127, "firstObject");
          v509 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "secondObject");
          v483 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v490, "setDay:", 0);
          objc_msgSend(v489, "dateByAddingComponents:toDate:options:", v490, v492, 0);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v488, "setDay:", 0);
          objc_msgSend(v489, "dateByAddingComponents:toDate:options:", v488, v492, 0);
          v499 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v499, "earlierDate:", v491);
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = v129 == v499;

          if (v130)
          {
            while (1)
            {
              v473 = (void *)MEMORY[0x1D8231EA8]();
              objc_msgSend(v488, "setDay:", objc_msgSend(v488, "day") + 3);
              objc_msgSend(v489, "dateByAddingComponents:toDate:options:", v488, v492, 0);
              v485 = (void *)objc_claimAutoreleasedReturnValue();
              v494 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v499, v485);
              v563 = 0;
              v564 = &v563;
              v565 = 0x3032000000;
              v566 = __Block_byref_object_copy__41;
              v567 = __Block_byref_object_dispose__41;
              v568 = (id)objc_opt_new();
              objc_msgSend(v494, "endDate");
              v193 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v482, "earlierDate:", v193);
              v194 = (void *)objc_claimAutoreleasedReturnValue();
              v195 = v194 == v482;

              if (v195)
              {
                v562[0] = MEMORY[0x1E0C809B0];
                v562[1] = 3221225472;
                v562[2] = __83__RTPlaceDataMetrics_calculateMLFeatures_startDate_endDate_createBucketedFeatures___block_invoke_1135;
                v562[3] = &unk_1E929B7B8;
                v562[4] = &v563;
                objc_msgSend(v483, "enumerateEventsWithinDateInterval:usingBlock:", v494, v562);
              }
              v496 = 1;
              while (1)
              {
                objc_msgSend(v128, "earlierDate:", v491);
                v196 = (void *)objc_claimAutoreleasedReturnValue();
                v520 = v128;
                v197 = v196 == v128;

                if (!v197)
                  break;
                objc_msgSend(v490, "setDay:", objc_msgSend(v490, "day") + 1);
                objc_msgSend(v489, "dateByAddingComponents:toDate:options:", v490, v492, 0);
                v198 = objc_claimAutoreleasedReturnValue();
                v523 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v128, v198);
                contexta = (void *)objc_opt_new();
                v498 = (void *)v198;
                v560 = 0u;
                v561 = 0u;
                v558 = 0u;
                v559 = 0u;
                v199 = (id)v564[5];
                v200 = objc_msgSend(v199, "countByEnumeratingWithState:objects:count:", &v558, v591, 16);
                if (v200)
                {
                  v201 = *(_QWORD *)v559;
                  do
                  {
                    for (k = 0; k != v200; ++k)
                    {
                      if (*(_QWORD *)v559 != v201)
                        objc_enumerationMutation(v199);
                      v203 = *(void **)(*((_QWORD *)&v558 + 1) + 8 * k);
                      objc_msgSend(v203, "startDate");
                      v204 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v520, "earlierDate:", v204);
                      v205 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v205 == v520)
                      {
                        objc_msgSend(v203, "startDate");
                        v206 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v206, "earlierDate:", v498);
                        v207 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v203, "startDate");
                        v208 = (void *)objc_claimAutoreleasedReturnValue();
                        v209 = v207 == v208;

                        if (v209)
                          objc_msgSend(contexta, "addObject:", v203);
                      }
                      else
                      {

                      }
                    }
                    v200 = objc_msgSend(v199, "countByEnumeratingWithState:objects:count:", &v558, v591, 16);
                  }
                  while (v200);
                }

                if (objc_msgSend(contexta, "count"))
                {
                  v552 = 0uLL;
                  v553 = 0uLL;
                  v550 = 0uLL;
                  v551 = 0uLL;
                  objc_msgSend(v525, "allKeys");
                  v210 = (void *)objc_claimAutoreleasedReturnValue();
                  v211 = objc_msgSend(v210, "countByEnumeratingWithState:objects:count:", &v550, v589, 16);
                  if (v211)
                  {
                    v212 = *(_QWORD *)v551;
                    do
                    {
                      for (m = 0; m != v211; ++m)
                      {
                        if (*(_QWORD *)v551 != v212)
                          objc_enumerationMutation(v210);
                        v214 = *(_QWORD *)(*((_QWORD *)&v550 + 1) + 8 * m);
                        objc_msgSend(v525, "objectForKeyedSubscript:", v214);
                        v215 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v215, "setObject:forKeyedSubscript:", &unk_1E932CED0, CFSTR("eventTotalDaily"));

                        objc_msgSend(v525, "objectForKeyedSubscript:", v214);
                        v216 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v216, "setObject:forKeyedSubscript:", &unk_1E932CED0, CFSTR("eventLongestDaily"));

                        objc_msgSend(v525, "objectForKeyedSubscript:", v214);
                        v217 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v217, "setObject:forKeyedSubscript:", &unk_1E932CED0, CFSTR("wifiTotalDaily"));

                        objc_msgSend(v525, "objectForKeyedSubscript:", v214);
                        v218 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v218, "setObject:forKeyedSubscript:", &unk_1E932CED0, CFSTR("visitTotalDaily"));

                      }
                      v211 = objc_msgSend(v210, "countByEnumeratingWithState:objects:count:", &v550, v589, 16);
                    }
                    while (v211);
                  }

                  v548 = 0u;
                  v549 = 0u;
                  v546 = 0u;
                  v547 = 0u;
                  v513 = contexta;
                  v219 = objc_msgSend(v513, "countByEnumeratingWithState:objects:count:", &v546, v588, 16);
                  if (v219)
                  {
                    v516 = *(_QWORD *)v547;
                    do
                    {
                      for (n = 0; n != v219; ++n)
                      {
                        if (*(_QWORD *)v547 != v516)
                          objc_enumerationMutation(v513);
                        v221 = *(void **)(*((_QWORD *)&v546 + 1) + 8 * n);
                        v222 = (void *)MEMORY[0x1D8231EA8]();
                        objc_msgSend(a1, "labelAnEventInterval:basedOnIntervalDict:", v221, v508);
                        v223 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v508, "objectForKeyedSubscript:", v223);
                        v224 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v224)
                        {
                          v225 = (void *)MEMORY[0x1E0CB37E8];
                          objc_msgSend(v525, "objectForKeyedSubscript:", v223);
                          v226 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v226, "objectForKeyedSubscript:", CFSTR("eventTotalDaily"));
                          v227 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v227, "doubleValue");
                          v229 = v228;
                          objc_msgSend(v221, "duration");
                          objc_msgSend(v225, "numberWithDouble:", v229 + v230);
                          v231 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v525, "objectForKeyedSubscript:", v223);
                          v232 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v232, "setObject:forKeyedSubscript:", v231, CFSTR("eventTotalDaily"));

                          objc_msgSend(v221, "duration");
                          v234 = v233;
                          objc_msgSend(v525, "objectForKeyedSubscript:", v223);
                          v235 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v235, "objectForKeyedSubscript:", CFSTR("eventLongestDaily"));
                          v236 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v236, "doubleValue");
                          v238 = v234 > v237;

                          if (v238)
                          {
                            v239 = (void *)MEMORY[0x1E0CB37E8];
                            objc_msgSend(v221, "duration");
                            objc_msgSend(v239, "numberWithDouble:");
                            v240 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v525, "objectForKeyedSubscript:", v223);
                            v241 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v241, "setObject:forKeyedSubscript:", v240, CFSTR("eventLongestDaily"));

                          }
                          if (objc_msgSend(v509, "isEqual:", CFSTR("WiFiConnection")))
                          {
                            objc_msgSend(v523, "intersectionWithDateInterval:", v221);
                            v242 = (void *)objc_claimAutoreleasedReturnValue();
                            v243 = v242;
                            if (v242)
                            {
                              objc_msgSend(v242, "endDate");
                              v244 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v243, "startDate");
                              v245 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v244, "timeIntervalSinceDate:", v245);
                              v247 = v246;

                              v248 = (void *)MEMORY[0x1E0CB37E8];
                              objc_msgSend(v525, "objectForKeyedSubscript:", v223);
                              v249 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v249, "objectForKeyedSubscript:", CFSTR("wifiTotalDaily"));
                              v250 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v250, "doubleValue");
                              objc_msgSend(v248, "numberWithDouble:", v247 + v251);
                              v252 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v525, "objectForKeyedSubscript:", v223);
                              v253 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v253, "setObject:forKeyedSubscript:", v252, CFSTR("wifiTotalDaily"));

                            }
                          }
                        }

                        objc_autoreleasePoolPop(v222);
                      }
                      v219 = objc_msgSend(v513, "countByEnumeratingWithState:objects:count:", &v546, v588, 16);
                    }
                    while (v219);
                  }

                  v544 = 0u;
                  v545 = 0u;
                  v542 = 0u;
                  v543 = 0u;
                  objc_msgSend(v525, "allKeys");
                  v254 = (void *)objc_claimAutoreleasedReturnValue();
                  v255 = objc_msgSend(v254, "countByEnumeratingWithState:objects:count:", &v542, v587, 16);
                  if (v255)
                  {
                    v502 = v254;
                    v507 = *(_QWORD *)v543;
                    while (1)
                    {
                      v517 = 0;
                      v511 = v255;
                      do
                      {
                        if (*(_QWORD *)v543 != v507)
                          objc_enumerationMutation(v502);
                        v256 = *(_QWORD *)(*((_QWORD *)&v542 + 1) + 8 * v517);
                        v514 = (id)MEMORY[0x1D8231EA8]();
                        objc_msgSend(v525, "objectForKeyedSubscript:", v256);
                        v257 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v257, "objectForKeyedSubscript:", CFSTR("eventTotalDaily"));
                        v258 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v258, "doubleValue");
                        v260 = v259 > 0.0;

                        if (v260)
                        {
                          objc_msgSend(v525, "objectForKeyedSubscript:", v256);
                          v261 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v261, "objectForKeyedSubscript:", CFSTR("eventHappenedArray"));
                          v262 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v262, "addObject:", &unk_1E932CE30);

                          objc_msgSend(v525, "objectForKeyedSubscript:", v256);
                          v263 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v263, "objectForKeyedSubscript:", CFSTR("eventTotalArray"));
                          v264 = (void *)objc_claimAutoreleasedReturnValue();
                          v265 = (void *)MEMORY[0x1E0CB37E8];
                          objc_msgSend(v525, "objectForKeyedSubscript:", v256);
                          v266 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v266, "objectForKeyedSubscript:", CFSTR("eventTotalDaily"));
                          v267 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v267, "doubleValue");
                          objc_msgSend(v265, "numberWithDouble:");
                          v268 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v264, "addObject:", v268);

                          objc_msgSend(v525, "objectForKeyedSubscript:", v256);
                          v269 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v269, "objectForKeyedSubscript:", CFSTR("eventLongestArray"));
                          v270 = (void *)objc_claimAutoreleasedReturnValue();
                          v271 = (void *)MEMORY[0x1E0CB37E8];
                          objc_msgSend(v525, "objectForKeyedSubscript:", v256);
                          v272 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v272, "objectForKeyedSubscript:", CFSTR("eventLongestDaily"));
                          v273 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v273, "doubleValue");
                          objc_msgSend(v271, "numberWithDouble:");
                          v274 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v270, "addObject:", v274);

                          if (!objc_msgSend(v509, "isEqual:", CFSTR("WiFiConnection")))
                            goto LABEL_107;
                          v540 = 0u;
                          v541 = 0u;
                          v538 = 0u;
                          v539 = 0u;
                          objc_msgSend(v508, "objectForKeyedSubscript:", v256);
                          v275 = (void *)objc_claimAutoreleasedReturnValue();
                          v276 = objc_msgSend(v275, "countByEnumeratingWithState:objects:count:", &v538, v586, 16);
                          if (v276)
                          {
                            v277 = *(_QWORD *)v539;
                            do
                            {
                              for (ii = 0; ii != v276; ++ii)
                              {
                                if (*(_QWORD *)v539 != v277)
                                  objc_enumerationMutation(v275);
                                objc_msgSend(v523, "intersectionWithDateInterval:", *(_QWORD *)(*((_QWORD *)&v538 + 1) + 8 * ii));
                                v279 = (void *)objc_claimAutoreleasedReturnValue();
                                v280 = v279;
                                if (v279)
                                {
                                  objc_msgSend(v279, "endDate");
                                  v281 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v280, "startDate");
                                  v282 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v281, "timeIntervalSinceDate:", v282);
                                  v284 = v283;

                                  v285 = (void *)MEMORY[0x1E0CB37E8];
                                  objc_msgSend(v525, "objectForKeyedSubscript:", v256);
                                  v286 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v286, "objectForKeyedSubscript:", CFSTR("visitTotalDaily"));
                                  v287 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v287, "doubleValue");
                                  objc_msgSend(v285, "numberWithDouble:", v284 + v288);
                                  v289 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v525, "objectForKeyedSubscript:", v256);
                                  v290 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v290, "setObject:forKeyedSubscript:", v289, CFSTR("visitTotalDaily"));

                                }
                              }
                              v276 = objc_msgSend(v275, "countByEnumeratingWithState:objects:count:", &v538, v586, 16);
                            }
                            while (v276);
                          }

                          objc_msgSend(v525, "objectForKeyedSubscript:", v256);
                          v291 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("wifiTotalDaily"));
                          v292 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v292, "doubleValue");
                          v294 = v293;

                          objc_msgSend(v525, "objectForKeyedSubscript:", v256);
                          v295 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v295, "objectForKeyedSubscript:", CFSTR("visitTotalDaily"));
                          v296 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v296, "doubleValue");
                          v298 = v297;

                          if (v294 <= 0.0 || v298 <= 0.0)
                          {
                            objc_msgSend(v525, "objectForKeyedSubscript:", v256);
                            v299 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v299, "objectForKeyedSubscript:", CFSTR("wifiStabilityArray"));
                            v300 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v300, "addObject:", &unk_1E932CED0);
                          }
                          else
                          {
                            objc_msgSend(v525, "objectForKeyedSubscript:", v256);
                            v299 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v299, "objectForKeyedSubscript:", CFSTR("wifiStabilityArray"));
                            v300 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v294 / v298);
                            v301 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v300, "addObject:", v301);

                          }
                        }
                        else
                        {
                          objc_msgSend(v525, "objectForKeyedSubscript:", v256);
                          v299 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v299, "objectForKeyedSubscript:", CFSTR("eventHappenedArray"));
                          v300 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v300, "addObject:", &unk_1E932CED0);
                        }

LABEL_107:
                        objc_autoreleasePoolPop(v514);
                        ++v517;
                      }
                      while (v517 != v511);
                      v255 = objc_msgSend(v502, "countByEnumeratingWithState:objects:count:", &v542, v587, 16);
                      if (!v255)
                      {
                        v254 = v502;
                        break;
                      }
                    }
                  }
                }
                else
                {
                  v556 = 0uLL;
                  v557 = 0uLL;
                  v554 = 0uLL;
                  v555 = 0uLL;
                  objc_msgSend(v525, "allKeys");
                  v254 = (void *)objc_claimAutoreleasedReturnValue();
                  v302 = objc_msgSend(v254, "countByEnumeratingWithState:objects:count:", &v554, v590, 16);
                  if (v302)
                  {
                    v303 = *(_QWORD *)v555;
                    do
                    {
                      for (jj = 0; jj != v302; ++jj)
                      {
                        if (*(_QWORD *)v555 != v303)
                          objc_enumerationMutation(v254);
                        objc_msgSend(v525, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v554 + 1) + 8 * jj));
                        v305 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v305, "objectForKeyedSubscript:", CFSTR("eventHappenedArray"));
                        v306 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v306, "addObject:", &unk_1E932CED0);

                      }
                      v302 = objc_msgSend(v254, "countByEnumeratingWithState:objects:count:", &v554, v590, 16);
                    }
                    while (v302);
                  }
                }

                v307 = v498;
                v128 = v498;
                if (++v496 == 4)
                  goto LABEL_122;
              }
              v307 = v128;
LABEL_122:
              v497 = v307;

              _Block_object_dispose(&v563, 8);
              objc_autoreleasePoolPop(v473);
              objc_msgSend(v485, "earlierDate:", v491);
              v308 = (void *)objc_claimAutoreleasedReturnValue();
              v309 = v308 == v485;

              v128 = v497;
              v499 = v485;
              if (!v309)
                goto LABEL_24;
            }
          }
          v485 = v499;
          v497 = v128;
LABEL_24:
          v536 = 0u;
          v537 = 0u;
          v534 = 0u;
          v535 = 0u;
          objc_msgSend(v525, "allKeys");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          v501 = (id)objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v534, v585, 16);
          if (!v501)
            goto LABEL_47;
          v500 = *(_QWORD *)v535;
          do
          {
            for (kk = 0; kk != v501; kk = (char *)kk + 1)
            {
              if (*(_QWORD *)v535 != v500)
                objc_enumerationMutation(v131);
              v133 = *(_QWORD *)(*((_QWORD *)&v534 + 1) + 8 * (_QWORD)kk);
              context = (void *)MEMORY[0x1D8231EA8]();
              objc_msgSend(v525, "objectForKeyedSubscript:", v133);
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v134, "objectForKeyedSubscript:", CFSTR("eventHappenedArray"));
              v135 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v525, "objectForKeyedSubscript:", v133);
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v136, "objectForKeyedSubscript:", CFSTR("eventTotalArray"));
              v137 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v525, "objectForKeyedSubscript:", v133);
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("eventLongestArray"));
              v139 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v135, "count"))
              {
                v140 = (void *)MEMORY[0x1E0CB37E8];
                +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v135);
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v141, "doubleValue");
                objc_msgSend(v140, "numberWithDouble:");
                v506 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v506 = &unk_1E932CE00;
              }
              v142 = objc_msgSend(v137, "count");
              v143 = &unk_1E932CE00;
              v519 = &unk_1E932CE00;
              v522 = &unk_1E932CE00;
              v512 = &unk_1E932CE00;
              v515 = &unk_1E932CE00;
              v510 = &unk_1E932CE00;
              if (v142 == objc_msgSend(v139, "count"))
              {
                if (objc_msgSend(v137, "count"))
                {
                  v144 = (void *)MEMORY[0x1E0CB37E8];
                  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v137);
                  v145 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v145, "doubleValue");
                  objc_msgSend(v144, "numberWithDouble:");
                  v522 = (void *)objc_claimAutoreleasedReturnValue();

                  v146 = (void *)MEMORY[0x1E0CB37E8];
                  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v137);
                  v147 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v147, "doubleValue");
                  objc_msgSend(v146, "numberWithDouble:");
                  v519 = (void *)objc_claimAutoreleasedReturnValue();

                  v148 = (void *)MEMORY[0x1E0CB37E8];
                  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v137);
                  v149 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v149, "doubleValue");
                  objc_msgSend(v148, "numberWithDouble:");
                  v515 = (void *)objc_claimAutoreleasedReturnValue();

                  v150 = (void *)MEMORY[0x1E0CB37E8];
                  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v139);
                  v151 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v151, "doubleValue");
                  objc_msgSend(v150, "numberWithDouble:");
                  v512 = (id)objc_claimAutoreleasedReturnValue();

                  v152 = (void *)MEMORY[0x1E0CB37E8];
                  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v139);
                  v153 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v153, "doubleValue");
                  objc_msgSend(v152, "numberWithDouble:");
                  v510 = (void *)objc_claimAutoreleasedReturnValue();

                  v154 = (void *)MEMORY[0x1E0CB37E8];
                  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v139);
                  v155 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v155, "doubleValue");
                  objc_msgSend(v154, "numberWithDouble:");
                  v143 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v519 = &unk_1E932CE00;
                  v522 = &unk_1E932CE00;
                  v512 = &unk_1E932CE00;
                  v515 = &unk_1E932CE00;
                  v510 = &unk_1E932CE00;
                }
              }
              if (objc_msgSend(v509, "isEqual:", CFSTR("Charging")))
              {
                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v156 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v156, "setObject:forKeyedSubscript:", v506, CFSTR("percentage_of_days_with_charging"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v157 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v157, "setObject:forKeyedSubscript:", v522, CFSTR("median_daily_total_charging_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v158 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v158, "setObject:forKeyedSubscript:", v519, CFSTR("mean_daily_total_charging_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v159 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v159, "setObject:forKeyedSubscript:", v515, CFSTR("SD_daily_total_charging_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v160 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v160, "setObject:forKeyedSubscript:", v512, CFSTR("median_daily_longest_charging_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v161 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v161, "setObject:forKeyedSubscript:", v510, CFSTR("mean_daily_longest_charging_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v162 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v162, "setObject:forKeyedSubscript:", v143, CFSTR("SD_daily_longest_charging_duration"));
              }
              else if (objc_msgSend(v509, "isEqual:", CFSTR("StaticMotion")))
              {
                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v163 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v163, "setObject:forKeyedSubscript:", v506, CFSTR("percentage_of_days_with_staticMotion"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v164 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v164, "setObject:forKeyedSubscript:", v522, CFSTR("median_daily_total_static_motion_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v165 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v165, "setObject:forKeyedSubscript:", v519, CFSTR("mean_daily_total_static_motion_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v166 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v166, "setObject:forKeyedSubscript:", v515, CFSTR("SD_daily_total_static_motion_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v167, "setObject:forKeyedSubscript:", v512, CFSTR("median_daily_longest_static_motion_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v168 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v168, "setObject:forKeyedSubscript:", v510, CFSTR("mean_daily_longest_static_motion_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v162 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v162, "setObject:forKeyedSubscript:", v143, CFSTR("SD_daily_longest_static_motion_duration"));
              }
              else if (objc_msgSend(v509, "isEqual:", CFSTR("ScreenLock")))
              {
                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v169 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v169, "setObject:forKeyedSubscript:", v506, CFSTR("percentage_of_days_with_screenLock"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v170 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v170, "setObject:forKeyedSubscript:", v522, CFSTR("median_daily_total_screen_lock_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v171 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v171, "setObject:forKeyedSubscript:", v519, CFSTR("mean_daily_total_screen_lock_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v172 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v172, "setObject:forKeyedSubscript:", v515, CFSTR("SD_daily_total_screen_lock_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v173 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v173, "setObject:forKeyedSubscript:", v512, CFSTR("median_daily_longest_screen_lock_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v174, "setObject:forKeyedSubscript:", v510, CFSTR("mean_daily_longest_screen_lock_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v162 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v162, "setObject:forKeyedSubscript:", v143, CFSTR("SD_daily_longest_screen_lock_duration"));
              }
              else
              {
                if (!objc_msgSend(v509, "isEqual:", CFSTR("WiFiConnection")))
                  goto LABEL_45;
                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v175 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v175, "setObject:forKeyedSubscript:", v506, CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v176 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v176, "setObject:forKeyedSubscript:", v522, CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v177 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v177, "setObject:forKeyedSubscript:", v519, CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v178 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v178, "setObject:forKeyedSubscript:", v515, CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v179 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v179, "setObject:forKeyedSubscript:", v512, CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v180 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v180, "setObject:forKeyedSubscript:", v510, CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v181 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v181, "setObject:forKeyedSubscript:", v143, CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration"));

                v182 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v495 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v495, "objectForKeyedSubscript:", CFSTR("wifiStabilityArray"));
                v493 = (void *)objc_claimAutoreleasedReturnValue();
                +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v493);
                v183 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v183, "doubleValue");
                objc_msgSend(v182, "numberWithDouble:");
                v184 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v185 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v185, "setObject:forKeyedSubscript:", v184, CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio"));

                objc_msgSend(v525, "objectForKeyedSubscript:", v133);
                v162 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v162, "objectForKeyedSubscript:", CFSTR("wifiStabilityArray"));
                v186 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v186, "removeAllObjects");

              }
LABEL_45:
              objc_msgSend(v525, "objectForKeyedSubscript:", v133);
              v187 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v187, "objectForKeyedSubscript:", CFSTR("eventHappenedArray"));
              v188 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v188, "removeAllObjects");

              objc_msgSend(v525, "objectForKeyedSubscript:", v133);
              v189 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v189, "objectForKeyedSubscript:", CFSTR("eventLongestArray"));
              v190 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v190, "removeAllObjects");

              objc_msgSend(v525, "objectForKeyedSubscript:", v133);
              v191 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v191, "objectForKeyedSubscript:", CFSTR("eventTotalArray"));
              v192 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v192, "removeAllObjects");

              objc_autoreleasePoolPop(context);
            }
            v501 = (id)objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v534, v585, 16);
          }
          while (v501);
LABEL_47:

          objc_autoreleasePoolPop(v480);
          v125 = v479 + 1;
        }
        while (v479 + 1 != v484);
        v310 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v569, v592, 16);
        v484 = v310;
      }
      while (v310);
    }

    v532 = 0u;
    v533 = 0u;
    v530 = 0u;
    v531 = 0u;
    objc_msgSend(v525, "allKeys");
    v311 = (void *)objc_claimAutoreleasedReturnValue();
    v312 = objc_msgSend(v311, "countByEnumeratingWithState:objects:count:", &v530, v584, 16);
    if (v312)
    {
      v313 = *(_QWORD *)v531;
      do
      {
        for (mm = 0; mm != v312; ++mm)
        {
          if (*(_QWORD *)v531 != v313)
            objc_enumerationMutation(v311);
          v315 = *(_QWORD *)(*((_QWORD *)&v530 + 1) + 8 * mm);
          objc_msgSend(v525, "objectForKeyedSubscript:", v315);
          v316 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v316, "removeObjectForKey:", CFSTR("eventHappenedArray"));

          objc_msgSend(v525, "objectForKeyedSubscript:", v315);
          v317 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v317, "removeObjectForKey:", CFSTR("eventLongestArray"));

          objc_msgSend(v525, "objectForKeyedSubscript:", v315);
          v318 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v318, "removeObjectForKey:", CFSTR("eventTotalArray"));

          objc_msgSend(v525, "objectForKeyedSubscript:", v315);
          v319 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v319, "removeObjectForKey:", CFSTR("wifiStabilityArray"));

          objc_msgSend(v525, "objectForKeyedSubscript:", v315);
          v320 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v320, "removeObjectForKey:", CFSTR("eventTotalDaily"));

          objc_msgSend(v525, "objectForKeyedSubscript:", v315);
          v321 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v321, "removeObjectForKey:", CFSTR("eventLongestDaily"));

          objc_msgSend(v525, "objectForKeyedSubscript:", v315);
          v322 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v322, "removeObjectForKey:", CFSTR("wifiTotalDaily"));

          objc_msgSend(v525, "objectForKeyedSubscript:", v315);
          v323 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v323, "removeObjectForKey:", CFSTR("visitTotalDaily"));

        }
        v312 = objc_msgSend(v311, "countByEnumeratingWithState:objects:count:", &v530, v584, 16);
      }
      while (v312);
    }

    if (v486)
    {
      v528 = 0u;
      v529 = 0u;
      v526 = 0u;
      v527 = 0u;
      objc_msgSend(v525, "allKeys");
      v324 = (void *)objc_claimAutoreleasedReturnValue();
      v524 = objc_msgSend(v324, "countByEnumeratingWithState:objects:count:", &v526, v583, 16);
      if (v524)
      {
        v521 = *(_QWORD *)v527;
        do
        {
          for (nn = 0; nn != v524; ++nn)
          {
            if (*(_QWORD *)v527 != v521)
              objc_enumerationMutation(v324);
            v326 = *(_QWORD *)(*((_QWORD *)&v526 + 1) + 8 * nn);
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v327 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v327, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_charging"));
            v328 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
            v329 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v328, v329);
            v330 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v331 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v331, "setObject:forKeyedSubscript:", v330, CFSTR("percentage_of_days_with_charging_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v332 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v332, "objectForKeyedSubscript:", CFSTR("median_daily_total_charging_duration"));
            v333 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v334 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v333, v334);
            v335 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v336 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v336, "setObject:forKeyedSubscript:", v335, CFSTR("median_daily_total_charging_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v337 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v337, "objectForKeyedSubscript:", CFSTR("mean_daily_total_charging_duration"));
            v338 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v339 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v338, v339);
            v340 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v341 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v341, "setObject:forKeyedSubscript:", v340, CFSTR("mean_daily_total_charging_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v342 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v342, "objectForKeyedSubscript:", CFSTR("SD_daily_total_charging_duration"));
            v343 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v344 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v343, v344);
            v345 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v346 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v346, "setObject:forKeyedSubscript:", v345, CFSTR("SD_daily_total_charging_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v347 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v347, "objectForKeyedSubscript:", CFSTR("median_daily_longest_charging_duration"));
            v348 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v349 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v348, v349);
            v350 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v351 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v351, "setObject:forKeyedSubscript:", v350, CFSTR("median_daily_longest_charging_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v352 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v352, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_charging_duration"));
            v353 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v354 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v353, v354);
            v355 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v356 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v356, "setObject:forKeyedSubscript:", v355, CFSTR("mean_daily_longest_charging_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v357 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v357, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_charging_duration"));
            v358 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v359 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v358, v359);
            v360 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v361 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v361, "setObject:forKeyedSubscript:", v360, CFSTR("SD_daily_longest_charging_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v362 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v362, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_staticMotion"));
            v363 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
            v364 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v363, v364);
            v365 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v366 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v366, "setObject:forKeyedSubscript:", v365, CFSTR("percentage_of_days_with_staticMotion_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v367 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v367, "objectForKeyedSubscript:", CFSTR("median_daily_total_static_motion_duration"));
            v368 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v369 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v368, v369);
            v370 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v371 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v371, "setObject:forKeyedSubscript:", v370, CFSTR("median_daily_total_static_motion_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v372 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v372, "objectForKeyedSubscript:", CFSTR("mean_daily_total_static_motion_duration"));
            v373 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v374 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v373, v374);
            v375 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v376 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v376, "setObject:forKeyedSubscript:", v375, CFSTR("mean_daily_total_static_motion_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v377 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v377, "objectForKeyedSubscript:", CFSTR("SD_daily_total_static_motion_duration"));
            v378 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v379 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v378, v379);
            v380 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v381 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v381, "setObject:forKeyedSubscript:", v380, CFSTR("SD_daily_total_static_motion_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v382 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v382, "objectForKeyedSubscript:", CFSTR("median_daily_longest_static_motion_duration"));
            v383 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v384 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v383, v384);
            v385 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v386 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v386, "setObject:forKeyedSubscript:", v385, CFSTR("median_daily_longest_static_motion_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v387 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v387, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_static_motion_duration"));
            v388 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v389 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v388, v389);
            v390 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v391 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v391, "setObject:forKeyedSubscript:", v390, CFSTR("mean_daily_longest_static_motion_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v392 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v392, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_static_motion_duration"));
            v393 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v394 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v393, v394);
            v395 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v396 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v396, "setObject:forKeyedSubscript:", v395, CFSTR("SD_daily_longest_static_motion_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v397 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v397, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_screenLock"));
            v398 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
            v399 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v398, v399);
            v400 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v401 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v401, "setObject:forKeyedSubscript:", v400, CFSTR("percentage_of_days_with_screenLock_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v402 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v402, "objectForKeyedSubscript:", CFSTR("median_daily_total_screen_lock_duration"));
            v403 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v404 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v403, v404);
            v405 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v406 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v406, "setObject:forKeyedSubscript:", v405, CFSTR("median_daily_total_screen_lock_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v407 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v407, "objectForKeyedSubscript:", CFSTR("mean_daily_total_screen_lock_duration"));
            v408 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v409 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v408, v409);
            v410 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v411 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v411, "setObject:forKeyedSubscript:", v410, CFSTR("mean_daily_total_screen_lock_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v412 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v412, "objectForKeyedSubscript:", CFSTR("SD_daily_total_screen_lock_duration"));
            v413 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v414 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v413, v414);
            v415 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v416 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v416, "setObject:forKeyedSubscript:", v415, CFSTR("SD_daily_total_screen_lock_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v417 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v417, "objectForKeyedSubscript:", CFSTR("median_daily_longest_screen_lock_duration"));
            v418 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v419 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v418, v419);
            v420 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v421 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v421, "setObject:forKeyedSubscript:", v420, CFSTR("median_daily_longest_screen_lock_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v422 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v422, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_screen_lock_duration"));
            v423 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v424 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v423, v424);
            v425 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v426 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v426, "setObject:forKeyedSubscript:", v425, CFSTR("mean_daily_longest_screen_lock_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v427 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v427, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_screen_lock_duration"));
            v428 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v429 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v428, v429);
            v430 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v431 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v431, "setObject:forKeyedSubscript:", v430, CFSTR("SD_daily_longest_screen_lock_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v432 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v432, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection"));
            v433 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
            v434 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v433, v434);
            v435 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v436 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v436, "setObject:forKeyedSubscript:", v435, CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v437 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v437, "objectForKeyedSubscript:", CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration"));
            v438 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v439 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v438, v439);
            v440 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v441 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v441, "setObject:forKeyedSubscript:", v440, CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v442 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v442, "objectForKeyedSubscript:", CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration"));
            v443 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v444 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v443, v444);
            v445 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v446 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v446, "setObject:forKeyedSubscript:", v445, CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v447 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v447, "objectForKeyedSubscript:", CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration"));
            v448 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v449 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v448, v449);
            v450 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v451 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v451, "setObject:forKeyedSubscript:", v450, CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v452 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v452, "objectForKeyedSubscript:", CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration"));
            v453 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v454 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v453, v454);
            v455 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v456 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v456, "setObject:forKeyedSubscript:", v455, CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v457 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v457, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration"));
            v458 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v459 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v458, v459);
            v460 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v461 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v461, "setObject:forKeyedSubscript:", v460, CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v462 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v462, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration"));
            v463 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v464 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v463, v464);
            v465 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v466 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v466, "setObject:forKeyedSubscript:", v465, CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"));

            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v467 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v467, "objectForKeyedSubscript:", CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio"));
            v468 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
            v469 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v468, v469);
            v470 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v525, "objectForKeyedSubscript:", v326);
            v471 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v471, "setObject:forKeyedSubscript:", v470, CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed"));

          }
          v524 = objc_msgSend(v324, "countByEnumeratingWithState:objects:count:", &v526, v583, 16);
        }
        while (v524);
      }

    }
  }

  return v525;
}

BOOL __83__RTPlaceDataMetrics_calculateMLFeatures_startDate_endDate_createBucketedFeatures___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 32)) != -1;

  return v4;
}

uint64_t __83__RTPlaceDataMetrics_calculateMLFeatures_startDate_endDate_createBucketedFeatures___block_invoke_1135(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (!a3)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40), "addObjectsFromArray:", a2);
  *a4 = 1;
  return result;
}

- (void)setMLMetricsFromFeaturesDict:(id)a3 sourceName:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  const __CFString *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  void *v415;
  void *v416;
  void *v417;
  void *v418;
  void *v419;
  void *v420;
  void *v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  void *v433;
  void *v434;
  void *v435;
  void *v436;
  void *v437;
  void *v438;
  void *v439;
  void *v440;
  void *v441;
  unint64_t v442;
  uint64_t v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  __int128 v447;
  _BYTE v448[128];
  uint64_t v449;

  v442 = a4;
  v449 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v444 = 0u;
  v445 = 0u;
  v446 = 0u;
  v447 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v444, v448, 16);
  if (v6)
  {
    v7 = v6;
    v443 = *(_QWORD *)v445;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v445 != v443)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v444 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("Home"), v442))
        {
          v10 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_charging"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "doubleValue");
          objc_msgSend(v10, "numberWithDouble:");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("percentage_of_days_with_charging_home"));

          v15 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("median_daily_total_charging_duration"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "doubleValue");
          objc_msgSend(v15, "numberWithDouble:");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("median_daily_total_charging_duration_home"));

          v20 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("mean_daily_total_charging_duration"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "doubleValue");
          objc_msgSend(v20, "numberWithDouble:");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("mean_daily_total_charging_duration_home"));

          v25 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("SD_daily_total_charging_duration"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "doubleValue");
          objc_msgSend(v25, "numberWithDouble:");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, CFSTR("SD_daily_total_charging_duration_home"));

          v30 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("median_daily_longest_charging_duration"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "doubleValue");
          objc_msgSend(v30, "numberWithDouble:");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, CFSTR("median_daily_longest_charging_duration_home"));

          v35 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_charging_duration"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "doubleValue");
          objc_msgSend(v35, "numberWithDouble:");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v38, CFSTR("mean_daily_longest_charging_duration_home"));

          v40 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_charging_duration"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "doubleValue");
          objc_msgSend(v40, "numberWithDouble:");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, CFSTR("SD_daily_longest_charging_duration_home"));

          v45 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_staticMotion"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "doubleValue");
          objc_msgSend(v45, "numberWithDouble:");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setObject:forKeyedSubscript:", v48, CFSTR("percentage_of_days_with_staticMotion_home"));

          v50 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("median_daily_total_static_motion_duration"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "doubleValue");
          objc_msgSend(v50, "numberWithDouble:");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setObject:forKeyedSubscript:", v53, CFSTR("median_daily_total_static_motion_duration_home"));

          v55 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("mean_daily_total_static_motion_duration"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "doubleValue");
          objc_msgSend(v55, "numberWithDouble:");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setObject:forKeyedSubscript:", v58, CFSTR("mean_daily_total_static_motion_duration_home"));

          v60 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("SD_daily_total_static_motion_duration"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "doubleValue");
          objc_msgSend(v60, "numberWithDouble:");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setObject:forKeyedSubscript:", v63, CFSTR("SD_daily_total_static_motion_duration_home"));

          v65 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("median_daily_longest_static_motion_duration"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "doubleValue");
          objc_msgSend(v65, "numberWithDouble:");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v68, CFSTR("median_daily_longest_static_motion_duration_home"));

          v70 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_static_motion_duration"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "doubleValue");
          objc_msgSend(v70, "numberWithDouble:");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "setObject:forKeyedSubscript:", v73, CFSTR("mean_daily_longest_static_motion_duration_home"));

          v75 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_static_motion_duration"));
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "doubleValue");
          objc_msgSend(v75, "numberWithDouble:");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setObject:forKeyedSubscript:", v78, CFSTR("SD_daily_longest_static_motion_duration_home"));

          v80 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_screenLock"));
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "doubleValue");
          objc_msgSend(v80, "numberWithDouble:");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "setObject:forKeyedSubscript:", v83, CFSTR("percentage_of_days_with_screenLock_home"));

          v85 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("median_daily_total_screen_lock_duration"));
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "doubleValue");
          objc_msgSend(v85, "numberWithDouble:");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "setObject:forKeyedSubscript:", v88, CFSTR("median_daily_total_screen_lock_duration_home"));

          v90 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("mean_daily_total_screen_lock_duration"));
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "doubleValue");
          objc_msgSend(v90, "numberWithDouble:");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "setObject:forKeyedSubscript:", v93, CFSTR("mean_daily_total_screen_lock_duration_home"));

          v95 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("SD_daily_total_screen_lock_duration"));
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "doubleValue");
          objc_msgSend(v95, "numberWithDouble:");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "setObject:forKeyedSubscript:", v98, CFSTR("SD_daily_total_screen_lock_duration_home"));

          v100 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("median_daily_longest_screen_lock_duration"));
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "doubleValue");
          objc_msgSend(v100, "numberWithDouble:");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "setObject:forKeyedSubscript:", v103, CFSTR("median_daily_longest_screen_lock_duration_home"));

          v105 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_screen_lock_duration"));
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "doubleValue");
          objc_msgSend(v105, "numberWithDouble:");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "setObject:forKeyedSubscript:", v108, CFSTR("mean_daily_longest_screen_lock_duration_home"));

          v110 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_screen_lock_duration"));
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "doubleValue");
          objc_msgSend(v110, "numberWithDouble:");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "setObject:forKeyedSubscript:", v113, CFSTR("SD_daily_longest_screen_lock_duration_home"));

          v115 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection"));
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "doubleValue");
          objc_msgSend(v115, "numberWithDouble:");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "setObject:forKeyedSubscript:", v118, CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection_home"));

          v120 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "objectForKeyedSubscript:", CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration"));
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "doubleValue");
          objc_msgSend(v120, "numberWithDouble:");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "setObject:forKeyedSubscript:", v123, CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration_home"));

          v125 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration"));
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "doubleValue");
          objc_msgSend(v125, "numberWithDouble:");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "setObject:forKeyedSubscript:", v128, CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration_home"));

          v130 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "objectForKeyedSubscript:", CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration"));
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "doubleValue");
          objc_msgSend(v130, "numberWithDouble:");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "setObject:forKeyedSubscript:", v133, CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration_home"));

          v135 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "objectForKeyedSubscript:", CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration"));
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "doubleValue");
          objc_msgSend(v135, "numberWithDouble:");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v139, "setObject:forKeyedSubscript:", v138, CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration_home"));

          v140 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration"));
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v142, "doubleValue");
          objc_msgSend(v140, "numberWithDouble:");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "setObject:forKeyedSubscript:", v143, CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration_home"));

          v145 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v146, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration"));
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v147, "doubleValue");
          objc_msgSend(v145, "numberWithDouble:");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v149, "setObject:forKeyedSubscript:", v148, CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration_home"));

          v150 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "objectForKeyedSubscript:", CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio"));
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "doubleValue");
          objc_msgSend(v150, "numberWithDouble:");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          v155 = v154;
          v156 = v153;
          v157 = CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio_home");
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("Work")))
        {
          v158 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v159, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_charging"));
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v160, "doubleValue");
          objc_msgSend(v158, "numberWithDouble:");
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v162, "setObject:forKeyedSubscript:", v161, CFSTR("percentage_of_days_with_charging_work"));

          v163 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v164, "objectForKeyedSubscript:", CFSTR("median_daily_total_charging_duration"));
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v165, "doubleValue");
          objc_msgSend(v163, "numberWithDouble:");
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v167, "setObject:forKeyedSubscript:", v166, CFSTR("median_daily_total_charging_duration_work"));

          v168 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v169, "objectForKeyedSubscript:", CFSTR("mean_daily_total_charging_duration"));
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v170, "doubleValue");
          objc_msgSend(v168, "numberWithDouble:");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v172, "setObject:forKeyedSubscript:", v171, CFSTR("mean_daily_total_charging_duration_work"));

          v173 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v174, "objectForKeyedSubscript:", CFSTR("SD_daily_total_charging_duration"));
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v175, "doubleValue");
          objc_msgSend(v173, "numberWithDouble:");
          v176 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v177, "setObject:forKeyedSubscript:", v176, CFSTR("SD_daily_total_charging_duration_work"));

          v178 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v179, "objectForKeyedSubscript:", CFSTR("median_daily_longest_charging_duration"));
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v180, "doubleValue");
          objc_msgSend(v178, "numberWithDouble:");
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v182, "setObject:forKeyedSubscript:", v181, CFSTR("median_daily_longest_charging_duration_work"));

          v183 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v184 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_charging_duration"));
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v185, "doubleValue");
          objc_msgSend(v183, "numberWithDouble:");
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v187, "setObject:forKeyedSubscript:", v186, CFSTR("mean_daily_longest_charging_duration_work"));

          v188 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v189, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_charging_duration"));
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v190, "doubleValue");
          objc_msgSend(v188, "numberWithDouble:");
          v191 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v192 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v192, "setObject:forKeyedSubscript:", v191, CFSTR("SD_daily_longest_charging_duration_work"));

          v193 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v194, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_staticMotion"));
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v195, "doubleValue");
          objc_msgSend(v193, "numberWithDouble:");
          v196 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v197, "setObject:forKeyedSubscript:", v196, CFSTR("percentage_of_days_with_staticMotion_work"));

          v198 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v199 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v199, "objectForKeyedSubscript:", CFSTR("median_daily_total_static_motion_duration"));
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v200, "doubleValue");
          objc_msgSend(v198, "numberWithDouble:");
          v201 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v202 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v202, "setObject:forKeyedSubscript:", v201, CFSTR("median_daily_total_static_motion_duration_work"));

          v203 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v204 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v204, "objectForKeyedSubscript:", CFSTR("mean_daily_total_static_motion_duration"));
          v205 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v205, "doubleValue");
          objc_msgSend(v203, "numberWithDouble:");
          v206 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v207 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v207, "setObject:forKeyedSubscript:", v206, CFSTR("mean_daily_total_static_motion_duration_work"));

          v208 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v209, "objectForKeyedSubscript:", CFSTR("SD_daily_total_static_motion_duration"));
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v210, "doubleValue");
          objc_msgSend(v208, "numberWithDouble:");
          v211 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v212 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v212, "setObject:forKeyedSubscript:", v211, CFSTR("SD_daily_total_static_motion_duration_work"));

          v213 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v214 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v214, "objectForKeyedSubscript:", CFSTR("median_daily_longest_static_motion_duration"));
          v215 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v215, "doubleValue");
          objc_msgSend(v213, "numberWithDouble:");
          v216 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v217, "setObject:forKeyedSubscript:", v216, CFSTR("median_daily_longest_static_motion_duration_work"));

          v218 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v219, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_static_motion_duration"));
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v220, "doubleValue");
          objc_msgSend(v218, "numberWithDouble:");
          v221 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v222 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v222, "setObject:forKeyedSubscript:", v221, CFSTR("mean_daily_longest_static_motion_duration_work"));

          v223 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v224, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_static_motion_duration"));
          v225 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v225, "doubleValue");
          objc_msgSend(v223, "numberWithDouble:");
          v226 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v227 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v227, "setObject:forKeyedSubscript:", v226, CFSTR("SD_daily_longest_static_motion_duration_work"));

          v228 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v229 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_screenLock"));
          v230 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v230, "doubleValue");
          objc_msgSend(v228, "numberWithDouble:");
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v232 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v232, "setObject:forKeyedSubscript:", v231, CFSTR("percentage_of_days_with_screenLock_work"));

          v233 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v234 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v234, "objectForKeyedSubscript:", CFSTR("median_daily_total_screen_lock_duration"));
          v235 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v235, "doubleValue");
          objc_msgSend(v233, "numberWithDouble:");
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v237 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v237, "setObject:forKeyedSubscript:", v236, CFSTR("median_daily_total_screen_lock_duration_work"));

          v238 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v239, "objectForKeyedSubscript:", CFSTR("mean_daily_total_screen_lock_duration"));
          v240 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v240, "doubleValue");
          objc_msgSend(v238, "numberWithDouble:");
          v241 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v242, "setObject:forKeyedSubscript:", v241, CFSTR("mean_daily_total_screen_lock_duration_work"));

          v243 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v244 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("SD_daily_total_screen_lock_duration"));
          v245 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v245, "doubleValue");
          objc_msgSend(v243, "numberWithDouble:");
          v246 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v247 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v247, "setObject:forKeyedSubscript:", v246, CFSTR("SD_daily_total_screen_lock_duration_work"));

          v248 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v249 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v249, "objectForKeyedSubscript:", CFSTR("median_daily_longest_screen_lock_duration"));
          v250 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v250, "doubleValue");
          objc_msgSend(v248, "numberWithDouble:");
          v251 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v252 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v252, "setObject:forKeyedSubscript:", v251, CFSTR("median_daily_longest_screen_lock_duration_work"));

          v253 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v254 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v254, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_screen_lock_duration"));
          v255 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v255, "doubleValue");
          objc_msgSend(v253, "numberWithDouble:");
          v256 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v257 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v257, "setObject:forKeyedSubscript:", v256, CFSTR("mean_daily_longest_screen_lock_duration_work"));

          v258 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v259 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v259, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_screen_lock_duration"));
          v260 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v260, "doubleValue");
          objc_msgSend(v258, "numberWithDouble:");
          v261 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v262 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v262, "setObject:forKeyedSubscript:", v261, CFSTR("SD_daily_longest_screen_lock_duration_work"));

          v263 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v264 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v264, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection"));
          v265 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v265, "doubleValue");
          objc_msgSend(v263, "numberWithDouble:");
          v266 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v267 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v267, "setObject:forKeyedSubscript:", v266, CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection_work"));

          v268 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v269 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v269, "objectForKeyedSubscript:", CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration"));
          v270 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v270, "doubleValue");
          objc_msgSend(v268, "numberWithDouble:");
          v271 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v272 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v272, "setObject:forKeyedSubscript:", v271, CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration_work"));

          v273 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v274 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v274, "objectForKeyedSubscript:", CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration"));
          v275 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v275, "doubleValue");
          objc_msgSend(v273, "numberWithDouble:");
          v276 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v277 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v277, "setObject:forKeyedSubscript:", v276, CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration_work"));

          v278 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v279 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration"));
          v280 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v280, "doubleValue");
          objc_msgSend(v278, "numberWithDouble:");
          v281 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v282 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v282, "setObject:forKeyedSubscript:", v281, CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration_work"));

          v283 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v284 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v284, "objectForKeyedSubscript:", CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration"));
          v285 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v285, "doubleValue");
          objc_msgSend(v283, "numberWithDouble:");
          v286 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v287 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v287, "setObject:forKeyedSubscript:", v286, CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration_work"));

          v288 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v289 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v289, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration"));
          v290 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v290, "doubleValue");
          objc_msgSend(v288, "numberWithDouble:");
          v291 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v292 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v292, "setObject:forKeyedSubscript:", v291, CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration_work"));

          v293 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v294 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v294, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration"));
          v295 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v295, "doubleValue");
          objc_msgSend(v293, "numberWithDouble:");
          v296 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v297 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v297, "setObject:forKeyedSubscript:", v296, CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration_work"));

          v298 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "objectForKeyedSubscript:", CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio"));
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "doubleValue");
          objc_msgSend(v298, "numberWithDouble:");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          v155 = v154;
          v156 = v153;
          v157 = CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio_work");
        }
        else
        {
          if (!objc_msgSend(v9, "isEqualToString:", CFSTR("Others")))
            continue;
          v299 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v300 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v300, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_charging"));
          v301 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v301, "doubleValue");
          objc_msgSend(v299, "numberWithDouble:");
          v302 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v303 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v303, "setObject:forKeyedSubscript:", v302, CFSTR("percentage_of_days_with_charging_others"));

          v304 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v305 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v305, "objectForKeyedSubscript:", CFSTR("median_daily_total_charging_duration"));
          v306 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v306, "doubleValue");
          objc_msgSend(v304, "numberWithDouble:");
          v307 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v308 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v308, "setObject:forKeyedSubscript:", v307, CFSTR("median_daily_total_charging_duration_others"));

          v309 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v310 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v310, "objectForKeyedSubscript:", CFSTR("mean_daily_total_charging_duration"));
          v311 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v311, "doubleValue");
          objc_msgSend(v309, "numberWithDouble:");
          v312 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v313 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v313, "setObject:forKeyedSubscript:", v312, CFSTR("mean_daily_total_charging_duration_others"));

          v314 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v315 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v315, "objectForKeyedSubscript:", CFSTR("SD_daily_total_charging_duration"));
          v316 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v316, "doubleValue");
          objc_msgSend(v314, "numberWithDouble:");
          v317 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v318 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v318, "setObject:forKeyedSubscript:", v317, CFSTR("SD_daily_total_charging_duration_others"));

          v319 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v320 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v320, "objectForKeyedSubscript:", CFSTR("median_daily_longest_charging_duration"));
          v321 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v321, "doubleValue");
          objc_msgSend(v319, "numberWithDouble:");
          v322 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v323 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v323, "setObject:forKeyedSubscript:", v322, CFSTR("median_daily_longest_charging_duration_others"));

          v324 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v325 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v325, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_charging_duration"));
          v326 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v326, "doubleValue");
          objc_msgSend(v324, "numberWithDouble:");
          v327 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v328 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v328, "setObject:forKeyedSubscript:", v327, CFSTR("mean_daily_longest_charging_duration_others"));

          v329 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v330 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v330, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_charging_duration"));
          v331 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v331, "doubleValue");
          objc_msgSend(v329, "numberWithDouble:");
          v332 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v333 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v333, "setObject:forKeyedSubscript:", v332, CFSTR("SD_daily_longest_charging_duration_others"));

          v334 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v335 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v335, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_staticMotion"));
          v336 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v336, "doubleValue");
          objc_msgSend(v334, "numberWithDouble:");
          v337 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v338 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v338, "setObject:forKeyedSubscript:", v337, CFSTR("percentage_of_days_with_staticMotion_others"));

          v339 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v340 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v340, "objectForKeyedSubscript:", CFSTR("median_daily_total_static_motion_duration"));
          v341 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v341, "doubleValue");
          objc_msgSend(v339, "numberWithDouble:");
          v342 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v343 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v343, "setObject:forKeyedSubscript:", v342, CFSTR("median_daily_total_static_motion_duration_others"));

          v344 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v345 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v345, "objectForKeyedSubscript:", CFSTR("mean_daily_total_static_motion_duration"));
          v346 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v346, "doubleValue");
          objc_msgSend(v344, "numberWithDouble:");
          v347 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v348 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v348, "setObject:forKeyedSubscript:", v347, CFSTR("mean_daily_total_static_motion_duration_others"));

          v349 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v350 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v350, "objectForKeyedSubscript:", CFSTR("SD_daily_total_static_motion_duration"));
          v351 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v351, "doubleValue");
          objc_msgSend(v349, "numberWithDouble:");
          v352 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v353 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v353, "setObject:forKeyedSubscript:", v352, CFSTR("SD_daily_total_static_motion_duration_others"));

          v354 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v355 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v355, "objectForKeyedSubscript:", CFSTR("median_daily_longest_static_motion_duration"));
          v356 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v356, "doubleValue");
          objc_msgSend(v354, "numberWithDouble:");
          v357 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v358 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v358, "setObject:forKeyedSubscript:", v357, CFSTR("median_daily_longest_static_motion_duration_others"));

          v359 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v360 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v360, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_static_motion_duration"));
          v361 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v361, "doubleValue");
          objc_msgSend(v359, "numberWithDouble:");
          v362 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v363 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v363, "setObject:forKeyedSubscript:", v362, CFSTR("mean_daily_longest_static_motion_duration_others"));

          v364 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v365 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_static_motion_duration"));
          v366 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v366, "doubleValue");
          objc_msgSend(v364, "numberWithDouble:");
          v367 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v368 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v368, "setObject:forKeyedSubscript:", v367, CFSTR("SD_daily_longest_static_motion_duration_others"));

          v369 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v370 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v370, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_screenLock"));
          v371 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v371, "doubleValue");
          objc_msgSend(v369, "numberWithDouble:");
          v372 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v373 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v373, "setObject:forKeyedSubscript:", v372, CFSTR("percentage_of_days_with_screenLock_others"));

          v374 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v375 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v375, "objectForKeyedSubscript:", CFSTR("median_daily_total_screen_lock_duration"));
          v376 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v376, "doubleValue");
          objc_msgSend(v374, "numberWithDouble:");
          v377 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v378 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v378, "setObject:forKeyedSubscript:", v377, CFSTR("median_daily_total_screen_lock_duration_others"));

          v379 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v380 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v380, "objectForKeyedSubscript:", CFSTR("mean_daily_total_screen_lock_duration"));
          v381 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v381, "doubleValue");
          objc_msgSend(v379, "numberWithDouble:");
          v382 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v383 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v383, "setObject:forKeyedSubscript:", v382, CFSTR("mean_daily_total_screen_lock_duration_others"));

          v384 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v385 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v385, "objectForKeyedSubscript:", CFSTR("SD_daily_total_screen_lock_duration"));
          v386 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v386, "doubleValue");
          objc_msgSend(v384, "numberWithDouble:");
          v387 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v388 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v388, "setObject:forKeyedSubscript:", v387, CFSTR("SD_daily_total_screen_lock_duration_others"));

          v389 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v390 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v390, "objectForKeyedSubscript:", CFSTR("median_daily_longest_screen_lock_duration"));
          v391 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v391, "doubleValue");
          objc_msgSend(v389, "numberWithDouble:");
          v392 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v393 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v393, "setObject:forKeyedSubscript:", v392, CFSTR("median_daily_longest_screen_lock_duration_others"));

          v394 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v395 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v395, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_screen_lock_duration"));
          v396 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v396, "doubleValue");
          objc_msgSend(v394, "numberWithDouble:");
          v397 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v398 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v398, "setObject:forKeyedSubscript:", v397, CFSTR("mean_daily_longest_screen_lock_duration_others"));

          v399 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v400 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v400, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_screen_lock_duration"));
          v401 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v401, "doubleValue");
          objc_msgSend(v399, "numberWithDouble:");
          v402 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v403 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v403, "setObject:forKeyedSubscript:", v402, CFSTR("SD_daily_longest_screen_lock_duration_others"));

          v404 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v405 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v405, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection"));
          v406 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v406, "doubleValue");
          objc_msgSend(v404, "numberWithDouble:");
          v407 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v408 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v408, "setObject:forKeyedSubscript:", v407, CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection_others"));

          v409 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v410 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v410, "objectForKeyedSubscript:", CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration"));
          v411 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v411, "doubleValue");
          objc_msgSend(v409, "numberWithDouble:");
          v412 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v413 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v413, "setObject:forKeyedSubscript:", v412, CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration_others"));

          v414 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v415 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v415, "objectForKeyedSubscript:", CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration"));
          v416 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v416, "doubleValue");
          objc_msgSend(v414, "numberWithDouble:");
          v417 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v418 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v418, "setObject:forKeyedSubscript:", v417, CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration_others"));

          v419 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v420 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v420, "objectForKeyedSubscript:", CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration"));
          v421 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v421, "doubleValue");
          objc_msgSend(v419, "numberWithDouble:");
          v422 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v423 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v423, "setObject:forKeyedSubscript:", v422, CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration_others"));

          v424 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v425 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v425, "objectForKeyedSubscript:", CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration"));
          v426 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v426, "doubleValue");
          objc_msgSend(v424, "numberWithDouble:");
          v427 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v428 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v428, "setObject:forKeyedSubscript:", v427, CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration_others"));

          v429 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v430 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v430, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration"));
          v431 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v431, "doubleValue");
          objc_msgSend(v429, "numberWithDouble:");
          v432 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v433 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v433, "setObject:forKeyedSubscript:", v432, CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration_others"));

          v434 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v435 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v435, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration"));
          v436 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v436, "doubleValue");
          objc_msgSend(v434, "numberWithDouble:");
          v437 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v438 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v438, "setObject:forKeyedSubscript:", v437, CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration_others"));

          v439 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "objectForKeyedSubscript:", CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio"));
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "doubleValue");
          objc_msgSend(v439, "numberWithDouble:");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          v155 = v154;
          v156 = v153;
          v157 = CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio_others");
        }
        objc_msgSend(v154, "setObject:forKeyedSubscript:", v156, v157);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v444, v448, 16);
    }
    while (v7);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v442, v442);
  v440 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v441 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v441, "setObject:forKeyedSubscript:", v440, CFSTR("data_source"));

}

+ (id)DataSourceToString:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 2)
    v3 = CFSTR("BiomeStream");
  if (a3 == 1)
    return CFSTR("CoreDuet");
  else
    return (id)v3;
}

+ (id)calculateMLFeaturesUsingBiomeManager:(id)a3 intervalDictionary:(id)a4 startDate:(id)a5 endDate:(id)a6 createBucketedFeatures:(BOOL)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  uint64_t kk;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  BOOL v197;
  void *v198;
  BOOL v199;
  uint64_t v200;
  id v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t k;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  _BOOL4 v211;
  void *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t m;
  uint64_t v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  uint64_t v221;
  uint64_t n;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  double v230;
  double v231;
  double v232;
  void *v233;
  void *v234;
  double v235;
  double v236;
  void *v237;
  void *v238;
  double v239;
  _BOOL4 v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  double v248;
  double v249;
  void *v250;
  void *v251;
  void *v252;
  double v253;
  void *v254;
  void *v255;
  void *v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  void *v260;
  double v261;
  _BOOL4 v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t ii;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  double v285;
  double v286;
  void *v287;
  void *v288;
  void *v289;
  double v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  double v295;
  double v296;
  void *v297;
  void *v298;
  double v299;
  double v300;
  void *v301;
  void *v302;
  void *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t jj;
  void *v307;
  void *v308;
  void *v309;
  BOOL v310;
  uint64_t v311;
  void *v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t mm;
  uint64_t v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  uint64_t nn;
  uint64_t v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  void *v415;
  void *v416;
  void *v417;
  void *v418;
  void *v419;
  void *v420;
  void *v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  void *v433;
  void *v434;
  void *v435;
  void *v436;
  void *v437;
  void *v438;
  void *v439;
  void *v440;
  void *v441;
  void *v442;
  void *v443;
  void *v444;
  void *v445;
  void *v446;
  void *v447;
  void *v448;
  void *v449;
  void *v450;
  void *v451;
  void *v452;
  void *v453;
  void *v454;
  void *v455;
  void *v456;
  void *v457;
  void *v458;
  void *v459;
  void *v460;
  void *v461;
  void *v462;
  void *v463;
  void *v464;
  void *v465;
  void *v466;
  void *v467;
  void *v468;
  void *v469;
  void *v470;
  void *v471;
  void *v472;
  void *v474;
  void *v475;
  uint64_t v476;
  uint64_t v477;
  void *v478;
  id obj;
  void *v480;
  uint64_t v481;
  void *v482;
  _BOOL4 v483;
  id v484;
  id v485;
  void *v486;
  id v487;
  id v488;
  id v489;
  uint64_t v490;
  void *v491;
  void *v492;
  int v493;
  id v494;
  id v495;
  id v496;
  id v497;
  uint64_t v498;
  void *v499;
  void *context;
  void *contexta;
  void *v503;
  uint64_t v504;
  id v505;
  void *v506;
  void *v507;
  void *v508;
  id v509;
  id v510;
  id v511;
  void *v512;
  uint64_t v513;
  uint64_t v514;
  void *v515;
  void *v516;
  void *v517;
  uint64_t v518;
  void *v519;
  void *v520;
  uint64_t v521;
  id v522;
  __int128 v523;
  __int128 v524;
  __int128 v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  __int128 v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int128 v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  __int128 v545;
  __int128 v546;
  __int128 v547;
  __int128 v548;
  __int128 v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  _QWORD v559[5];
  uint64_t v560;
  uint64_t *v561;
  uint64_t v562;
  uint64_t (*v563)(uint64_t, uint64_t);
  void (*v564)(uint64_t);
  id v565;
  __int128 v566;
  __int128 v567;
  __int128 v568;
  __int128 v569;
  __int128 v570;
  __int128 v571;
  __int128 v572;
  __int128 v573;
  __int128 v574;
  __int128 v575;
  __int128 v576;
  __int128 v577;
  _QWORD v578[4];
  id v579;
  _BYTE v580[128];
  _BYTE v581[128];
  _BYTE v582[128];
  _BYTE v583[128];
  _BYTE v584[128];
  _BYTE v585[128];
  _BYTE v586[128];
  _BYTE v587[128];
  _BYTE v588[128];
  _BYTE v589[128];
  _QWORD v590[4];
  _BYTE v591[128];
  _BYTE v592[128];
  uint64_t v593;

  v483 = a7;
  v593 = *MEMORY[0x1E0C80C00];
  v485 = a3;
  v10 = a4;
  v11 = a5;
  v488 = a6;
  v522 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = (void *)MEMORY[0x1E0CB3880];
  v578[0] = MEMORY[0x1E0C809B0];
  v578[1] = 3221225472;
  v578[2] = __119__RTPlaceDataMetrics_calculateMLFeaturesUsingBiomeManager_intervalDictionary_startDate_endDate_createBucketedFeatures___block_invoke;
  v578[3] = &unk_1E929B790;
  v489 = v11;
  v579 = v489;
  objc_msgSend(v12, "predicateWithBlock:", v578);
  v515 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  v577 = 0u;
  v576 = 0u;
  v575 = 0u;
  v574 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v574, v592, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v575;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v575 != v16)
          objc_enumerationMutation(v14);
        v18 = *(_QWORD *)(*((_QWORD *)&v574 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "filteredArrayUsingPredicate:", v515);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, v18);

      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v574, v592, 16);
    }
    while (v15);
  }

  v505 = v13;
  if (objc_msgSend(v505, "count") && objc_msgSend(v489, "compare:", v488) != 1)
  {
    v573 = 0u;
    v572 = 0u;
    v570 = 0u;
    v571 = 0u;
    objc_msgSend(v505, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v570, v591, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v571;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v571 != v23)
            objc_enumerationMutation(v21);
          v25 = *(_QWORD *)(*((_QWORD *)&v570 + 1) + 8 * j);
          v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v522, "setObject:forKeyedSubscript:", v26, v25);

          v27 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v27, "numberWithDouble:");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, CFSTR("percentage_of_days_with_charging"));

          v30 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v30, "numberWithDouble:");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, CFSTR("median_daily_total_charging_duration"));

          v33 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v33, "numberWithDouble:");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, CFSTR("mean_daily_total_charging_duration"));

          v36 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v36, "numberWithDouble:");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, CFSTR("SD_daily_total_charging_duration"));

          v39 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v39, "numberWithDouble:");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setObject:forKeyedSubscript:", v40, CFSTR("median_daily_longest_charging_duration"));

          v42 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v42, "numberWithDouble:");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, CFSTR("mean_daily_longest_charging_duration"));

          v45 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v45, "numberWithDouble:");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v46, CFSTR("SD_daily_longest_charging_duration"));

          v48 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v48, "numberWithDouble:");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setObject:forKeyedSubscript:", v49, CFSTR("percentage_of_days_with_staticMotion"));

          v51 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v51, "numberWithDouble:");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setObject:forKeyedSubscript:", v52, CFSTR("median_daily_total_static_motion_duration"));

          v54 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v54, "numberWithDouble:");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v55, CFSTR("mean_daily_total_static_motion_duration"));

          v57 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v57, "numberWithDouble:");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setObject:forKeyedSubscript:", v58, CFSTR("SD_daily_total_static_motion_duration"));

          v60 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v60, "numberWithDouble:");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "setObject:forKeyedSubscript:", v61, CFSTR("median_daily_longest_static_motion_duration"));

          v63 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v63, "numberWithDouble:");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setObject:forKeyedSubscript:", v64, CFSTR("mean_daily_longest_static_motion_duration"));

          v66 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v66, "numberWithDouble:");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setObject:forKeyedSubscript:", v67, CFSTR("SD_daily_longest_static_motion_duration"));

          v69 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v69, "numberWithDouble:");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "setObject:forKeyedSubscript:", v70, CFSTR("percentage_of_days_with_screenLock"));

          v72 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v72, "numberWithDouble:");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "setObject:forKeyedSubscript:", v73, CFSTR("median_daily_total_screen_lock_duration"));

          v75 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v75, "numberWithDouble:");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "setObject:forKeyedSubscript:", v76, CFSTR("mean_daily_total_screen_lock_duration"));

          v78 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v78, "numberWithDouble:");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "setObject:forKeyedSubscript:", v79, CFSTR("SD_daily_total_screen_lock_duration"));

          v81 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v81, "numberWithDouble:");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "setObject:forKeyedSubscript:", v82, CFSTR("median_daily_longest_screen_lock_duration"));

          v84 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v84, "numberWithDouble:");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "setObject:forKeyedSubscript:", v85, CFSTR("mean_daily_longest_screen_lock_duration"));

          v87 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v87, "numberWithDouble:");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "setObject:forKeyedSubscript:", v88, CFSTR("SD_daily_longest_screen_lock_duration"));

          v90 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v90, "numberWithDouble:");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "setObject:forKeyedSubscript:", v91, CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection"));

          v93 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v93, "numberWithDouble:");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "setObject:forKeyedSubscript:", v94, CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration"));

          v96 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v96, "numberWithDouble:");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setObject:forKeyedSubscript:", v97, CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration"));

          v99 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v99, "numberWithDouble:");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "setObject:forKeyedSubscript:", v100, CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration"));

          v102 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v102, "numberWithDouble:");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "setObject:forKeyedSubscript:", v103, CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration"));

          v105 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v105, "numberWithDouble:");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "setObject:forKeyedSubscript:", v106, CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration"));

          v108 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v108, "numberWithDouble:");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "setObject:forKeyedSubscript:", v109, CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration"));

          v111 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(&unk_1E932CE00, "doubleValue");
          objc_msgSend(v111, "numberWithDouble:");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "setObject:forKeyedSubscript:", v112, CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio"));

          v114 = (void *)objc_opt_new();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "setObject:forKeyedSubscript:", v114, CFSTR("eventHappenedArray"));

          v116 = (void *)objc_opt_new();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "setObject:forKeyedSubscript:", v116, CFSTR("eventLongestArray"));

          v118 = (void *)objc_opt_new();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "setObject:forKeyedSubscript:", v118, CFSTR("eventTotalArray"));

          v120 = (void *)objc_opt_new();
          objc_msgSend(v522, "objectForKeyedSubscript:", v25);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "setObject:forKeyedSubscript:", v120, CFSTR("wifiStabilityArray"));

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v570, v591, 16);
      }
      while (v22);
    }

    v122 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18408]), "initWithFirstObject:secondObject:", CFSTR("Charging"), &unk_1E9327410);
    v590[0] = v122;
    v123 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18408]), "initWithFirstObject:secondObject:", CFSTR("StaticMotion"), &unk_1E9327428);
    v590[1] = v123;
    v124 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18408]), "initWithFirstObject:secondObject:", CFSTR("ScreenLock"), &unk_1E9327440);
    v590[2] = v124;
    v125 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18408]), "initWithFirstObject:secondObject:", CFSTR("WiFiConnection"), &unk_1E9327458);
    v590[3] = v125;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v590, 4);
    v126 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v486 = (void *)objc_claimAutoreleasedReturnValue();
    v487 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    v484 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v488, "dateByAddingTimeInterval:", -2419200.0);
    v480 = (void *)objc_claimAutoreleasedReturnValue();
    v568 = 0u;
    v569 = 0u;
    v566 = 0u;
    v567 = 0u;
    obj = v126;
    v481 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v566, v589, 16);
    if (v481)
    {
      v476 = *(_QWORD *)v567;
      do
      {
        v127 = 0;
        do
        {
          if (*(_QWORD *)v567 != v476)
          {
            v128 = v127;
            objc_enumerationMutation(obj);
            v127 = v128;
          }
          v477 = v127;
          v129 = *(void **)(*((_QWORD *)&v566 + 1) + 8 * v127);
          v478 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(v129, "firstObject");
          v506 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "secondObject");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          v490 = objc_msgSend(v130, "integerValue");

          objc_msgSend(v487, "setDay:", 0);
          objc_msgSend(v486, "dateByAddingComponents:toDate:options:", v487, v489, 0);
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v484, "setDay:", 0);
          objc_msgSend(v486, "dateByAddingComponents:toDate:options:", v484, v489, 0);
          v494 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v494, "earlierDate:", v488);
          v132 = (id)objc_claimAutoreleasedReturnValue();
          LODWORD(v130) = v132 == v494;

          if ((_DWORD)v130)
          {
            while (1)
            {
              v474 = (void *)MEMORY[0x1D8231EA8]();
              objc_msgSend(v484, "setDay:", objc_msgSend(v484, "day") + 3);
              objc_msgSend(v486, "dateByAddingComponents:toDate:options:", v484, v489, 0);
              v482 = (void *)objc_claimAutoreleasedReturnValue();
              v475 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v494, v482);
              v560 = 0;
              v561 = &v560;
              v562 = 0x3032000000;
              v563 = __Block_byref_object_copy__41;
              v564 = __Block_byref_object_dispose__41;
              v565 = (id)objc_opt_new();
              objc_msgSend(v475, "endDate");
              v195 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v480, "earlierDate:", v195);
              v196 = (void *)objc_claimAutoreleasedReturnValue();
              v197 = v196 == v480;

              if (v197)
              {
                v559[0] = MEMORY[0x1E0C809B0];
                v559[1] = 3221225472;
                v559[2] = __119__RTPlaceDataMetrics_calculateMLFeaturesUsingBiomeManager_intervalDictionary_startDate_endDate_createBucketedFeatures___block_invoke_1146;
                v559[3] = &unk_1E929B7E0;
                v559[4] = &v560;
                objc_msgSend(v485, "enumerateEventsWithinDateInterval:streamType:handler:", v475, v490, v559);
              }
              v493 = 1;
              while (1)
              {
                objc_msgSend(v131, "earlierDate:", v488);
                v198 = (void *)objc_claimAutoreleasedReturnValue();
                v517 = v131;
                v199 = v198 == v131;

                if (!v199)
                  break;
                objc_msgSend(v487, "setDay:", objc_msgSend(v487, "day") + 1);
                objc_msgSend(v486, "dateByAddingComponents:toDate:options:", v487, v489, 0);
                v200 = objc_claimAutoreleasedReturnValue();
                v520 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v131, v200);
                v508 = (void *)v200;
                v499 = (void *)objc_opt_new();
                v557 = 0u;
                v558 = 0u;
                v555 = 0u;
                v556 = 0u;
                v201 = (id)v561[5];
                v202 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v555, v588, 16);
                if (v202)
                {
                  v203 = *(_QWORD *)v556;
                  do
                  {
                    for (k = 0; k != v202; ++k)
                    {
                      if (*(_QWORD *)v556 != v203)
                        objc_enumerationMutation(v201);
                      v205 = *(void **)(*((_QWORD *)&v555 + 1) + 8 * k);
                      objc_msgSend(v205, "startDate");
                      v206 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v517, "earlierDate:", v206);
                      v207 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v207 == v517)
                      {
                        objc_msgSend(v205, "startDate");
                        v208 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v208, "earlierDate:", v508);
                        v209 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v205, "startDate");
                        v210 = (void *)objc_claimAutoreleasedReturnValue();
                        v211 = v209 == v210;

                        if (v211)
                          objc_msgSend(v499, "addObject:", v205);
                      }
                      else
                      {

                      }
                    }
                    v202 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v555, v588, 16);
                  }
                  while (v202);
                }

                if (objc_msgSend(v499, "count"))
                {
                  v549 = 0uLL;
                  v550 = 0uLL;
                  v547 = 0uLL;
                  v548 = 0uLL;
                  objc_msgSend(v522, "allKeys");
                  v212 = (void *)objc_claimAutoreleasedReturnValue();
                  v213 = objc_msgSend(v212, "countByEnumeratingWithState:objects:count:", &v547, v586, 16);
                  if (v213)
                  {
                    v214 = *(_QWORD *)v548;
                    do
                    {
                      for (m = 0; m != v213; ++m)
                      {
                        if (*(_QWORD *)v548 != v214)
                          objc_enumerationMutation(v212);
                        v216 = *(_QWORD *)(*((_QWORD *)&v547 + 1) + 8 * m);
                        objc_msgSend(v522, "objectForKeyedSubscript:", v216);
                        v217 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v217, "setObject:forKeyedSubscript:", &unk_1E932CED0, CFSTR("eventTotalDaily"));

                        objc_msgSend(v522, "objectForKeyedSubscript:", v216);
                        v218 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v218, "setObject:forKeyedSubscript:", &unk_1E932CED0, CFSTR("eventLongestDaily"));

                        objc_msgSend(v522, "objectForKeyedSubscript:", v216);
                        v219 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v219, "setObject:forKeyedSubscript:", &unk_1E932CED0, CFSTR("wifiTotalDaily"));

                        objc_msgSend(v522, "objectForKeyedSubscript:", v216);
                        v220 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v220, "setObject:forKeyedSubscript:", &unk_1E932CED0, CFSTR("visitTotalDaily"));

                      }
                      v213 = objc_msgSend(v212, "countByEnumeratingWithState:objects:count:", &v547, v586, 16);
                    }
                    while (v213);
                  }

                  v545 = 0u;
                  v546 = 0u;
                  v543 = 0u;
                  v544 = 0u;
                  v510 = v499;
                  v221 = objc_msgSend(v510, "countByEnumeratingWithState:objects:count:", &v543, v585, 16);
                  if (v221)
                  {
                    v513 = *(_QWORD *)v544;
                    do
                    {
                      for (n = 0; n != v221; ++n)
                      {
                        if (*(_QWORD *)v544 != v513)
                          objc_enumerationMutation(v510);
                        v223 = *(void **)(*((_QWORD *)&v543 + 1) + 8 * n);
                        v224 = (void *)MEMORY[0x1D8231EA8]();
                        objc_msgSend(a1, "labelAnEventInterval:basedOnIntervalDict:", v223, v505);
                        v225 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v505, "objectForKeyedSubscript:", v225);
                        v226 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v226)
                        {
                          v227 = (void *)MEMORY[0x1E0CB37E8];
                          objc_msgSend(v522, "objectForKeyedSubscript:", v225);
                          v228 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v228, "objectForKeyedSubscript:", CFSTR("eventTotalDaily"));
                          v229 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v229, "doubleValue");
                          v231 = v230;
                          objc_msgSend(v223, "duration");
                          objc_msgSend(v227, "numberWithDouble:", v231 + v232);
                          v233 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v522, "objectForKeyedSubscript:", v225);
                          v234 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v234, "setObject:forKeyedSubscript:", v233, CFSTR("eventTotalDaily"));

                          objc_msgSend(v223, "duration");
                          v236 = v235;
                          objc_msgSend(v522, "objectForKeyedSubscript:", v225);
                          v237 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v237, "objectForKeyedSubscript:", CFSTR("eventLongestDaily"));
                          v238 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v238, "doubleValue");
                          v240 = v236 > v239;

                          if (v240)
                          {
                            v241 = (void *)MEMORY[0x1E0CB37E8];
                            objc_msgSend(v223, "duration");
                            objc_msgSend(v241, "numberWithDouble:");
                            v242 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v522, "objectForKeyedSubscript:", v225);
                            v243 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v243, "setObject:forKeyedSubscript:", v242, CFSTR("eventLongestDaily"));

                          }
                          if (objc_msgSend(v506, "isEqual:", CFSTR("WiFiConnection")))
                          {
                            objc_msgSend(v520, "intersectionWithDateInterval:", v223);
                            v244 = (void *)objc_claimAutoreleasedReturnValue();
                            v245 = v244;
                            if (v244)
                            {
                              objc_msgSend(v244, "endDate");
                              v246 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v245, "startDate");
                              v247 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v246, "timeIntervalSinceDate:", v247);
                              v249 = v248;

                              v250 = (void *)MEMORY[0x1E0CB37E8];
                              objc_msgSend(v522, "objectForKeyedSubscript:", v225);
                              v251 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v251, "objectForKeyedSubscript:", CFSTR("wifiTotalDaily"));
                              v252 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v252, "doubleValue");
                              objc_msgSend(v250, "numberWithDouble:", v249 + v253);
                              v254 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v522, "objectForKeyedSubscript:", v225);
                              v255 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v255, "setObject:forKeyedSubscript:", v254, CFSTR("wifiTotalDaily"));

                            }
                          }
                        }

                        objc_autoreleasePoolPop(v224);
                      }
                      v221 = objc_msgSend(v510, "countByEnumeratingWithState:objects:count:", &v543, v585, 16);
                    }
                    while (v221);
                  }

                  v541 = 0u;
                  v542 = 0u;
                  v539 = 0u;
                  v540 = 0u;
                  objc_msgSend(v522, "allKeys");
                  v256 = (void *)objc_claimAutoreleasedReturnValue();
                  v257 = objc_msgSend(v256, "countByEnumeratingWithState:objects:count:", &v539, v584, 16);
                  if (v257)
                  {
                    v497 = v256;
                    contexta = *(void **)v540;
                    while (1)
                    {
                      v514 = 0;
                      v504 = v257;
                      do
                      {
                        if (*(void **)v540 != contexta)
                          objc_enumerationMutation(v497);
                        v258 = *(_QWORD *)(*((_QWORD *)&v539 + 1) + 8 * v514);
                        v511 = (id)MEMORY[0x1D8231EA8]();
                        objc_msgSend(v522, "objectForKeyedSubscript:", v258);
                        v259 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v259, "objectForKeyedSubscript:", CFSTR("eventTotalDaily"));
                        v260 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v260, "doubleValue");
                        v262 = v261 > 0.0;

                        if (v262)
                        {
                          objc_msgSend(v522, "objectForKeyedSubscript:", v258);
                          v263 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v263, "objectForKeyedSubscript:", CFSTR("eventHappenedArray"));
                          v264 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v264, "addObject:", &unk_1E932CE30);

                          objc_msgSend(v522, "objectForKeyedSubscript:", v258);
                          v265 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v265, "objectForKeyedSubscript:", CFSTR("eventTotalArray"));
                          v266 = (void *)objc_claimAutoreleasedReturnValue();
                          v267 = (void *)MEMORY[0x1E0CB37E8];
                          objc_msgSend(v522, "objectForKeyedSubscript:", v258);
                          v268 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v268, "objectForKeyedSubscript:", CFSTR("eventTotalDaily"));
                          v269 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v269, "doubleValue");
                          objc_msgSend(v267, "numberWithDouble:");
                          v270 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v266, "addObject:", v270);

                          objc_msgSend(v522, "objectForKeyedSubscript:", v258);
                          v271 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v271, "objectForKeyedSubscript:", CFSTR("eventLongestArray"));
                          v272 = (void *)objc_claimAutoreleasedReturnValue();
                          v273 = (void *)MEMORY[0x1E0CB37E8];
                          objc_msgSend(v522, "objectForKeyedSubscript:", v258);
                          v274 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v274, "objectForKeyedSubscript:", CFSTR("eventLongestDaily"));
                          v275 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v275, "doubleValue");
                          objc_msgSend(v273, "numberWithDouble:");
                          v276 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v272, "addObject:", v276);

                          if (!objc_msgSend(v506, "isEqual:", CFSTR("WiFiConnection")))
                            goto LABEL_107;
                          v537 = 0u;
                          v538 = 0u;
                          v535 = 0u;
                          v536 = 0u;
                          objc_msgSend(v505, "objectForKeyedSubscript:", v258);
                          v277 = (void *)objc_claimAutoreleasedReturnValue();
                          v278 = objc_msgSend(v277, "countByEnumeratingWithState:objects:count:", &v535, v583, 16);
                          if (v278)
                          {
                            v279 = *(_QWORD *)v536;
                            do
                            {
                              for (ii = 0; ii != v278; ++ii)
                              {
                                if (*(_QWORD *)v536 != v279)
                                  objc_enumerationMutation(v277);
                                objc_msgSend(v520, "intersectionWithDateInterval:", *(_QWORD *)(*((_QWORD *)&v535 + 1) + 8 * ii));
                                v281 = (void *)objc_claimAutoreleasedReturnValue();
                                v282 = v281;
                                if (v281)
                                {
                                  objc_msgSend(v281, "endDate");
                                  v283 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v282, "startDate");
                                  v284 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v283, "timeIntervalSinceDate:", v284);
                                  v286 = v285;

                                  v287 = (void *)MEMORY[0x1E0CB37E8];
                                  objc_msgSend(v522, "objectForKeyedSubscript:", v258);
                                  v288 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v288, "objectForKeyedSubscript:", CFSTR("visitTotalDaily"));
                                  v289 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v289, "doubleValue");
                                  objc_msgSend(v287, "numberWithDouble:", v286 + v290);
                                  v291 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v522, "objectForKeyedSubscript:", v258);
                                  v292 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v292, "setObject:forKeyedSubscript:", v291, CFSTR("visitTotalDaily"));

                                }
                              }
                              v278 = objc_msgSend(v277, "countByEnumeratingWithState:objects:count:", &v535, v583, 16);
                            }
                            while (v278);
                          }

                          objc_msgSend(v522, "objectForKeyedSubscript:", v258);
                          v293 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v293, "objectForKeyedSubscript:", CFSTR("wifiTotalDaily"));
                          v294 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v294, "doubleValue");
                          v296 = v295;

                          objc_msgSend(v522, "objectForKeyedSubscript:", v258);
                          v297 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v297, "objectForKeyedSubscript:", CFSTR("visitTotalDaily"));
                          v298 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v298, "doubleValue");
                          v300 = v299;

                          if (v296 <= 0.0 || v300 <= 0.0)
                          {
                            objc_msgSend(v522, "objectForKeyedSubscript:", v258);
                            v301 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v301, "objectForKeyedSubscript:", CFSTR("wifiStabilityArray"));
                            v302 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v302, "addObject:", &unk_1E932CED0);
                          }
                          else
                          {
                            objc_msgSend(v522, "objectForKeyedSubscript:", v258);
                            v301 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v301, "objectForKeyedSubscript:", CFSTR("wifiStabilityArray"));
                            v302 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v296 / v300);
                            v303 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v302, "addObject:", v303);

                          }
                        }
                        else
                        {
                          objc_msgSend(v522, "objectForKeyedSubscript:", v258);
                          v301 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v301, "objectForKeyedSubscript:", CFSTR("eventHappenedArray"));
                          v302 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v302, "addObject:", &unk_1E932CED0);
                        }

LABEL_107:
                        objc_autoreleasePoolPop(v511);
                        ++v514;
                      }
                      while (v514 != v504);
                      v257 = objc_msgSend(v497, "countByEnumeratingWithState:objects:count:", &v539, v584, 16);
                      if (!v257)
                      {
                        v256 = v497;
                        break;
                      }
                    }
                  }
                }
                else
                {
                  v553 = 0uLL;
                  v554 = 0uLL;
                  v551 = 0uLL;
                  v552 = 0uLL;
                  objc_msgSend(v522, "allKeys");
                  v256 = (void *)objc_claimAutoreleasedReturnValue();
                  v304 = objc_msgSend(v256, "countByEnumeratingWithState:objects:count:", &v551, v587, 16);
                  if (v304)
                  {
                    v305 = *(_QWORD *)v552;
                    do
                    {
                      for (jj = 0; jj != v304; ++jj)
                      {
                        if (*(_QWORD *)v552 != v305)
                          objc_enumerationMutation(v256);
                        objc_msgSend(v522, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v551 + 1) + 8 * jj));
                        v307 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("eventHappenedArray"));
                        v308 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v308, "addObject:", &unk_1E932CED0);

                      }
                      v304 = objc_msgSend(v256, "countByEnumeratingWithState:objects:count:", &v551, v587, 16);
                    }
                    while (v304);
                  }
                }

                v133 = v508;
                v131 = v508;
                if (++v493 == 4)
                  goto LABEL_122;
              }
              v133 = v131;
LABEL_122:

              _Block_object_dispose(&v560, 8);
              objc_autoreleasePoolPop(v474);
              objc_msgSend(v482, "earlierDate:", v488);
              v309 = (void *)objc_claimAutoreleasedReturnValue();
              v310 = v309 == v482;

              v131 = v133;
              v494 = v482;
              if (!v310)
                goto LABEL_24;
            }
          }
          v482 = v494;
          v133 = v131;
LABEL_24:
          v533 = 0u;
          v534 = 0u;
          v531 = 0u;
          v532 = 0u;
          objc_msgSend(v522, "allKeys");
          v495 = (id)objc_claimAutoreleasedReturnValue();
          v498 = objc_msgSend(v495, "countByEnumeratingWithState:objects:count:", &v531, v582, 16);
          if (!v498)
            goto LABEL_47;
          v496 = *(id *)v532;
          do
          {
            for (kk = 0; kk != v498; ++kk)
            {
              if (*(id *)v532 != v496)
                objc_enumerationMutation(v495);
              v135 = *(_QWORD *)(*((_QWORD *)&v531 + 1) + 8 * kk);
              context = (void *)MEMORY[0x1D8231EA8]();
              objc_msgSend(v522, "objectForKeyedSubscript:", v135);
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v136, "objectForKeyedSubscript:", CFSTR("eventHappenedArray"));
              v137 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v522, "objectForKeyedSubscript:", v135);
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("eventTotalArray"));
              v139 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v522, "objectForKeyedSubscript:", v135);
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v140, "objectForKeyedSubscript:", CFSTR("eventLongestArray"));
              v141 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v137, "count"))
              {
                v142 = (void *)MEMORY[0x1E0CB37E8];
                +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v137);
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v143, "doubleValue");
                objc_msgSend(v142, "numberWithDouble:");
                v503 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v503 = &unk_1E932CE00;
              }
              v144 = objc_msgSend(v139, "count");
              v145 = &unk_1E932CE00;
              v516 = &unk_1E932CE00;
              v519 = &unk_1E932CE00;
              v509 = &unk_1E932CE00;
              v512 = &unk_1E932CE00;
              v507 = &unk_1E932CE00;
              if (v144 == objc_msgSend(v141, "count"))
              {
                if (objc_msgSend(v139, "count"))
                {
                  v146 = (void *)MEMORY[0x1E0CB37E8];
                  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v139);
                  v147 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v147, "doubleValue");
                  objc_msgSend(v146, "numberWithDouble:");
                  v519 = (void *)objc_claimAutoreleasedReturnValue();

                  v148 = (void *)MEMORY[0x1E0CB37E8];
                  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v139);
                  v149 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v149, "doubleValue");
                  objc_msgSend(v148, "numberWithDouble:");
                  v516 = (void *)objc_claimAutoreleasedReturnValue();

                  v150 = (void *)MEMORY[0x1E0CB37E8];
                  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v139);
                  v151 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v151, "doubleValue");
                  objc_msgSend(v150, "numberWithDouble:");
                  v512 = (void *)objc_claimAutoreleasedReturnValue();

                  v152 = (void *)MEMORY[0x1E0CB37E8];
                  +[RTPlaceDataMetrics medianOf:](RTPlaceDataMetrics, "medianOf:", v141);
                  v153 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v153, "doubleValue");
                  objc_msgSend(v152, "numberWithDouble:");
                  v509 = (id)objc_claimAutoreleasedReturnValue();

                  v154 = (void *)MEMORY[0x1E0CB37E8];
                  +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v141);
                  v155 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v155, "doubleValue");
                  objc_msgSend(v154, "numberWithDouble:");
                  v507 = (void *)objc_claimAutoreleasedReturnValue();

                  v156 = (void *)MEMORY[0x1E0CB37E8];
                  +[RTPlaceDataMetrics standardDeviationOf:](RTPlaceDataMetrics, "standardDeviationOf:", v141);
                  v157 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v157, "doubleValue");
                  objc_msgSend(v156, "numberWithDouble:");
                  v145 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v516 = &unk_1E932CE00;
                  v519 = &unk_1E932CE00;
                  v509 = &unk_1E932CE00;
                  v512 = &unk_1E932CE00;
                  v507 = &unk_1E932CE00;
                }
              }
              if (objc_msgSend(v506, "isEqual:", CFSTR("Charging")))
              {
                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v158 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v158, "setObject:forKeyedSubscript:", v503, CFSTR("percentage_of_days_with_charging"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v159 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v159, "setObject:forKeyedSubscript:", v519, CFSTR("median_daily_total_charging_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v160 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v160, "setObject:forKeyedSubscript:", v516, CFSTR("mean_daily_total_charging_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v161 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v161, "setObject:forKeyedSubscript:", v512, CFSTR("SD_daily_total_charging_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v162 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v162, "setObject:forKeyedSubscript:", v509, CFSTR("median_daily_longest_charging_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v163 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v163, "setObject:forKeyedSubscript:", v507, CFSTR("mean_daily_longest_charging_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v164 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v164, "setObject:forKeyedSubscript:", v145, CFSTR("SD_daily_longest_charging_duration"));
              }
              else if (objc_msgSend(v506, "isEqual:", CFSTR("StaticMotion")))
              {
                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v165 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v165, "setObject:forKeyedSubscript:", v503, CFSTR("percentage_of_days_with_staticMotion"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v166 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v166, "setObject:forKeyedSubscript:", v519, CFSTR("median_daily_total_static_motion_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v167, "setObject:forKeyedSubscript:", v516, CFSTR("mean_daily_total_static_motion_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v168 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v168, "setObject:forKeyedSubscript:", v512, CFSTR("SD_daily_total_static_motion_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v169 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v169, "setObject:forKeyedSubscript:", v509, CFSTR("median_daily_longest_static_motion_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v170 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v170, "setObject:forKeyedSubscript:", v507, CFSTR("mean_daily_longest_static_motion_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v164 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v164, "setObject:forKeyedSubscript:", v145, CFSTR("SD_daily_longest_static_motion_duration"));
              }
              else if (objc_msgSend(v506, "isEqual:", CFSTR("ScreenLock")))
              {
                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v171 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v171, "setObject:forKeyedSubscript:", v503, CFSTR("percentage_of_days_with_screenLock"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v172 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v172, "setObject:forKeyedSubscript:", v519, CFSTR("median_daily_total_screen_lock_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v173 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v173, "setObject:forKeyedSubscript:", v516, CFSTR("mean_daily_total_screen_lock_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v174, "setObject:forKeyedSubscript:", v512, CFSTR("SD_daily_total_screen_lock_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v175 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v175, "setObject:forKeyedSubscript:", v509, CFSTR("median_daily_longest_screen_lock_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v176 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v176, "setObject:forKeyedSubscript:", v507, CFSTR("mean_daily_longest_screen_lock_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v164 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v164, "setObject:forKeyedSubscript:", v145, CFSTR("SD_daily_longest_screen_lock_duration"));
              }
              else
              {
                if (!objc_msgSend(v506, "isEqual:", CFSTR("WiFiConnection")))
                  goto LABEL_45;
                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v177 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v177, "setObject:forKeyedSubscript:", v503, CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v178 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v178, "setObject:forKeyedSubscript:", v519, CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v179 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v179, "setObject:forKeyedSubscript:", v516, CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v180 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v180, "setObject:forKeyedSubscript:", v512, CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v181 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v181, "setObject:forKeyedSubscript:", v509, CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v182 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v182, "setObject:forKeyedSubscript:", v507, CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v183 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v183, "setObject:forKeyedSubscript:", v145, CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration"));

                v184 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v492 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v492, "objectForKeyedSubscript:", CFSTR("wifiStabilityArray"));
                v491 = (void *)objc_claimAutoreleasedReturnValue();
                +[RTPlaceDataMetrics meanOf:](RTPlaceDataMetrics, "meanOf:", v491);
                v185 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v185, "doubleValue");
                objc_msgSend(v184, "numberWithDouble:");
                v186 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v187 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v187, "setObject:forKeyedSubscript:", v186, CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio"));

                objc_msgSend(v522, "objectForKeyedSubscript:", v135);
                v164 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v164, "objectForKeyedSubscript:", CFSTR("wifiStabilityArray"));
                v188 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v188, "removeAllObjects");

              }
LABEL_45:
              objc_msgSend(v522, "objectForKeyedSubscript:", v135);
              v189 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v189, "objectForKeyedSubscript:", CFSTR("eventHappenedArray"));
              v190 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v190, "removeAllObjects");

              objc_msgSend(v522, "objectForKeyedSubscript:", v135);
              v191 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v191, "objectForKeyedSubscript:", CFSTR("eventLongestArray"));
              v192 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v192, "removeAllObjects");

              objc_msgSend(v522, "objectForKeyedSubscript:", v135);
              v193 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v193, "objectForKeyedSubscript:", CFSTR("eventTotalArray"));
              v194 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v194, "removeAllObjects");

              objc_autoreleasePoolPop(context);
            }
            v498 = objc_msgSend(v495, "countByEnumeratingWithState:objects:count:", &v531, v582, 16);
          }
          while (v498);
LABEL_47:

          objc_autoreleasePoolPop(v478);
          v127 = v477 + 1;
        }
        while (v477 + 1 != v481);
        v311 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v566, v589, 16);
        v481 = v311;
      }
      while (v311);
    }

    v529 = 0u;
    v530 = 0u;
    v527 = 0u;
    v528 = 0u;
    objc_msgSend(v522, "allKeys");
    v312 = (void *)objc_claimAutoreleasedReturnValue();
    v313 = objc_msgSend(v312, "countByEnumeratingWithState:objects:count:", &v527, v581, 16);
    if (v313)
    {
      v314 = *(_QWORD *)v528;
      do
      {
        for (mm = 0; mm != v313; ++mm)
        {
          if (*(_QWORD *)v528 != v314)
            objc_enumerationMutation(v312);
          v316 = *(_QWORD *)(*((_QWORD *)&v527 + 1) + 8 * mm);
          objc_msgSend(v522, "objectForKeyedSubscript:", v316);
          v317 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v317, "removeObjectForKey:", CFSTR("eventHappenedArray"));

          objc_msgSend(v522, "objectForKeyedSubscript:", v316);
          v318 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v318, "removeObjectForKey:", CFSTR("eventLongestArray"));

          objc_msgSend(v522, "objectForKeyedSubscript:", v316);
          v319 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v319, "removeObjectForKey:", CFSTR("eventTotalArray"));

          objc_msgSend(v522, "objectForKeyedSubscript:", v316);
          v320 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v320, "removeObjectForKey:", CFSTR("wifiStabilityArray"));

          objc_msgSend(v522, "objectForKeyedSubscript:", v316);
          v321 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v321, "removeObjectForKey:", CFSTR("eventTotalDaily"));

          objc_msgSend(v522, "objectForKeyedSubscript:", v316);
          v322 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v322, "removeObjectForKey:", CFSTR("eventLongestDaily"));

          objc_msgSend(v522, "objectForKeyedSubscript:", v316);
          v323 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v323, "removeObjectForKey:", CFSTR("wifiTotalDaily"));

          objc_msgSend(v522, "objectForKeyedSubscript:", v316);
          v324 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v324, "removeObjectForKey:", CFSTR("visitTotalDaily"));

        }
        v313 = objc_msgSend(v312, "countByEnumeratingWithState:objects:count:", &v527, v581, 16);
      }
      while (v313);
    }

    if (v483)
    {
      v525 = 0u;
      v526 = 0u;
      v523 = 0u;
      v524 = 0u;
      objc_msgSend(v522, "allKeys");
      v325 = (void *)objc_claimAutoreleasedReturnValue();
      v521 = objc_msgSend(v325, "countByEnumeratingWithState:objects:count:", &v523, v580, 16);
      if (v521)
      {
        v518 = *(_QWORD *)v524;
        do
        {
          for (nn = 0; nn != v521; ++nn)
          {
            if (*(_QWORD *)v524 != v518)
              objc_enumerationMutation(v325);
            v327 = *(_QWORD *)(*((_QWORD *)&v523 + 1) + 8 * nn);
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v328 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v328, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_charging"));
            v329 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
            v330 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v329, v330);
            v331 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v332 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v332, "setObject:forKeyedSubscript:", v331, CFSTR("percentage_of_days_with_charging_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v333 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v333, "objectForKeyedSubscript:", CFSTR("median_daily_total_charging_duration"));
            v334 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v335 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v334, v335);
            v336 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v337 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v337, "setObject:forKeyedSubscript:", v336, CFSTR("median_daily_total_charging_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v338 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v338, "objectForKeyedSubscript:", CFSTR("mean_daily_total_charging_duration"));
            v339 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v340 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v339, v340);
            v341 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v342 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v342, "setObject:forKeyedSubscript:", v341, CFSTR("mean_daily_total_charging_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v343 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v343, "objectForKeyedSubscript:", CFSTR("SD_daily_total_charging_duration"));
            v344 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v345 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v344, v345);
            v346 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v347 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v347, "setObject:forKeyedSubscript:", v346, CFSTR("SD_daily_total_charging_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v348 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v348, "objectForKeyedSubscript:", CFSTR("median_daily_longest_charging_duration"));
            v349 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v350 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v349, v350);
            v351 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v352 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v352, "setObject:forKeyedSubscript:", v351, CFSTR("median_daily_longest_charging_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v353 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v353, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_charging_duration"));
            v354 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v355 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v354, v355);
            v356 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v357 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v357, "setObject:forKeyedSubscript:", v356, CFSTR("mean_daily_longest_charging_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v358 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v358, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_charging_duration"));
            v359 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v360 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v359, v360);
            v361 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v362 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v362, "setObject:forKeyedSubscript:", v361, CFSTR("SD_daily_longest_charging_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v363 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v363, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_staticMotion"));
            v364 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
            v365 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v364, v365);
            v366 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v367 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v367, "setObject:forKeyedSubscript:", v366, CFSTR("percentage_of_days_with_staticMotion_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v368 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v368, "objectForKeyedSubscript:", CFSTR("median_daily_total_static_motion_duration"));
            v369 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v370 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v369, v370);
            v371 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v372 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v372, "setObject:forKeyedSubscript:", v371, CFSTR("median_daily_total_static_motion_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v373 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v373, "objectForKeyedSubscript:", CFSTR("mean_daily_total_static_motion_duration"));
            v374 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v375 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v374, v375);
            v376 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v377 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v377, "setObject:forKeyedSubscript:", v376, CFSTR("mean_daily_total_static_motion_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v378 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v378, "objectForKeyedSubscript:", CFSTR("SD_daily_total_static_motion_duration"));
            v379 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v380 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v379, v380);
            v381 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v382 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v382, "setObject:forKeyedSubscript:", v381, CFSTR("SD_daily_total_static_motion_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v383 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v383, "objectForKeyedSubscript:", CFSTR("median_daily_longest_static_motion_duration"));
            v384 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v385 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v384, v385);
            v386 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v387 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v387, "setObject:forKeyedSubscript:", v386, CFSTR("median_daily_longest_static_motion_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v388 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v388, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_static_motion_duration"));
            v389 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v390 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v389, v390);
            v391 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v392 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v392, "setObject:forKeyedSubscript:", v391, CFSTR("mean_daily_longest_static_motion_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v393 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v393, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_static_motion_duration"));
            v394 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v395 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v394, v395);
            v396 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v397 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v397, "setObject:forKeyedSubscript:", v396, CFSTR("SD_daily_longest_static_motion_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v398 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v398, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_screenLock"));
            v399 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
            v400 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v399, v400);
            v401 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v402 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v402, "setObject:forKeyedSubscript:", v401, CFSTR("percentage_of_days_with_screenLock_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v403 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v403, "objectForKeyedSubscript:", CFSTR("median_daily_total_screen_lock_duration"));
            v404 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v405 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v404, v405);
            v406 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v407 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v407, "setObject:forKeyedSubscript:", v406, CFSTR("median_daily_total_screen_lock_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v408 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v408, "objectForKeyedSubscript:", CFSTR("mean_daily_total_screen_lock_duration"));
            v409 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v410 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v409, v410);
            v411 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v412 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v412, "setObject:forKeyedSubscript:", v411, CFSTR("mean_daily_total_screen_lock_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v413 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v413, "objectForKeyedSubscript:", CFSTR("SD_daily_total_screen_lock_duration"));
            v414 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v415 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v414, v415);
            v416 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v417 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v417, "setObject:forKeyedSubscript:", v416, CFSTR("SD_daily_total_screen_lock_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v418 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v418, "objectForKeyedSubscript:", CFSTR("median_daily_longest_screen_lock_duration"));
            v419 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v420 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v419, v420);
            v421 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v422 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v422, "setObject:forKeyedSubscript:", v421, CFSTR("median_daily_longest_screen_lock_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v423 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v423, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_screen_lock_duration"));
            v424 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v425 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v424, v425);
            v426 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v427 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v427, "setObject:forKeyedSubscript:", v426, CFSTR("mean_daily_longest_screen_lock_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v428 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v428, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_screen_lock_duration"));
            v429 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v430 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v429, v430);
            v431 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v432 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v432, "setObject:forKeyedSubscript:", v431, CFSTR("SD_daily_longest_screen_lock_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v433 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v433, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection"));
            v434 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
            v435 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v434, v435);
            v436 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v437 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v437, "setObject:forKeyedSubscript:", v436, CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v438 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v438, "objectForKeyedSubscript:", CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration"));
            v439 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v440 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v439, v440);
            v441 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v442 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v442, "setObject:forKeyedSubscript:", v441, CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v443 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v443, "objectForKeyedSubscript:", CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration"));
            v444 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v445 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v444, v445);
            v446 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v447 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v447, "setObject:forKeyedSubscript:", v446, CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v448 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v448, "objectForKeyedSubscript:", CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration"));
            v449 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v450 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v449, v450);
            v451 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v452 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v452, "setObject:forKeyedSubscript:", v451, CFSTR("SD_daily_total_uninterrupted_WiFi_connection_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v453 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v453, "objectForKeyedSubscript:", CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration"));
            v454 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v455 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v454, v455);
            v456 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v457 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v457, "setObject:forKeyedSubscript:", v456, CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v458 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v458, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration"));
            v459 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v460 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v459, v460);
            v461 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v462 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v462, "setObject:forKeyedSubscript:", v461, CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v463 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v463, "objectForKeyedSubscript:", CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration"));
            v464 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayDuetEventDuration](RTPlaceDataMetrics, "binArrayDuetEventDuration");
            v465 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v464, v465);
            v466 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v467 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v467, "setObject:forKeyedSubscript:", v466, CFSTR("SD_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"));

            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v468 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v468, "objectForKeyedSubscript:", CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio"));
            v469 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTPlaceDataMetrics binArrayPercentage](RTPlaceDataMetrics, "binArrayPercentage");
            v470 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v469, v470);
            v471 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v522, "objectForKeyedSubscript:", v327);
            v472 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v472, "setObject:forKeyedSubscript:", v471, CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed"));

          }
          v521 = objc_msgSend(v325, "countByEnumeratingWithState:objects:count:", &v523, v580, 16);
        }
        while (v521);
      }

    }
  }

  return v522;
}

BOOL __119__RTPlaceDataMetrics_calculateMLFeaturesUsingBiomeManager_intervalDictionary_startDate_endDate_createBucketedFeatures___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 32)) != -1;

  return v4;
}

uint64_t __119__RTPlaceDataMetrics_calculateMLFeaturesUsingBiomeManager_intervalDictionary_startDate_endDate_createBucketedFeatures___block_invoke_1146(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObjectsFromArray:", a2);
}

- (double)distanceThreshold
{
  return self->_distanceThreshold;
}

- (void)setDistanceThreshold:(double)a3
{
  self->_distanceThreshold = a3;
}

- (NSArray)visitArray
{
  return self->_visitArray;
}

- (void)setVisitArray:(id)a3
{
  objc_storeStrong((id *)&self->_visitArray, a3);
}

- (RTLocation)locationHome
{
  return self->_locationHome;
}

- (void)setLocationHome:(id)a3
{
  objc_storeStrong((id *)&self->_locationHome, a3);
}

- (RTLocation)locationWork
{
  return self->_locationWork;
}

- (void)setLocationWork:(id)a3
{
  objc_storeStrong((id *)&self->_locationWork, a3);
}

- (NSArray)locationsOfOthers
{
  return self->_locationsOfOthers;
}

- (void)setLocationsOfOthers:(id)a3
{
  objc_storeStrong((id *)&self->_locationsOfOthers, a3);
}

- (NSDate)startDateTime
{
  return self->_startDateTime;
}

- (void)setStartDateTime:(id)a3
{
  objc_storeStrong((id *)&self->_startDateTime, a3);
}

- (NSDate)endDateTime
{
  return self->_endDateTime;
}

- (void)setEndDateTime:(id)a3
{
  objc_storeStrong((id *)&self->_endDateTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDateTime, 0);
  objc_storeStrong((id *)&self->_startDateTime, 0);
  objc_storeStrong((id *)&self->_locationsOfOthers, 0);
  objc_storeStrong((id *)&self->_locationWork, 0);
  objc_storeStrong((id *)&self->_locationHome, 0);
  objc_storeStrong((id *)&self->_visitArray, 0);
}

@end
