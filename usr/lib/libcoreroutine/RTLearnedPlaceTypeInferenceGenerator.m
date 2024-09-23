@implementation RTLearnedPlaceTypeInferenceGenerator

- (RTLearnedPlaceTypeInferenceGenerator)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithBiomeManager_defaultsManager_distanceCalculator_learnedLocationStore_placeTypeClassifierMetricsCalculator_platform_);
}

- (RTLearnedPlaceTypeInferenceGenerator)initWithBiomeManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 learnedLocationStore:(id)a6 placeTypeClassifierMetricsCalculator:(id)a7 platform:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  RTLearnedPlaceTypeInferenceGenerator *v19;
  RTLearnedPlaceTypeInferenceGenerator *v20;
  uint64_t v21;
  NSMutableArray *placeStats;
  uint64_t v23;
  NSDictionary *placeStatsUUIDStringsToMLFeaturesMap;
  RTLearnedPlaceTypeInferenceGenerator *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v33 = a6;
  v34 = a7;
  v18 = a8;
  if (!v15)
  {
    v27 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: biomeManager";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, v29, buf, 2u);
    goto LABEL_18;
  }
  if (!v16)
  {
    v27 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_17;
  }
  if (!v17)
  {
    v27 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_17;
  }
  if (!v34)
  {
    v27 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v29 = "Invalid parameter not satisfying: placeTypeClassifierMetricsCalculator";
      goto LABEL_17;
    }
LABEL_18:

    v25 = 0;
    v26 = v33;
    goto LABEL_19;
  }
  v32 = v18;
  if (v18)
  {
    v35.receiver = self;
    v35.super_class = (Class)RTLearnedPlaceTypeInferenceGenerator;
    v19 = -[RTLearnedPlaceTypeInferenceGenerator init](&v35, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_biomeManager, a3);
      objc_storeStrong((id *)&v20->_defaultsManager, a4);
      objc_storeStrong((id *)&v20->_distanceCalculator, a5);
      objc_storeStrong((id *)&v20->_learnedLocationStore, a6);
      objc_storeStrong((id *)&v20->_placeTypeClassifierMetricsCalculator, a7);
      objc_storeStrong((id *)&v20->_platform, a8);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v21 = objc_claimAutoreleasedReturnValue();
      placeStats = v20->_placeStats;
      v20->_placeStats = (NSMutableArray *)v21;

      v23 = objc_opt_new();
      placeStatsUUIDStringsToMLFeaturesMap = v20->_placeStatsUUIDStringsToMLFeaturesMap;
      v20->_placeStatsUUIDStringsToMLFeaturesMap = (NSDictionary *)v23;

    }
    self = v20;
    v25 = self;
    v26 = v33;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    v26 = v33;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: platform", buf, 2u);
    }

    v25 = 0;
  }
  v27 = v32;
LABEL_19:

  return v25;
}

+ (id)placeTypeClassificationSourceToString:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E92A53E8[a3 - 1];
}

+ (id)modelTypeToString:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 2)
    v3 = CFSTR("Ranker");
  if (a3 == 1)
    return CFSTR("MultiClass");
  else
    return (id)v3;
}

+ (id)placeTypeClassifierModelThresholdForPlatform:(id)a3 placeType:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = v5;
  if (a4 == 1)
  {
    v7 = &unk_1E932D590;
    goto LABEL_11;
  }
  if (a4 != 2)
  {
LABEL_10:
    v7 = &unk_1E932D5D0;
    goto LABEL_11;
  }
  if (!objc_msgSend(v5, "iPhonePlatform"))
  {
    if ((objc_msgSend(v6, "watchPlatform") & 1) != 0)
    {
      v7 = &unk_1E932D5C0;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (objc_msgSend(v6, "iPhoneDevice"))
    v7 = &unk_1E932D5A0;
  else
    v7 = &unk_1E932D5B0;
LABEL_11:

  return v7;
}

+ (id)placeTypeClassifierModelTargetClass:(unint64_t)a3
{
  void *v3;

  v3 = &unk_1E9329540;
  if (a3 == 2)
    v3 = &unk_1E9329528;
  if (a3 == 1)
    return &unk_1E9329510;
  else
    return v3;
}

- (void)submitVisits:(id)a3 place:(id)a4
{
  id v6;
  void *v7;
  RTLearnedPlaceTypeInferencePlaceStats *v8;
  void *v9;
  RTLearnedPlaceTypeInferencePlaceStats *v10;
  RTLearnedPlace *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  RTLearnedPlace *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  RTLearnedPlaceTypeInferencePlaceStats *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  RTLearnedPlaceTypeInferenceGenerator *v46;
  id v47;
  id v48;

  v48 = a3;
  v6 = a4;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v48, "count"))
  {
    v8 = [RTLearnedPlaceTypeInferencePlaceStats alloc];
    -[RTLearnedPlaceTypeInferenceGenerator learnedLocationStore](self, "learnedLocationStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v6;
    v10 = -[RTLearnedPlaceTypeInferencePlaceStats initWithLearnedLocationStore:place:visits:](v8, "initWithLearnedLocationStore:place:visits:", v9, v6, v48);

    v11 = [RTLearnedPlace alloc];
    -[RTLearnedPlaceTypeInferencePlaceStats place](v10, "place");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "identifier");
    v12 = objc_claimAutoreleasedReturnValue();
    -[RTLearnedPlaceTypeInferencePlaceStats place](v10, "place");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "mapItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedPlaceTypeInferencePlaceStats place](v10, "place");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "customLabel");
    v46 = self;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedPlaceTypeInferencePlaceStats place](v10, "place");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "creationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedPlaceTypeInferencePlaceStats place](v10, "place");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "expirationDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v11;
    v21 = (void *)v12;
    v22 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v20, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v12, 1, 1, v13, v15, v17, v19);

    v45 = (void *)v22;
    if (v22)
    {
      -[RTLearnedPlaceTypeInferenceGenerator placeStats](v46, "placeStats");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v10;
      objc_msgSend(v23, "addObject:", v10);

      objc_msgSend(v48, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "entryDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedPlaceTypeInferenceGenerator firstVisit](v46, "firstVisit");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "entryDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "earlierDate:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "entryDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v29, "isEqualToDate:", v31);

      if (v32)
      {
        objc_msgSend(v48, "firstObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLearnedPlaceTypeInferenceGenerator setFirstVisit:](v46, "setFirstVisit:", v33);

      }
      objc_msgSend(v48, "lastObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "exitDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedPlaceTypeInferenceGenerator lastVisit](v46, "lastVisit");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "exitDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "laterDate:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "lastObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "exitDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v38, "isEqualToDate:", v40);

      v10 = v24;
      if (v41)
      {
        objc_msgSend(v48, "lastObject");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLearnedPlaceTypeInferenceGenerator setLastVisit:](v46, "setLastVisit:", v42);

      }
    }

    v6 = v47;
  }

}

- (id)inferPlaceTypesFromDailyPatternsWithPlaceStats:(id)a3 dateInterval:(id)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  NSObject *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  RTLearnedPlaceTypeInferenceGenerator *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  RTLearnedPlace *v35;
  double v36;
  RTLearnedPlace *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  void *v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  RTLearnedPlace *v66;
  void *v67;
  void *v68;
  RTLearnedPlace *v69;
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
  char *aSelectora;
  char *aSelectorb;
  void *v84;
  void *v85;
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  uint64_t v99;
  _QWORD v100[2];
  _QWORD v101[4];

  v101[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("stats"), CFSTR("weeklyDaysWithNonZeroDwellTimeAverage"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("stats"), CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("stats"), CFSTR("weeklyTotalDailyVisitCountAverage"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %@"), v8, &unk_1E932D5E0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v101[0] = v11;
  v84 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), v9, &unk_1E932D5F0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v101[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v13);
  v14 = objc_claimAutoreleasedReturnValue();

  v85 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v7, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v100[0] = v15;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v8, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v100[1] = v16;
  v17 = (void *)v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTLearnedPlaceTypeInferenceGenerator filteredPlaceStatsByWeeklyVisitThreshold:placeStats:](self, "filteredPlaceStatsByWeeklyVisitThreshold:placeStats:", v6, 0.6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "filteredArrayUsingPredicate:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sortedArrayUsingDescriptors:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "count"))
  {
    objc_msgSend(v21, "objectAtIndex:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  if ((unint64_t)objc_msgSend(v21, "count") < 2)
  {
    v23 = 0;
  }
  else
  {
    objc_msgSend(v21, "objectAtIndex:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v79 = (void *)v14;
    v27 = v21;
    v28 = v8;
    v29 = v24;
    v30 = self;
    v31 = v18;
    v32 = v23;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413826;
    v87 = v33;
    v88 = 2112;
    v89 = v34;
    v90 = 2112;
    v91 = v22;
    v92 = 2048;
    v93 = 0x4014000000000000;
    v94 = 2048;
    v95 = 0x401C000000000000;
    v96 = 2048;
    v97 = 0x40D5180000000000;
    v98 = 2048;
    v99 = 0x4014000000000000;
    _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@, %@, theoreticalHome places stats, %@, required minDaysNonZeroDwellTime, %.2f, maxDaysNonZeroDwellTime, %.2f, minWeeklyAggregateDwellTimeBetweenDateRangeAverage, %.2f, totalWeeklyVisitCount, %.2f", buf, 0x48u);

    v23 = v32;
    v18 = v31;
    self = v30;
    v24 = v29;
    v8 = v28;
    v21 = v27;
    v17 = v79;
  }

  objc_msgSend(v22, "stats");
  v35 = (RTLearnedPlace *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlace weeklyDaysWithNonZeroDwellTimeAverage](v35, "weeklyDaysWithNonZeroDwellTimeAverage");
  if (v36 < 5.0)
    goto LABEL_22;
  objc_msgSend(v22, "stats");
  v37 = (RTLearnedPlace *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlace weeklyDaysWithNonZeroDwellTimeAverage](v37, "weeklyDaysWithNonZeroDwellTimeAverage");
  if (v38 > 7.0)
    goto LABEL_21;
  v78 = v23;
  objc_msgSend(v22, "stats");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "weeklyAggregateDwellTimeBetweenDateRangeAverage");
  if (v40 <= 21600.0)
  {

    goto LABEL_20;
  }
  objc_msgSend(v22, "stats");
  v80 = v17;
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "weeklyTotalDailyVisitCountAverage");
  v43 = v42;

  v17 = v80;
  v23 = v78;
  if (v43 >= 5.0)
  {
    v66 = [RTLearnedPlace alloc];
    objc_msgSend(v22, "place");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "identifier");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "place");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "mapItem");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "place");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "customLabel");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "place");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "creationDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "place");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "expirationDate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v66, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v76, 1, 1, v74, v62, v44, v46);

    if (!v35)
    {
LABEL_26:
      v23 = v78;
      v17 = v80;
      goto LABEL_22;
    }
    objc_msgSend(v24, "addObject:", v35);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413826;
      v87 = v49;
      v88 = 2112;
      v89 = v50;
      v90 = 2112;
      v91 = v78;
      v92 = 2048;
      v93 = 0x400C000000000000;
      v94 = 2048;
      v95 = 0x4018000000000000;
      v96 = 2048;
      v97 = 0x40CFA40000000000;
      v98 = 2048;
      v99 = 0x4010000000000000;
      _os_log_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_INFO, "%@, %@, theoreticalWork places stats, %@, required minDaysNonZeroDwellTime, %.2f, maxDaysNonZeroDwellTime, %.2f, minWeeklyAggregateDwellTimeBetweenDateRangeAverage, %.2f, totalWeeklyVisitCount, %.2f", buf, 0x48u);

    }
    v23 = v78;
    objc_msgSend(v78, "stats");
    v37 = (RTLearnedPlace *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedPlace weeklyDaysWithNonZeroDwellTimeAverage](v37, "weeklyDaysWithNonZeroDwellTimeAverage");
    v17 = v80;
    if (v51 < 3.5)
      goto LABEL_21;
    objc_msgSend(v78, "stats");
    aSelectora = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(aSelectora, "weeklyDaysWithNonZeroDwellTimeAverage");
    if (v52 > 6.0)
    {

LABEL_21:
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v78, "stats");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "weeklyAggregateDwellTimeBetweenDateRangeAverage");
    if (v56 <= 16200.0)
    {

    }
    else
    {
      objc_msgSend(v78, "stats");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "weeklyTotalDailyVisitCountAverage");
      v59 = v58;

      if (v59 < 4.0)
        goto LABEL_26;
      v69 = [RTLearnedPlace alloc];
      objc_msgSend(v78, "place");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "identifier");
      aSelectorb = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "place");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "mapItem");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "place");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "customLabel");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "place");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "creationDate");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "place");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "expirationDate");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v69, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", aSelectorb, 2, 1, v77, v61, v63, v60);

      if (v37)
        objc_msgSend(v24, "addObject:", v37);
      v17 = v80;
    }
LABEL_20:
    v23 = v78;
    goto LABEL_21;
  }
LABEL_23:
  -[RTLearnedPlaceTypeInferenceGenerator placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "storeMetricsData:source:", v24, 12);

  return v24;
}

- (id)inferPlaceTypesFromTopMedianDwellTimeWithPlaceStats:(id)a3 dateInterval:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  RTLearnedPlace *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  RTLearnedPlace *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  objc_msgSend(v6, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlaceTypeInferenceGenerator filteredPlaceStatsByWeeklyVisitThreshold:placeStats:](self, "filteredPlaceStatsByWeeklyVisitThreshold:placeStats:", v7, 0.6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("stats.topMedianDwellTime"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingDescriptors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v40 = v16;
    v41 = 2112;
    v42 = v17;
    v43 = 2112;
    v44 = v13;
    v45 = 2048;
    v46 = 0x4014000000000000;
    v47 = 2048;
    v48 = 0x4014000000000000;
    v49 = 2048;
    v50 = 0x40E5180000000000;
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, %@, theoreticalHome places stats, %@, required minDaysNonZeroDwellTime, %.2f, totalWeeklyVisitCount, %.2f, minTopMedianDwellTime, %.2f", buf, 0x3Eu);

  }
  objc_msgSend(v13, "stats");
  v18 = (RTLearnedPlace *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlace weeklyDaysWithNonZeroDwellTimeAverage](v18, "weeklyDaysWithNonZeroDwellTimeAverage");
  if (v19 < 5.0)
    goto LABEL_9;
  objc_msgSend(v13, "stats");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "weeklyTotalDailyVisitCountAverage");
  if (v21 < 5.0)
  {

LABEL_9:
    goto LABEL_10;
  }
  objc_msgSend(v13, "stats");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topMedianDwellTime");
  v24 = v23;

  if (v24 > 43200.0)
  {
    v34 = [RTLearnedPlace alloc];
    objc_msgSend(v13, "place");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "place");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "mapItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "place");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "customLabel");
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "place");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "creationDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "place");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "expirationDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)v25;
    v18 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v34, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v38, 1, 1, v33, v25, v27, v29);

    if (v18)
      objc_msgSend(v8, "addObject:", v18);
    goto LABEL_9;
  }
LABEL_10:
  -[RTLearnedPlaceTypeInferenceGenerator placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "storeMetricsData:source:", v8, 13);

  return v8;
}

- (BOOL)supportsModel
{
  void *v3;
  char v4;
  void *v5;

  -[RTLearnedPlaceTypeInferenceGenerator platform](self, "platform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "iPhonePlatform") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[RTLearnedPlaceTypeInferenceGenerator platform](self, "platform");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "watchPlatform");

  }
  return v4;
}

+ (id)sortPlaceStats:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;
  void *v16;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("stats"), CFSTR("topMedianDwellTime"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("stats"), CFSTR("weeklyDaysWithNonZeroDwellTimeAverage"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("stats"), CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("stats"), CFSTR("weeklyTotalDailyVisitCountAverage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("place"), CFSTR("creationDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v16, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v15, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v8;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v9;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v10;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[4] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "sortedArrayUsingDescriptors:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v3;
  }

  return v13;
}

- (id)_inferPlaceTypesFromRankerModelForPlaceType:(unint64_t)a3 placeStats:(id)a4 metricsData:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  objc_class *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  RTPlaceTypeClassifierModelRanker *v32;
  id *v33;
  RTLearnedPlace *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  objc_class *v42;
  id v43;
  id v44;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  NSObject *v50;
  NSObject *v52;
  objc_class *v53;
  id v54;
  void *v55;
  NSObject *v56;
  objc_class *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *context;
  void *v66;
  void *v67;
  RTPlaceTypeClassifierModelRanker *v68;
  _QWORD v69[5];
  RTPlaceTypeClassifierModelRanker *v70;
  id v71;
  uint64_t *v72;
  _QWORD *v73;
  _BYTE *v74;
  SEL v75;
  uint64_t v76;
  id obj;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  _QWORD v84[5];
  id v85;
  uint8_t v86[4];
  id v87;
  __int16 v88;
  id v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  NSObject *v93;
  _BYTE buf[24];
  uint64_t (*v95)(uint64_t, uint64_t);
  __int128 v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (!-[RTLearnedPlaceTypeInferenceGenerator supportsModel](self, "supportsModel"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v21;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, %@, feature not supported", buf, 0x16u);

    }
    goto LABEL_23;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v24;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, %@, feature not enabled", buf, 0x16u);

    }
    goto LABEL_23;
  }
  -[RTLearnedPlaceTypeInferenceGenerator defaultsManager](self, "defaultsManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("RTDefaultsLearnedPlaceTypeInferenceGeneratorDisableModel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v15)
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, %@, Model disabled by defaults", buf, 0x16u);

    }
LABEL_23:
    v50 = 0;
    goto LABEL_24;
  }
  if (v15)
  {
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v9, "count");
    +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", a3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v26;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v27;
    *(_WORD *)&buf[22] = 2048;
    v95 = (uint64_t (*)(uint64_t, uint64_t))v28;
    LOWORD(v96) = 2112;
    *(_QWORD *)((char *)&v96 + 2) = v29;
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, %@, placeStats count, %lu, placeType, %@", buf, 0x2Au);

  }
  if (a3 != 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", a3);
      v49 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v47;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v48;
      *(_WORD *)&buf[22] = 2112;
      v95 = v49;
      _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "%@, %@, invalid placeType, %@", buf, 0x20u);

    }
    goto LABEL_23;
  }
  if (!objc_msgSend(v9, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v57 = (objc_class *)objc_opt_class();
      NSStringFromClass(v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v58;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v59;
      *(_WORD *)&buf[22] = 2112;
      v95 = (uint64_t (*)(uint64_t, uint64_t))v9;
      _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "%@, %@, invalid placeStats, %@", buf, 0x20u);

    }
    goto LABEL_23;
  }
  v30 = -[RTLearnedPlaceTypeInferenceGenerator _prepareMLFeaturesWithPlaceStats:](self, "_prepareMLFeaturesWithPlaceStats:", v9);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v95 = __Block_byref_object_copy__160;
  *(_QWORD *)&v96 = __Block_byref_object_dispose__160;
  *((_QWORD *)&v96 + 1) = 0;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x3032000000;
  v84[3] = __Block_byref_object_copy__160;
  v84[4] = __Block_byref_object_dispose__160;
  v85 = &unk_1E9329558;
  v78 = 0;
  v79 = &v78;
  v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__160;
  v82 = __Block_byref_object_dispose__160;
  v83 = 0;
  context = (void *)MEMORY[0x1D8231EA8](v30);
  objc_msgSend(MEMORY[0x1E0CB3620], "frameworkBundle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "pathForResource:ofType:", CFSTR("RTPlaceTypeClassifierModelRanker"), CFSTR("mlmodelc"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v67);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = [RTPlaceTypeClassifierModelRanker alloc];
  v33 = (id *)(v79 + 5);
  obj = (id)v79[5];
  v68 = -[RTPlaceTypeClassifierModelRanker initWithContentsOfURL:error:](v32, "initWithContentsOfURL:error:", v66, &obj);
  objc_storeStrong(v33, obj);
  if (v68)
  {
    objc_msgSend((id)objc_opt_class(), "sortPlaceStats:", v9);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E9329510, &unk_1E9329570);
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __107__RTLearnedPlaceTypeInferenceGenerator__inferPlaceTypesFromRankerModelForPlaceType_placeStats_metricsData___block_invoke;
    v69[3] = &unk_1E92A5268;
    v69[4] = self;
    v75 = a2;
    v76 = 1;
    v70 = v68;
    v72 = &v78;
    v73 = v84;
    v74 = buf;
    v71 = v10;
    objc_msgSend(v64, "enumerateObjectsUsingBlock:", v69);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v34 = [RTLearnedPlace alloc];
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "place");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "identifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "place");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "mapItem");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "place");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "customLabel");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "place");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "creationDate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "place");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "expirationDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v34, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v60, 1, 1, v61, v36, v38, v40);

      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v43 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v44 = (id)objc_claimAutoreleasedReturnValue();
        +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v86 = 138413058;
        v87 = v43;
        v88 = 2112;
        v89 = v44;
        v90 = 2112;
        v91 = v45;
        v92 = 2112;
        v93 = v14;
        _os_log_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_INFO, "%@, %@, placeType, %@, inferred place, %@", v86, 0x2Au);

      }
    }
    else
    {
      v14 = 0;
    }

    v9 = v64;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v54 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v79[5];
      *(_DWORD *)v86 = 138413058;
      v87 = v54;
      v88 = 2112;
      v89 = v55;
      v90 = 2112;
      v91 = v67;
      v92 = 2112;
      v93 = v56;
      _os_log_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_INFO, "%@, %@, failed to load model, %@, error, %@", v86, 0x2Au);

    }
    v14 = 0;
  }

  objc_autoreleasePoolPop(context);
  if (v68)
    v50 = v14;
  else
    v50 = 0;
  _Block_object_dispose(&v78, 8);

  _Block_object_dispose(v84, 8);
  _Block_object_dispose(buf, 8);

LABEL_24:
  return v50;
}

void __107__RTLearnedPlaceTypeInferenceGenerator__inferPlaceTypesFromRankerModelForPlaceType_placeStats_metricsData___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  char v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  NSObject *v59;
  objc_class *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  objc_class *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id obj;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  double v106;
  void *v107;
  double v108;
  void *v109;
  double v110;
  void *v111;
  void *v112;
  double v113;
  void *v114;
  double v115;
  void *v116;
  double v117;
  void *v118;
  void *v119;
  double v120;
  void *v121;
  double v122;
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
  RTPlaceTypeClassifierModelRankerInput *v137;
  RTPlaceTypeClassifierModelRankerInput *v138;
  uint64_t v139;
  id v140;
  uint8_t buf[4];
  void *v142;
  __int16 v143;
  void *v144;
  __int16 v145;
  void *v146;
  __int16 v147;
  id v148;
  __int16 v149;
  void *v150;
  __int16 v151;
  uint64_t v152;
  __int16 v153;
  uint64_t v154;
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "mlFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    obj = a2;
    v137 = [RTPlaceTypeClassifierModelRankerInput alloc];
    objc_msgSend(v4, "mlFeatures");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_charging_duration_bucketed"));
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "doubleValue");
    v122 = v6;
    objc_msgSend(v4, "mlFeatures");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_screen_lock_duration_bucketed"));
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "doubleValue");
    v120 = v7;
    objc_msgSend(v4, "mlFeatures");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"));
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "doubleValue");
    v117 = v8;
    objc_msgSend(v4, "mlFeatures");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("mean_daily_total_charging_duration_bucketed"));
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "doubleValue");
    v115 = v9;
    objc_msgSend(v4, "mlFeatures");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("mean_daily_total_screen_lock_duration_bucketed"));
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "doubleValue");
    v113 = v10;
    objc_msgSend(v4, "mlFeatures");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed"));
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "doubleValue");
    v110 = v11;
    objc_msgSend(v4, "mlFeatures");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "doubleValue");
    v108 = v12;
    objc_msgSend(v4, "mlFeatures");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "objectForKeyedSubscript:", CFSTR("median_daily_longest_charging_duration_bucketed"));
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "doubleValue");
    v106 = v13;
    objc_msgSend(v4, "mlFeatures");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "objectForKeyedSubscript:", CFSTR("median_daily_longest_screen_lock_duration_bucketed"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "doubleValue");
    v102 = v14;
    objc_msgSend(v4, "mlFeatures");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "doubleValue");
    v100 = v15;
    objc_msgSend(v4, "mlFeatures");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "objectForKeyedSubscript:", CFSTR("median_daily_total_charging_duration_bucketed"));
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "doubleValue");
    v17 = v16;
    objc_msgSend(v4, "mlFeatures");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("median_daily_total_screen_lock_duration_bucketed"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "doubleValue");
    v19 = v18;
    objc_msgSend(v4, "mlFeatures");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration_bucketed"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "doubleValue");
    v21 = v20;
    objc_msgSend(v4, "mlFeatures");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_charging_bucketed"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "doubleValue");
    v23 = v22;
    objc_msgSend(v4, "mlFeatures");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_screenLock_bucketed"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "doubleValue");
    v25 = v24;
    objc_msgSend(v4, "mlFeatures");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection_bucketed"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    v29 = v28;
    v30 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "platform");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "numberWithBool:", objc_msgSend(v31, "iPhoneDevice"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValue");
    v34 = v33;
    v35 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "platform");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "iPhoneDevice");
    if ((v37 & 1) != 0)
    {
      v38 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "platform");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v95, "iPhonePlatform");
    }
    objc_msgSend(v35, "numberWithBool:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "doubleValue");
    v41 = v40;
    v42 = (void *)MEMORY[0x1E0CB37E8];
    v139 = a1;
    objc_msgSend(*(id *)(a1 + 32), "platform");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "numberWithBool:", objc_msgSend(v43, "watchPlatform"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "doubleValue");
    v138 = -[RTPlaceTypeClassifierModelRankerInput initWithMean_daily_longest_charging_duration_bucketed:mean_daily_longest_screen_lock_duration_bucketed:mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_total_charging_duration_bucketed:mean_daily_total_screen_lock_duration_bucketed:mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed:median_daily_longest_charging_duration_bucketed:median_daily_longest_screen_lock_duration_bucketed:median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:median_daily_total_charging_duration_bucketed:median_daily_total_screen_lock_duration_bucketed:median_daily_total_uninterrupted_WiFi_connection_duration_bucketed:percentage_of_days_with_charging_bucketed:percentage_of_days_with_screen_lock_bucketed:percentage_of_days_with_uninterrupted_WiFi_connection_bucketed:is_iPhone:is_iPad:is_Watch:](v137, "initWithMean_daily_longest_charging_duration_bucketed:mean_daily_longest_screen_lock_duration_bucketed:mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_total_charging_duration_bucketed:mean_daily_total_screen_lock_duration_bucketed:mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed:median_daily_longest_charging_duration_bucketed:median_daily_longest_screen_lock_duration_bucketed:median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:median_daily_total_charging_duration_bucketed:median_daily_total_screen_lock_duration_bucketed:median_daily_total_uninterrupted_WiFi_connection_duration_bucketed:percentage_of_days_with_charging_bucketed:percentage_of_days_with_screen_lock_bucketed:percentage_of_days_with_uninterrupted_WiFi_connection_bucketed:is_iPhone:is_iPad:is_Watch:", v122, v120, v117, v115, v113, v110, v108, v106, v102,
             v100,
             v17,
             v19,
             v21,
             v23,
             v25,
             v29,
             v34,
             v41,
             v45);

    if ((v37 & 1) == 0)
    -[RTPlaceTypeClassifierModelRankerInput mean_daily_longest_screen_lock_duration_bucketed](v138, "mean_daily_longest_screen_lock_duration_bucketed");
    if (v46 <= 1.0)
      goto LABEL_22;
    -[RTPlaceTypeClassifierModelRankerInput mean_daily_total_screen_lock_duration_bucketed](v138, "mean_daily_total_screen_lock_duration_bucketed");
    if (v47 <= 1.0)
      goto LABEL_22;
    -[RTPlaceTypeClassifierModelRankerInput median_daily_longest_screen_lock_duration_bucketed](v138, "median_daily_longest_screen_lock_duration_bucketed");
    if (v48 <= 1.0
      || (-[RTPlaceTypeClassifierModelRankerInput median_daily_total_screen_lock_duration_bucketed](v138, "median_daily_total_screen_lock_duration_bucketed"), v49 <= 1.0)|| (-[RTPlaceTypeClassifierModelRankerInput percentage_of_days_with_screen_lock_bucketed](v138, "percentage_of_days_with_screen_lock_bucketed"), v50 <= 1.0)|| (-[RTPlaceTypeClassifierModelRankerInput mean_daily_longest_charging_duration_bucketed](v138, "mean_daily_longest_charging_duration_bucketed"), v51 <= 1.0)|| (-[RTPlaceTypeClassifierModelRankerInput mean_daily_total_charging_duration_bucketed](v138, "mean_daily_total_charging_duration_bucketed"), v52 <= 1.0)|| (-[RTPlaceTypeClassifierModelRankerInput median_daily_longest_charging_duration_bucketed](v138, "median_daily_longest_charging_duration_bucketed"), v53 <= 1.0)
      || (-[RTPlaceTypeClassifierModelRankerInput median_daily_total_charging_duration_bucketed](v138, "median_daily_total_charging_duration_bucketed"), v54 <= 1.0)|| (-[RTPlaceTypeClassifierModelRankerInput percentage_of_days_with_charging_bucketed](v138, "percentage_of_days_with_charging_bucketed"), v55 <= 1.0))
    {
LABEL_22:
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        v78 = (objc_class *)objc_opt_class();
        NSStringFromClass(v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(v139 + 80));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", *(_QWORD *)(v139 + 88));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTRuntime objToString:filterProperties:](RTRuntime, "objToString:filterProperties:", v138, &unk_1E932CBB0);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v142 = v79;
        v143 = 2112;
        v144 = v80;
        v145 = 2112;
        v146 = v81;
        v147 = 2112;
        v148 = v4;
        v149 = 2112;
        v150 = v82;
        _os_log_impl(&dword_1D1A22000, v58, OS_LOG_TYPE_INFO, "%@, %@, inferring for placeType, %@, placeStat, %@, mlFeatures, %@, \n\nSkipping place inference in Ranker model because all the longest duet stream bucketed values are <= 1. It means the stream doesn't exist or the values are less than 10 mins each.", buf, 0x34u);

      }
    }
    else
    {
      v56 = *(void **)(v139 + 40);
      v57 = *(_QWORD *)(*(_QWORD *)(v139 + 56) + 8);
      v140 = *(id *)(v57 + 40);
      objc_msgSend(v56, "predictionFromFeatures:error:", v138, &v140);
      v58 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v57 + 40), v140);
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        v60 = (objc_class *)objc_opt_class();
        NSStringFromClass(v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(v139 + 80));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", *(_QWORD *)(v139 + 88));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTRuntime objToString:filterProperties:](RTRuntime, "objToString:filterProperties:", v138, &unk_1E932CBC8);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject target](v58, "target");
        v65 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v139 + 56) + 8) + 40);
        *(_DWORD *)buf = 138413826;
        v142 = v61;
        v143 = 2112;
        v144 = v62;
        v145 = 2112;
        v146 = v63;
        v147 = 2112;
        v148 = v4;
        v149 = 2112;
        v150 = v64;
        v151 = 2048;
        v152 = v66;
        v153 = 2112;
        v154 = v65;
        _os_log_impl(&dword_1D1A22000, v59, OS_LOG_TYPE_INFO, "%@, %@, inferring for placeType, %@, placeStat, %@, mlFeatures, %@, \n\noutput target score, %lf, error, %@", buf, 0x48u);

      }
      -[NSObject target](v58, "target");
      v68 = v67;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v139 + 64) + 8) + 40), "doubleValue");
      if (v68 <= v69 || (-[NSObject target](v58, "target"), v70 <= 0.0))
      {
        objc_msgSend(*(id *)(v139 + 48), "objectForKeyedSubscript:", &unk_1E93295D0);
        v83 = objc_claimAutoreleasedReturnValue();
        if (!v83)
          goto LABEL_28;
        v84 = (void *)v83;
        objc_msgSend(*(id *)(v139 + 48), "objectForKeyedSubscript:", &unk_1E93295D0);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = (double)objc_msgSend(v85, "unsignedIntValue");
        -[NSObject target](v58, "target");
        v88 = v87;

        if (v88 > v86)
        {
LABEL_28:
          +[RTRuntime objToDictionary:filterProperties:](RTRuntime, "objToDictionary:filterProperties:", v138, &unk_1E932CBF8);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v139 + 48), "setObject:forKeyedSubscript:", v89, &unk_1E93295A0);

          v90 = (void *)MEMORY[0x1E0CB37E8];
          -[NSObject target](v58, "target");
          objc_msgSend(v90, "numberWithDouble:");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v139 + 48), "setObject:forKeyedSubscript:", v91, &unk_1E93295D0);

        }
      }
      else
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v139 + 72) + 8) + 40), obj);
        v71 = (void *)MEMORY[0x1E0CB37E8];
        -[NSObject target](v58, "target");
        objc_msgSend(v71, "numberWithDouble:");
        v72 = objc_claimAutoreleasedReturnValue();
        v73 = *(_QWORD *)(*(_QWORD *)(v139 + 64) + 8);
        v74 = *(void **)(v73 + 40);
        *(_QWORD *)(v73 + 40) = v72;

        objc_msgSend(*(id *)(v139 + 48), "objectForKeyedSubscript:", &unk_1E9329588);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v139 + 48), "setObject:forKeyedSubscript:", v75, &unk_1E93295A0);

        +[RTRuntime objToDictionary:filterProperties:](RTRuntime, "objToDictionary:filterProperties:", v138, &unk_1E932CBE0);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v139 + 48), "setObject:forKeyedSubscript:", v76, &unk_1E9329588);

        objc_msgSend(*(id *)(v139 + 48), "objectForKeyedSubscript:", &unk_1E93295B8);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v139 + 48), "setObject:forKeyedSubscript:", v77, &unk_1E93295D0);

        objc_msgSend(*(id *)(v139 + 48), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v139 + 64) + 8) + 40), &unk_1E93295B8);
      }
      v92 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(v139 + 48), "objectForKeyedSubscript:", &unk_1E9329570);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "numberWithUnsignedInt:", objc_msgSend(v93, "unsignedIntValue") + 1);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v139 + 48), "setObject:forKeyedSubscript:", v94, &unk_1E9329570);

    }
  }

}

- (id)_inferPlaceTypesFromMultiClassModelForPlaceType:(unint64_t)a3 placeStats:(id)a4 metricsData:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void *v34;
  RTPlaceTypeClassifierModelMultiClass *v35;
  id *v36;
  void *v37;
  void *v38;
  RTLearnedPlace *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  objc_class *v46;
  id v47;
  id v48;
  void *v49;
  NSObject *v50;
  NSObject *v52;
  objc_class *v53;
  id v54;
  void *v55;
  NSObject *v56;
  objc_class *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *context;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  RTPlaceTypeClassifierModelMultiClass *v71;
  _QWORD v72[5];
  RTPlaceTypeClassifierModelMultiClass *v73;
  id v74;
  id v75;
  id v76;
  uint64_t *v77;
  _QWORD *v78;
  _QWORD *v79;
  _BYTE *v80;
  SEL v81;
  unint64_t v82;
  id obj;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  _QWORD v90[5];
  id v91;
  _QWORD v92[5];
  id v93;
  uint8_t v94[4];
  id v95;
  __int16 v96;
  id v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  NSObject *v101;
  _BYTE buf[24];
  uint64_t (*v103)(uint64_t, uint64_t);
  __int128 v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (!-[RTLearnedPlaceTypeInferenceGenerator supportsModel](self, "supportsModel"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v20;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, %@, feature not supported", buf, 0x16u);

    }
    goto LABEL_23;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v23;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, %@, feature not enabled", buf, 0x16u);

    }
    goto LABEL_23;
  }
  -[RTLearnedPlaceTypeInferenceGenerator defaultsManager](self, "defaultsManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("RTDefaultsLearnedPlaceTypeInferenceGeneratorDisableModel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v17;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, %@, Model disabled by defaults", buf, 0x16u);

    }
LABEL_23:
    v50 = 0;
    goto LABEL_24;
  }
  -[RTLearnedPlaceTypeInferenceGenerator _prepareMLFeaturesWithPlaceStats:](self, "_prepareMLFeaturesWithPlaceStats:", v9);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v9, "count");
    +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", a3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v26;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v27;
    *(_WORD *)&buf[22] = 2048;
    v103 = (uint64_t (*)(uint64_t, uint64_t))v28;
    LOWORD(v104) = 2112;
    *(_QWORD *)((char *)&v104 + 2) = v29;
    _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%@, %@, placeStats count, %lu, placeType, %@", buf, 0x2Au);

  }
  if (a3 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", a3);
      v33 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v31;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v32;
      *(_WORD *)&buf[22] = 2112;
      v103 = v33;
      _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "%@, %@, invalid placeType, %@", buf, 0x20u);

    }
    goto LABEL_23;
  }
  if (!objc_msgSend(v9, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v57 = (objc_class *)objc_opt_class();
      NSStringFromClass(v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v58;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v59;
      *(_WORD *)&buf[22] = 2112;
      v103 = (uint64_t (*)(uint64_t, uint64_t))v9;
      _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "%@, %@, invalid placeStats, %@", buf, 0x20u);

    }
    goto LABEL_23;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v103 = __Block_byref_object_copy__160;
  *(_QWORD *)&v104 = __Block_byref_object_dispose__160;
  *((_QWORD *)&v104 + 1) = 0;
  v92[0] = 0;
  v92[1] = v92;
  v92[2] = 0x3032000000;
  v92[3] = __Block_byref_object_copy__160;
  v92[4] = __Block_byref_object_dispose__160;
  v93 = 0;
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x3032000000;
  v90[3] = __Block_byref_object_copy__160;
  v90[4] = __Block_byref_object_dispose__160;
  v91 = 0;
  v84 = 0;
  v85 = &v84;
  v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__160;
  v88 = __Block_byref_object_dispose__160;
  v89 = 0;
  context = (void *)MEMORY[0x1D8231EA8]();
  objc_msgSend(MEMORY[0x1E0CB3620], "frameworkBundle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "pathForResource:ofType:", CFSTR("RTPlaceTypeClassifierModelMultiClass"), CFSTR("mlmodelc"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v70);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = [RTPlaceTypeClassifierModelMultiClass alloc];
  v36 = (id *)(v85 + 5);
  obj = (id)v85[5];
  v71 = -[RTPlaceTypeClassifierModelMultiClass initWithContentsOfURL:error:](v35, "initWithContentsOfURL:error:", v69, &obj);
  objc_storeStrong(v36, obj);
  objc_msgSend((id)objc_opt_class(), "placeTypeClassifierModelTargetClass:", a3);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_opt_class();
  -[RTLearnedPlaceTypeInferenceGenerator platform](self, "platform");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "placeTypeClassifierModelThresholdForPlatform:placeType:", v38, a3);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    objc_msgSend((id)objc_opt_class(), "sortPlaceStats:", v9);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E9329510, &unk_1E9329570);
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __111__RTLearnedPlaceTypeInferenceGenerator__inferPlaceTypesFromMultiClassModelForPlaceType_placeStats_metricsData___block_invoke;
    v72[3] = &unk_1E92A5290;
    v72[4] = self;
    v81 = a2;
    v82 = a3;
    v73 = v71;
    v77 = &v84;
    v78 = v90;
    v74 = v67;
    v75 = v68;
    v79 = v92;
    v80 = buf;
    v76 = v10;
    objc_msgSend(v65, "enumerateObjectsUsingBlock:", v72);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v39 = [RTLearnedPlace alloc];
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "place");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "identifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "place");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "mapItem");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "place");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "customLabel");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "place");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "creationDate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "place");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "expirationDate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v39, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v60, a3, 1, v61, v40, v42, v44);

      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v46 = (objc_class *)objc_opt_class();
        NSStringFromClass(v46);
        v47 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v48 = (id)objc_claimAutoreleasedReturnValue();
        +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", a3);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v94 = 138413058;
        v95 = v47;
        v96 = 2112;
        v97 = v48;
        v98 = 2112;
        v99 = v49;
        v100 = 2112;
        v101 = v14;
        _os_log_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_INFO, "%@, %@, placeType, %@, inferred place, %@", v94, 0x2Au);

      }
    }
    else
    {
      v14 = 0;
    }

    v9 = v65;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v54 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v85[5];
      *(_DWORD *)v94 = 138413058;
      v95 = v54;
      v96 = 2112;
      v97 = v55;
      v98 = 2112;
      v99 = v70;
      v100 = 2112;
      v101 = v56;
      _os_log_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_INFO, "%@, %@, failed to load model, %@, error, %@", v94, 0x2Au);

    }
    v14 = 0;
  }

  objc_autoreleasePoolPop(context);
  if (v71)
    v50 = v14;
  else
    v50 = 0;
  _Block_object_dispose(&v84, 8);

  _Block_object_dispose(v90, 8);
  _Block_object_dispose(v92, 8);

  _Block_object_dispose(buf, 8);
LABEL_24:

  return v50;
}

void __111__RTLearnedPlaceTypeInferenceGenerator__inferPlaceTypesFromMultiClassModelForPlaceType_placeStats_metricsData___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  char v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  RTPlaceTypeClassifierModelMultiClassInput *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  objc_class *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  id *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _QWORD *v83;
  objc_class *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  double v111;
  void *v112;
  double v113;
  void *v114;
  double v115;
  void *v116;
  void *v117;
  double v118;
  void *v119;
  double v120;
  void *v121;
  double v122;
  void *v123;
  void *v124;
  double v125;
  void *v126;
  double v127;
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
  RTPlaceTypeClassifierModelMultiClassInput *v149;
  RTPlaceTypeClassifierModelMultiClassInput *v150;
  uint64_t v151;
  id obj;
  uint8_t buf[4];
  void *v154;
  __int16 v155;
  void *v156;
  __int16 v157;
  void *v158;
  __int16 v159;
  id v160;
  __int16 v161;
  void *v162;
  __int16 v163;
  void *v164;
  __int16 v165;
  void *v166;
  __int16 v167;
  void *v168;
  __int16 v169;
  void *v170;
  __int16 v171;
  void *v172;
  __int16 v173;
  uint64_t v174;
  __int16 v175;
  uint64_t v176;
  uint64_t v177;

  v177 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "mlFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v101 = a2;
    v149 = [RTPlaceTypeClassifierModelMultiClassInput alloc];
    objc_msgSend(v4, "mlFeatures");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_charging_duration_bucketed"));
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "doubleValue");
    v127 = v6;
    objc_msgSend(v4, "mlFeatures");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_screen_lock_duration_bucketed"));
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "doubleValue");
    v125 = v7;
    objc_msgSend(v4, "mlFeatures");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"));
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "doubleValue");
    v122 = v8;
    objc_msgSend(v4, "mlFeatures");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "objectForKeyedSubscript:", CFSTR("mean_daily_total_charging_duration_bucketed"));
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "doubleValue");
    v120 = v9;
    objc_msgSend(v4, "mlFeatures");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("mean_daily_total_screen_lock_duration_bucketed"));
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "doubleValue");
    v118 = v10;
    objc_msgSend(v4, "mlFeatures");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "objectForKeyedSubscript:", CFSTR("mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed"));
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "doubleValue");
    v115 = v11;
    objc_msgSend(v4, "mlFeatures");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed"));
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "doubleValue");
    v113 = v12;
    objc_msgSend(v4, "mlFeatures");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("median_daily_longest_charging_duration_bucketed"));
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "doubleValue");
    v111 = v13;
    objc_msgSend(v4, "mlFeatures");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("median_daily_longest_screen_lock_duration_bucketed"));
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "doubleValue");
    v107 = v14;
    objc_msgSend(v4, "mlFeatures");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"));
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "doubleValue");
    v105 = v15;
    objc_msgSend(v4, "mlFeatures");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "objectForKeyedSubscript:", CFSTR("median_daily_total_charging_duration_bucketed"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "doubleValue");
    v17 = v16;
    objc_msgSend(v4, "mlFeatures");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("median_daily_total_screen_lock_duration_bucketed"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "doubleValue");
    v19 = v18;
    objc_msgSend(v4, "mlFeatures");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("median_daily_total_uninterrupted_WiFi_connection_duration_bucketed"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "doubleValue");
    v21 = v20;
    objc_msgSend(v4, "mlFeatures");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_charging_bucketed"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "doubleValue");
    v23 = v22;
    objc_msgSend(v4, "mlFeatures");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_screenLock_bucketed"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "doubleValue");
    v25 = v24;
    objc_msgSend(v4, "mlFeatures");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("percentage_of_days_with_uninterrupted_WiFi_connection_bucketed"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    v29 = v28;
    v30 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "platform");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "numberWithBool:", objc_msgSend(v31, "iPhoneDevice"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValue");
    v34 = v33;
    v35 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "platform");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "iPhoneDevice");
    if ((v37 & 1) != 0)
    {
      v38 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "platform");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v100, "iPhonePlatform");
    }
    objc_msgSend(v35, "numberWithBool:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "doubleValue");
    v41 = v40;
    v42 = (void *)MEMORY[0x1E0CB37E8];
    v151 = a1;
    objc_msgSend(*(id *)(a1 + 32), "platform");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "numberWithBool:", objc_msgSend(v43, "watchPlatform"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "doubleValue");
    v150 = -[RTPlaceTypeClassifierModelMultiClassInput initWithMean_daily_longest_charging_duration_bucketed:mean_daily_longest_screen_lock_duration_bucketed:mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_total_charging_duration_bucketed:mean_daily_total_screen_lock_duration_bucketed:mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed:median_daily_longest_charging_duration_bucketed:median_daily_longest_screen_lock_duration_bucketed:median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:median_daily_total_charging_duration_bucketed:median_daily_total_screen_lock_duration_bucketed:median_daily_total_uninterrupted_WiFi_connection_duration_bucketed:percentage_of_days_with_charging_bucketed:percentage_of_days_with_screen_lock_bucketed:percentage_of_days_with_uninterrupted_WiFi_connection_bucketed:is_iPhone:is_iPad:is_Watch:](v149, "initWithMean_daily_longest_charging_duration_bucketed:mean_daily_longest_screen_lock_duration_bucketed:mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_total_charging_duration_bucketed:mean_daily_total_screen_lock_duration_bucketed:mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed:median_daily_longest_charging_duration_bucketed:median_daily_longest_screen_lock_duration_bucketed:median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:median_daily_total_charging_duration_bucketed:median_daily_total_screen_lock_duration_bucketed:median_daily_total_uninterrupted_WiFi_connection_duration_bucketed:percentage_of_days_with_charging_bucketed:percentage_of_days_with_screen_lock_bucketed:percentage_of_days_with_uninterrupted_WiFi_connection_bucketed:is_iPhone:is_iPad:is_Watch:", v127, v125, v122, v120, v118, v115, v113, v111, v107,
             v105,
             v17,
             v19,
             v21,
             v23,
             v25,
             v29,
             v34,
             v41,
             v45);

    if ((v37 & 1) == 0)
    v46 = v150;
    -[RTPlaceTypeClassifierModelMultiClassInput mean_daily_longest_screen_lock_duration_bucketed](v150, "mean_daily_longest_screen_lock_duration_bucketed");
    if (v47 <= 1.0
      || (-[RTPlaceTypeClassifierModelMultiClassInput mean_daily_total_screen_lock_duration_bucketed](v150, "mean_daily_total_screen_lock_duration_bucketed"), v48 <= 1.0)|| (-[RTPlaceTypeClassifierModelMultiClassInput median_daily_longest_screen_lock_duration_bucketed](v150, "median_daily_longest_screen_lock_duration_bucketed"), v49 <= 1.0)|| (-[RTPlaceTypeClassifierModelMultiClassInput median_daily_total_screen_lock_duration_bucketed](v150, "median_daily_total_screen_lock_duration_bucketed"), v50 <= 1.0)|| (-[RTPlaceTypeClassifierModelMultiClassInput percentage_of_days_with_screen_lock_bucketed](v150, "percentage_of_days_with_screen_lock_bucketed"), v51 <= 1.0))
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        v84 = (objc_class *)objc_opt_class();
        NSStringFromClass(v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(v151 + 104));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", *(_QWORD *)(v151 + 112));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTRuntime objToString:filterProperties:](RTRuntime, "objToString:filterProperties:", v150, &unk_1E932CC10);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v154 = v85;
        v155 = 2112;
        v156 = v86;
        v157 = 2112;
        v158 = v87;
        v159 = 2112;
        v160 = v4;
        v161 = 2112;
        v162 = v88;
        _os_log_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_INFO, "%@, %@, inferring for placeType, %@, placeStat, %@, mlFeatures, %@, \n\nSkipping place inference in multi class model because all the longest duet stream bucketed values are <= 1. It means the stream doesn't exist or the values are less than 10 mins each.", buf, 0x34u);

      }
      goto LABEL_20;
    }
    v52 = v151;
    v53 = *(void **)(v151 + 40);
    v54 = *(_QWORD *)(*(_QWORD *)(v151 + 72) + 8);
    obj = *(id *)(v54 + 40);
    objc_msgSend(v53, "predictionFromFeatures:error:", v150, &obj);
    v55 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v54 + 40), obj);
    -[NSObject classProbability](v55, "classProbability");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "placeTypeClassifierModelTargetClass:", *(_QWORD *)(v151 + 112));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectForKeyedSubscript:", v57);
    v58 = objc_claimAutoreleasedReturnValue();
    v59 = *(_QWORD *)(*(_QWORD *)(v151 + 80) + 8);
    v60 = *(void **)(v59 + 40);
    *(_QWORD *)(v59 + 40) = v58;

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      v62 = (objc_class *)objc_opt_class();
      NSStringFromClass(v62);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(v151 + 104));
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", *(_QWORD *)(v151 + 112));
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTRuntime objToString:filterProperties:](RTRuntime, "objToString:filterProperties:", v150, &unk_1E932CC28);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", 1);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject classProbability](v55, "classProbability");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "placeTypeClassifierModelTargetClass:", 1);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "objectForKeyedSubscript:", v140);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", 2);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject classProbability](v55, "classProbability");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "placeTypeClassifierModelTargetClass:", 2);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "objectForKeyedSubscript:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", *(_QWORD *)(v151 + 112));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = *(_QWORD *)(v151 + 48);
      v70 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v151 + 72) + 8) + 40);
      *(_DWORD *)buf = 138415106;
      v154 = v148;
      v155 = 2112;
      v156 = v146;
      v157 = 2112;
      v158 = v144;
      v159 = 2112;
      v160 = v4;
      v161 = 2112;
      v162 = v63;
      v163 = 2112;
      v164 = v64;
      v165 = 2112;
      v166 = v136;
      v167 = 2112;
      v168 = v65;
      v169 = 2112;
      v170 = v67;
      v171 = 2112;
      v172 = v68;
      v173 = 2112;
      v174 = v69;
      v175 = 2112;
      v176 = v70;
      _os_log_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_INFO, "%@, %@, inferring for placeType, %@, placeStat, %@, mlFeatures, %@, \n\npredicted probability for %@, %@, predicted probability for %@, %@, probability threshold for %@, %@, error, %@", buf, 0x7Au);

      v46 = v150;
      v52 = v151;

    }
    v71 = -[NSObject target](v55, "target");
    if (v71 == (int)objc_msgSend(*(id *)(v52 + 56), "intValue")
      && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v52 + 80) + 8) + 40), "doubleValue"),
          v73 = v72,
          objc_msgSend(*(id *)(v52 + 48), "doubleValue"),
          v73 >= v74)
      && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v52 + 80) + 8) + 40), "doubleValue"),
          v76 = v75,
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v52 + 88) + 8) + 40), "doubleValue"),
          v76 > v77))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v52 + 96) + 8) + 40), v101);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v52 + 88) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(v52 + 80) + 8) + 40));
      v78 = (id *)(v52 + 64);
      objc_msgSend(*(id *)(v52 + 64), "objectForKeyedSubscript:", &unk_1E9329588);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v52 + 64), "setObject:forKeyedSubscript:", v79, &unk_1E93295A0);

      +[RTRuntime objToDictionary:filterProperties:](RTRuntime, "objToDictionary:filterProperties:", v46, &unk_1E932CC40);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v52 + 64), "setObject:forKeyedSubscript:", v80, &unk_1E9329588);

      v81 = &unk_1E93295B8;
      objc_msgSend(*(id *)(v52 + 64), "objectForKeyedSubscript:", &unk_1E93295B8);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v52 + 64), "setObject:forKeyedSubscript:", v82, &unk_1E93295D0);

      v83 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v52 + 88) + 8) + 40);
    }
    else
    {
      v78 = (id *)(v52 + 64);
      objc_msgSend(*(id *)(v52 + 64), "objectForKeyedSubscript:", &unk_1E93295D0);
      v89 = objc_claimAutoreleasedReturnValue();
      if (v89)
      {
        v90 = (void *)v89;
        objc_msgSend(*(id *)(v52 + 64), "objectForKeyedSubscript:", &unk_1E93295D0);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "doubleValue");
        v93 = v92;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v52 + 80) + 8) + 40), "doubleValue");
        v95 = v94;

        if (v93 >= v95)
          goto LABEL_26;
      }
      +[RTRuntime objToDictionary:filterProperties:](RTRuntime, "objToDictionary:filterProperties:", v46, &unk_1E932CC58);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v52 + 64), "setObject:forKeyedSubscript:", v96, &unk_1E93295A0);

      v83 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v52 + 80) + 8) + 40);
      v81 = &unk_1E93295D0;
    }
    objc_msgSend(*v78, "setObject:forKeyedSubscript:", *v83, v81);
LABEL_26:
    v97 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(v52 + 64), "objectForKeyedSubscript:", &unk_1E9329570);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "numberWithUnsignedInt:", objc_msgSend(v98, "unsignedIntValue") + 1);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v52 + 64), "setObject:forKeyedSubscript:", v99, &unk_1E9329570);

LABEL_20:
  }

}

- (id)inferPlaceTypesFromModelForModelType:(unint64_t)a3 placeType:(unint64_t)a4 placeStats:(id)a5 metricsData:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;

  v10 = a5;
  v11 = a6;
  if (a3 == 1)
  {
    -[RTLearnedPlaceTypeInferenceGenerator _inferPlaceTypesFromMultiClassModelForPlaceType:placeStats:metricsData:](self, "_inferPlaceTypesFromMultiClassModelForPlaceType:placeStats:metricsData:", a4, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 2)
    {
      v13 = 0;
      goto LABEL_7;
    }
    -[RTLearnedPlaceTypeInferenceGenerator _inferPlaceTypesFromRankerModelForPlaceType:placeStats:metricsData:](self, "_inferPlaceTypesFromRankerModelForPlaceType:placeStats:metricsData:", a4, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
LABEL_7:

  return v13;
}

- (id)inferPlaceTypesFromModelWithCandidateSelection:(BOOL)a3 homeModelType:(unint64_t)a4 workModelType:(unint64_t)a5 placeStats:(id)a6 dateInterval:(id)a7
{
  _BOOL4 v10;
  id v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  const char *v21;
  objc_class *v22;
  objc_class *v23;
  void *v24;
  void *v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  RTLearnedPlaceTypeInferenceGenerator *v39;
  unint64_t v40;
  NSObject *v41;
  objc_class *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  NSObject *v47;
  objc_class *v48;
  void *v49;
  uint64_t v50;
  const __CFString *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  unint64_t v56;
  NSObject *v57;
  objc_class *v58;
  void *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  NSObject *v66;
  objc_class *v67;
  void *v68;
  _BOOL4 v69;
  void *v70;
  BOOL v72;
  uint64_t v73;
  BOOL v74;
  uint64_t v75;
  BOOL v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  const __CFString *v84;
  void *v85;
  id v86;
  void *v87;
  uint64_t v88;
  void *v89;
  const __CFString *v90;
  void *v91;
  _BOOL4 v92;
  void *v93;
  const char *aSelector;
  char *aSelectora;
  void *v96;
  unint64_t v97;
  void *v98;
  unint64_t v99;
  id v100;
  uint8_t buf[4];
  void *v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  const __CFString *v106;
  __int16 v107;
  uint64_t v108;
  __int16 v109;
  void *v110;
  __int16 v111;
  const __CFString *v112;
  __int16 v113;
  uint64_t v114;
  __int16 v115;
  void *v116;
  _QWORD v117[3];

  v10 = a3;
  v117[1] = *MEMORY[0x1E0C80C00];
  v13 = a6;
  v100 = a7;
  if (!-[RTLearnedPlaceTypeInferenceGenerator supportsModel](self, "supportsModel"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v102 = v19;
      v103 = 2112;
      v104 = v20;
      v21 = "%@, %@, feature not supported";
      goto LABEL_10;
    }
LABEL_11:
    v24 = 0;
    goto LABEL_12;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v102 = v19;
      v103 = 2112;
      v104 = v20;
      v21 = "%@, %@, feature not enabled";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v97 = a5;
  -[RTLearnedPlaceTypeInferenceGenerator defaultsManager](self, "defaultsManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("RTDefaultsLearnedPlaceTypeInferenceGeneratorDisableModel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v102 = v19;
      v103 = 2112;
      v104 = v20;
      v21 = "%@, %@, Model disabled by defaults";
LABEL_10:
      _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, v21, buf, 0x16u);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v99 = a4;
  v17 = objc_opt_new();
  v96 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTLearnedPlaceTypeInferenceGenerator getCandidateGenerationParameters](RTLearnedPlaceTypeInferenceGenerator, "getCandidateGenerationParameters");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlaceTypeInferenceGenerator placeCandidateStatsForType:placeStats:dateInterval:excludingPlaces:parameters:distanceThreshold:](self, "placeCandidateStatsForType:placeStats:dateInterval:excludingPlaces:parameters:distanceThreshold:", 1, v13, v100, 0, 200.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v27, &unk_1E93295E8);

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v28 = objc_claimAutoreleasedReturnValue();
  v93 = v26;
  v92 = v10;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    aSelector = a2;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(aSelector);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = CFSTR("NO");
    if (v10)
      v32 = CFSTR("YES");
    v90 = v32;
    v33 = objc_msgSend(v13, "count");
    objc_msgSend((id)objc_opt_class(), "modelTypeToString:", v99);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v26, "count");
    +[RTRuntime objToString:filterProperties:](RTRuntime, "objToString:filterProperties:", v98, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413826;
    v102 = v30;
    v103 = 2112;
    v104 = v31;
    v105 = 2112;
    v106 = v90;
    v107 = 2048;
    v108 = v33;
    v10 = v92;
    v109 = 2112;
    v110 = v34;
    v111 = 2048;
    v112 = (const __CFString *)v88;
    v113 = 2112;
    v114 = (uint64_t)v35;
    _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "%@, %@, useCandidateSelection, %@, placeStats count, %lu, home model type, %@, home candidates from candidateSelection, count, %lu, parameters, %@", buf, 0x48u);

    v26 = v93;
    a2 = aSelector;
  }

  if (v10)
  {
    v36 = v99;
    if (objc_msgSend(v26, "count"))
    {
      -[RTLearnedPlaceTypeInferenceGenerator inferPlaceTypesFromModelForModelType:placeType:placeStats:metricsData:](self, "inferPlaceTypesFromModelForModelType:placeType:placeStats:metricsData:", v99, 1, v26, v17);
      v37 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v44 = v10;
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v102 = v43;
      v103 = 2112;
      v104 = v45;
      _os_log_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_INFO, "%@, %@, placeStatsCandidatesForHome count is 0. So running all placeStats through model.", buf, 0x16u);

      v10 = v44;
      v36 = v99;

    }
    -[RTLearnedPlaceTypeInferenceGenerator placeStats](self, "placeStats");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = self;
    v40 = v36;
  }
  else
  {
    -[RTLearnedPlaceTypeInferenceGenerator placeStats](self, "placeStats");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = self;
    v40 = v99;
  }
  -[RTLearnedPlaceTypeInferenceGenerator inferPlaceTypesFromModelForModelType:placeType:placeStats:metricsData:](v39, "inferPlaceTypesFromModelForModelType:placeType:placeStats:metricsData:", v40, 1, v38, v17);
  v37 = objc_claimAutoreleasedReturnValue();

LABEL_25:
  aSelectora = (char *)v37;
  if (!v37)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      v58 = (objc_class *)objc_opt_class();
      NSStringFromClass(v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        v61 = CFSTR("YES");
      else
        v61 = CFSTR("NO");
      -[RTLearnedPlaceTypeInferenceGenerator placeStats](self, "placeStats");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "count");
      *(_DWORD *)buf = 138413058;
      v102 = v59;
      v103 = 2112;
      v104 = v60;
      v105 = 2112;
      v106 = v61;
      v107 = 2048;
      v108 = v63;
      _os_log_impl(&dword_1D1A22000, v57, OS_LOG_TYPE_INFO, "%@, %@, skipping work inference from model since home is not inferred, useCandidateSelection, %@, placeStats count, %lu", buf, 0x2Au);

      v10 = v92;
    }
    v56 = v97;
    goto LABEL_46;
  }
  v117[0] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 1);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlaceTypeInferenceGenerator placeCandidateStatsForType:placeStats:dateInterval:excludingPlaces:parameters:distanceThreshold:](self, "placeCandidateStatsForType:placeStats:dateInterval:excludingPlaces:parameters:distanceThreshold:", 2, v13, v100, 200.0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlaceTypeInferenceGenerator filterPlaceStats:referenceLearnedPlace:minDistanceThreshold:maxDistanceThreshold:](self, "filterPlaceStats:referenceLearnedPlace:minDistanceThreshold:maxDistanceThreshold:");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v91, "count"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "setObject:forKeyedSubscript:", v46, &unk_1E93295E8);

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    v48 = (objc_class *)objc_opt_class();
    NSStringFromClass(v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = CFSTR("NO");
    if (v10)
      v51 = CFSTR("YES");
    v84 = v51;
    v85 = (void *)v50;
    v83 = objc_msgSend(v13, "count");
    objc_msgSend((id)objc_opt_class(), "modelTypeToString:", v97);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v91, "count");
    +[RTRuntime objToString:filterProperties:](RTRuntime, "objToString:filterProperties:", v98, 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414082;
    v102 = v49;
    v103 = 2112;
    v104 = v85;
    v105 = 2112;
    v106 = v84;
    v107 = 2048;
    v108 = v83;
    v109 = 2112;
    v110 = v52;
    v111 = 2112;
    v112 = CFSTR("YES");
    v113 = 2048;
    v114 = v53;
    v10 = v92;
    v115 = 2112;
    v116 = v54;
    _os_log_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_INFO, "%@, %@, useCandidateSelection, %@, placeStats count, %lu, work model type, %@, is home inferred, %@, work candidates from candidateSelection, count, %lu, parameters, %@", buf, 0x52u);

    v37 = (uint64_t)aSelectora;
  }
  v86 = v13;

  if (v10)
  {
    v55 = v91;
    v56 = v97;
    if (objc_msgSend(v91, "count"))
    {
      -[RTLearnedPlaceTypeInferenceGenerator inferPlaceTypesFromModelForModelType:placeType:placeStats:metricsData:](self, "inferPlaceTypesFromModelForModelType:placeType:placeStats:metricsData:", v97, 2, v91, v96);
      v57 = objc_claimAutoreleasedReturnValue();
      goto LABEL_44;
    }
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      v67 = (objc_class *)objc_opt_class();
      NSStringFromClass(v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v69 = v10;
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v102 = v68;
      v103 = 2112;
      v104 = v70;
      _os_log_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_INFO, "%@, %@, placeStatsCandidatesForWorkExcludingPlacesNearHome count is 0. Skipping Work model inference", buf, 0x16u);

      v10 = v69;
    }

    v57 = 0;
    v56 = v97;
  }
  else
  {
    -[RTLearnedPlaceTypeInferenceGenerator placeStats](self, "placeStats");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedPlaceTypeInferenceGenerator filterPlaceStats:referenceLearnedPlace:minDistanceThreshold:maxDistanceThreshold:](self, "filterPlaceStats:referenceLearnedPlace:minDistanceThreshold:maxDistanceThreshold:", v64, v37, &unk_1E932D600, &unk_1E932D610);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = v97;
    -[RTLearnedPlaceTypeInferenceGenerator inferPlaceTypesFromModelForModelType:placeType:placeStats:metricsData:](self, "inferPlaceTypesFromModelForModelType:placeType:placeStats:metricsData:", v97, 2, v65, v96);
    v57 = objc_claimAutoreleasedReturnValue();

  }
  v37 = (uint64_t)aSelectora;
  v55 = v91;
LABEL_44:

  objc_msgSend(v24, "addObject:", v37);
  v13 = v86;
  if (v57)
  {
    objc_msgSend(v24, "addObject:", v57);
LABEL_46:

  }
  v72 = v99 == 2 && v56 == 1;
  v73 = 9;
  v74 = v56 == 1 && v99 == 1;
  v75 = 16;
  if (!v74)
    v75 = 0;
  if (!v72)
    v73 = v75;
  v76 = v56 == 1 && v99 == 1;
  v77 = 15;
  if (!v76)
    v77 = 0;
  if (v72)
    v78 = 8;
  else
    v78 = v77;
  if (v10)
    v79 = v78;
  else
    v79 = v73;
  -[RTLearnedPlaceTypeInferenceGenerator placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "storeMetricsData:source:placeType:", v17, v79, 1);

  -[RTLearnedPlaceTypeInferenceGenerator placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "storeMetricsData:source:placeType:", v96, v79, 2);

  -[RTLearnedPlaceTypeInferenceGenerator placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "storeMetricsData:source:", v24, v79);

LABEL_12:
  return v24;
}

- (id)inferPlaceTypesFromModelWithPlaceStats:(id)a3 dateInterval:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  const char *v16;
  objc_class *v17;
  objc_class *v18;
  void *v19;
  id v21;
  id v22;
  id v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[RTLearnedPlaceTypeInferenceGenerator supportsModel](self, "supportsModel"))
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      -[RTLearnedPlaceTypeInferenceGenerator defaultsManager](self, "defaultsManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("RTDefaultsLearnedPlaceTypeInferenceGeneratorDisableModel"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");

      if (!v11)
      {
        -[RTLearnedPlaceTypeInferenceGenerator inferPlaceTypesFromModelWithCandidateSelection:homeModelType:workModelType:placeStats:dateInterval:](self, "inferPlaceTypesFromModelWithCandidateSelection:homeModelType:workModelType:placeStats:dateInterval:", 1, 2, 1, v7, v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[RTLearnedPlaceTypeInferenceGenerator inferPlaceTypesFromModelWithCandidateSelection:homeModelType:workModelType:placeStats:dateInterval:](self, "inferPlaceTypesFromModelWithCandidateSelection:homeModelType:workModelType:placeStats:dateInterval:", 1, 1, 1, v7, v8);
        v22 = -[RTLearnedPlaceTypeInferenceGenerator inferPlaceTypesFromModelWithCandidateSelection:homeModelType:workModelType:placeStats:dateInterval:](self, "inferPlaceTypesFromModelWithCandidateSelection:homeModelType:workModelType:placeStats:dateInterval:", 0, 2, 1, v7, v8);
        v23 = -[RTLearnedPlaceTypeInferenceGenerator inferPlaceTypesFromModelWithCandidateSelection:homeModelType:workModelType:placeStats:dateInterval:](self, "inferPlaceTypesFromModelWithCandidateSelection:homeModelType:workModelType:placeStats:dateInterval:", 0, 1, 1, v7, v8);
        goto LABEL_12;
      }
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v14;
        v26 = 2112;
        v27 = v15;
        v16 = "%@, %@, Model disabled by defaults";
LABEL_10:
        _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v24, 0x16u);

      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v14;
        v26 = 2112;
        v27 = v15;
        v16 = "%@, %@, feature not enabled";
        goto LABEL_10;
      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v14;
      v26 = 2112;
      v27 = v15;
      v16 = "%@, %@, feature not supported";
      goto LABEL_10;
    }
  }

  v19 = 0;
LABEL_12:

  return v19;
}

- (id)filteredPlaceStatsByWeeklyVisitThreshold:(double)a3 placeStats:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v4 = (void *)MEMORY[0x1E0CB3880];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __92__RTLearnedPlaceTypeInferenceGenerator_filteredPlaceStatsByWeeklyVisitThreshold_placeStats___block_invoke;
  v9[3] = &__block_descriptor_40_e64_B24__0__RTLearnedPlaceTypeInferencePlaceStats_8__NSDictionary_16l;
  *(double *)&v9[4] = a3;
  v5 = a4;
  objc_msgSend(v4, "predicateWithBlock:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __92__RTLearnedPlaceTypeInferenceGenerator_filteredPlaceStatsByWeeklyVisitThreshold_placeStats___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "stats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)objc_msgSend(v3, "weeksWithNonZeroDwellTime") / 5.0 > *(double *)(a1 + 32);

  return v4;
}

- (id)inferPlaceTypesFromRuleEngineWithPlaceStats:(id)a3 dateInterval:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  const char *v17;
  objc_class *v18;
  void *v19;
  double v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  id v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[4];
  NSObject *v64;
  _QWORD v65[4];
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint8_t v76[128];
  uint8_t buf[4];
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v62 = v8;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v12 = v7;
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v78 = (uint64_t)v15;
      v79 = 2112;
      v80 = (uint64_t)v16;
      v17 = "%@, %@, feature not enabled";
      goto LABEL_7;
    }
LABEL_8:
    v19 = 0;
LABEL_9:

    goto LABEL_10;
  }
  -[RTLearnedPlaceTypeInferenceGenerator defaultsManager](self, "defaultsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("RTDefaultsLearnedPlaceTypeInferenceGeneratorDisableRuleEngine"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    v12 = v7;
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v78 = (uint64_t)v15;
      v79 = 2112;
      v80 = (uint64_t)v16;
      v17 = "%@, %@, Rule Engine disabled by defaults";
LABEL_7:
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, v17, buf, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  objc_msgSend(v8, "duration");
  v22 = *(_QWORD *)&v21;
  if (v21 < 1209600.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v78 = v22;
      v79 = 2048;
      v80 = 0x4132750000000000;
      _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "cannot infer place types. data set interval, %.2f, does not exceed required minimum interval, %.2f", buf, 0x16u);
    }
    v12 = v7;

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v24 = objc_msgSend(&unk_1E932CC70, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v72 != v26)
            objc_enumerationMutation(&unk_1E932CC70);
          v28 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          -[RTLearnedPlaceTypeInferenceGenerator placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_opt_new();
          objc_msgSend(v29, "storeMetricsData:source:", v30, objc_msgSend(v28, "unsignedIntValue"));

        }
        v25 = objc_msgSend(&unk_1E932CC70, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
      }
      while (v25);
    }
LABEL_21:
    v19 = 0;
    goto LABEL_10;
  }
  -[RTLearnedPlaceTypeInferenceGenerator filteredPlaceStatsByWeeklyVisitThreshold:placeStats:](self, "filteredPlaceStatsByWeeklyVisitThreshold:placeStats:", v7, 0.6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v34, &unk_1E9329630);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, &unk_1E9329648);

    -[RTLearnedPlaceTypeInferenceGenerator inferPlaceTypesFromDailyPatternsWithPlaceStats:dateInterval:](self, "inferPlaceTypesFromDailyPatternsWithPlaceStats:dateInterval:", v7, v8);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v78 = objc_msgSend(v36, "count");
      _os_log_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_INFO, "inferred places from daily patterns, %lu", buf, 0xCu);
    }

    v38 = MEMORY[0x1E0C809B0];
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __97__RTLearnedPlaceTypeInferenceGenerator_inferPlaceTypesFromRuleEngineWithPlaceStats_dateInterval___block_invoke;
    v65[3] = &unk_1E92A19E0;
    v39 = v33;
    v66 = v39;
    v61 = v36;
    objc_msgSend(v36, "enumerateObjectsUsingBlock:", v65);
    v12 = v7;
    -[RTLearnedPlaceTypeInferenceGenerator inferPlaceTypesFromTopMedianDwellTimeWithPlaceStats:dateInterval:](self, "inferPlaceTypesFromTopMedianDwellTimeWithPlaceStats:dateInterval:", v7, v8);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      v42 = objc_msgSend(v40, "count");
      *(_DWORD *)buf = 134217984;
      v78 = v42;
      _os_log_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_INFO, "inferred places from top median dwell time, %lu", buf, 0xCu);
    }

    v63[0] = v38;
    v63[1] = 3221225472;
    v63[2] = __97__RTLearnedPlaceTypeInferenceGenerator_inferPlaceTypesFromRuleEngineWithPlaceStats_dateInterval___block_invoke_314;
    v63[3] = &unk_1E92A19E0;
    v13 = v39;
    v64 = v13;
    objc_msgSend(v40, "enumerateObjectsUsingBlock:", v63);
    v43 = (void *)MEMORY[0x1E0C99E60];
    -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", &unk_1E9329630);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setWithArray:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", &unk_1E9329630);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v46, "count") >= 2)
    {
      v47 = objc_msgSend(v45, "count");

      if (v47 != 1)
      {
LABEL_32:
        -[RTLearnedPlaceTypeInferenceGenerator placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "storeMetricsData:source:", v19, 11);

        goto LABEL_9;
      }
      objc_msgSend(v45, "anyObject");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v48);

      v49 = (void *)MEMORY[0x1E0C99E60];
      -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", &unk_1E9329648);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setWithArray:", v50);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v46, "count") == 1)
      {
        objc_msgSend(v46, "anyObject");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v51);

      }
    }

    goto LABEL_32;
  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_INFO, "cannot infer place types. at least 1 place is required", buf, 2u);
  }
  v12 = v7;

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v54 = objc_msgSend(&unk_1E932CC88, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
  if (!v54)
    goto LABEL_21;
  v55 = v54;
  v56 = *(_QWORD *)v68;
  do
  {
    for (j = 0; j != v55; ++j)
    {
      if (*(_QWORD *)v68 != v56)
        objc_enumerationMutation(&unk_1E932CC88);
      v58 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
      -[RTLearnedPlaceTypeInferenceGenerator placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)objc_opt_new();
      objc_msgSend(v59, "storeMetricsData:source:", v60, objc_msgSend(v58, "unsignedIntValue"));

    }
    v55 = objc_msgSend(&unk_1E932CC88, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
    v19 = 0;
  }
  while (v55);
LABEL_10:

  return v19;
}

void __97__RTLearnedPlaceTypeInferenceGenerator_inferPlaceTypesFromRuleEngineWithPlaceStats_dateInterval___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = 134218242;
    v11 = a3 + 1;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "inferred place from daily patterns %lu, %@", (uint8_t *)&v10, 0x16u);
  }

  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v5);

}

void __97__RTLearnedPlaceTypeInferenceGenerator_inferPlaceTypesFromRuleEngineWithPlaceStats_dateInterval___block_invoke_314(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = 134218242;
    v11 = a3 + 1;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "inferred place from top median dwell time %lu, %@", (uint8_t *)&v10, 0x16u);
  }

  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v5);

}

- (id)fuseInferences:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  objc_class *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  objc_class *v41;
  id v42;
  id v43;
  void *v44;
  NSObject *v45;
  objc_class *v46;
  id v47;
  id v48;
  void *v49;
  id v51;
  _QWORD v52[7];
  _QWORD v53[8];
  _QWORD v54[8];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint8_t buf[4];
  id v86;
  __int16 v87;
  id v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__160;
  v83 = __Block_byref_object_dispose__160;
  v84 = 0;
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__160;
  v77 = __Block_byref_object_dispose__160;
  v78 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__160;
  v71 = __Block_byref_object_dispose__160;
  v72 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__160;
  v65 = __Block_byref_object_dispose__160;
  v66 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__160;
  v59 = __Block_byref_object_dispose__160;
  v60 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E9329660);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    objc_msgSend((id)objc_opt_class(), "placeTypeClassificationSourceToString:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v86 = v8;
    v87 = 2112;
    v88 = v9;
    v89 = 2048;
    v90 = v11;
    v91 = 2112;
    v92 = v12;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, classified %lu places from source, %@", buf, 0x2Au);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E9329660);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __55__RTLearnedPlaceTypeInferenceGenerator_fuseInferences___block_invoke;
  v54[3] = &unk_1E92A52D8;
  v54[4] = self;
  v54[5] = &v79;
  v54[6] = &v73;
  v54[7] = a2;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v54);

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E9329648);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");
    objc_msgSend((id)objc_opt_class(), "placeTypeClassificationSourceToString:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v86 = v17;
    v87 = 2112;
    v88 = v18;
    v89 = 2048;
    v90 = v20;
    v91 = 2112;
    v92 = v21;
    _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%@, %@, classified %lu places from source, %@", buf, 0x2Au);

    v14 = MEMORY[0x1E0C809B0];
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E9329648);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v14;
  v53[1] = 3221225472;
  v53[2] = __55__RTLearnedPlaceTypeInferenceGenerator_fuseInferences___block_invoke_317;
  v53[3] = &unk_1E92A52D8;
  v53[4] = self;
  v53[5] = &v67;
  v53[6] = &v61;
  v53[7] = a2;
  objc_msgSend(v22, "enumerateObjectsUsingBlock:", v53);

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = v14;
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E9329630);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");
    objc_msgSend((id)objc_opt_class(), "placeTypeClassificationSourceToString:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v86 = v26;
    v87 = 2112;
    v88 = v27;
    v89 = 2048;
    v90 = v29;
    v91 = 2112;
    v92 = v30;
    _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "%@, %@, classified %lu places from source, %@", buf, 0x2Au);

    v14 = v24;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E9329630);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v14;
  v52[1] = 3221225472;
  v52[2] = __55__RTLearnedPlaceTypeInferenceGenerator_fuseInferences___block_invoke_318;
  v52[3] = &unk_1E92A5300;
  v52[4] = self;
  v52[5] = &v55;
  v52[6] = a2;
  objc_msgSend(v31, "enumerateObjectsUsingBlock:", v52);

  v32 = (void *)v80[5];
  if (v32)
  {
    v33 = v32;
    v34 = (void *)v74[5];
    if (v34)
    {
      v35 = 3;
      v36 = 3;
LABEL_15:
      v38 = v34;
LABEL_16:
      v39 = v34;
      goto LABEL_17;
    }
    v34 = (void *)v62[5];
    v36 = 3;
    if (v34)
    {
      v35 = 2;
      goto LABEL_15;
    }
  }
  else
  {
    v37 = (void *)v68[5];
    if (!v37)
    {
      v34 = (void *)v56[5];
      if (!v34)
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_INFO, "No places are inferred", buf, 2u);
        }
        v38 = 0;
        v33 = 0;
        goto LABEL_22;
      }
      v35 = 0;
      v38 = 0;
      v36 = 1;
      v33 = (id)v56[5];
      goto LABEL_16;
    }
    v33 = v37;
    v34 = (void *)v62[5];
    v36 = 2;
    if (v34)
    {
      v35 = 0;
      goto LABEL_15;
    }
  }
  v35 = 0;
  v38 = 0;
LABEL_17:
  objc_msgSend(v51, "addObject:", v33, v51);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v43 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "placeTypeClassificationSourceToString:", v36);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v86 = v42;
    v87 = 2112;
    v88 = v43;
    v89 = 2112;
    v90 = (uint64_t)v33;
    v91 = 2112;
    v92 = v44;
    _os_log_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_INFO, "%@, %@, final inferred Home, %@, final Home source, %@", buf, 0x2Au);

  }
  if (v38)
  {
    objc_msgSend(v51, "addObject:", v38);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      v47 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v48 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "placeTypeClassificationSourceToString:", v35);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v86 = v47;
      v87 = 2112;
      v88 = v48;
      v89 = 2112;
      v90 = (uint64_t)v38;
      v91 = 2112;
      v92 = v49;
      _os_log_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_INFO, "%@, %@, final inferred Work, %@, final Work source, %@", buf, 0x2Au);

    }
LABEL_22:

  }
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v67, 8);

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v79, 8);

  return v51;
}

void __55__RTLearnedPlaceTypeInferenceGenerator_fuseInferences___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "placeTypeClassificationSourceToString:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138413314;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    v20 = 2048;
    v21 = a3 + 1;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, place from source, %@, %lu, %@", (uint8_t *)&v14, 0x34u);

  }
  v12 = objc_msgSend(v6, "type");
  if (v12 == 2)
  {
    v13 = *(_QWORD *)(a1 + 48);
    goto LABEL_7;
  }
  if (v12 == 1)
  {
    v13 = *(_QWORD *)(a1 + 40);
LABEL_7:
    objc_storeStrong((id *)(*(_QWORD *)(v13 + 8) + 40), a2);
  }

}

void __55__RTLearnedPlaceTypeInferenceGenerator_fuseInferences___block_invoke_317(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "placeTypeClassificationSourceToString:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138413314;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    v20 = 2048;
    v21 = a3 + 1;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, place from source, %@, %lu, %@", (uint8_t *)&v14, 0x34u);

  }
  v12 = objc_msgSend(v6, "type");
  if (v12 == 2)
  {
    v13 = *(_QWORD *)(a1 + 48);
    goto LABEL_7;
  }
  if (v12 == 1)
  {
    v13 = *(_QWORD *)(a1 + 40);
LABEL_7:
    objc_storeStrong((id *)(*(_QWORD *)(v13 + 8) + 40), a2);
  }

}

void __55__RTLearnedPlaceTypeInferenceGenerator_fuseInferences___block_invoke_318(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "placeTypeClassificationSourceToString:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413314;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2048;
    v19 = a3 + 1;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, place from source, %@ %lu, %@", (uint8_t *)&v12, 0x34u);

  }
  if (objc_msgSend(v6, "type") == 1)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

- (id)inferPlaceTypesFromFallbackWithPlaceStats:(id)a3 dateInterval:(id)a4
{
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  const char *v13;
  objc_class *v14;
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
  NSObject *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  RTLearnedPlace *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const char *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  NSObject *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v47 = v11;
      v48 = 2112;
      v49 = v12;
      v13 = "%@, %@, feature not enabled";
      goto LABEL_7;
    }
LABEL_8:
    v15 = 0;
    goto LABEL_20;
  }
  -[RTLearnedPlaceTypeInferenceGenerator defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("RTDefaultsLearnedPlaceTypeInferenceGeneratorDisableFallback"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v47 = v11;
      v48 = 2112;
      v49 = v12;
      v13 = "%@, %@, Fall Back disabled by defaults";
LABEL_7:
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, v13, buf, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_class();
  -[RTLearnedPlaceTypeInferenceGenerator placeStats](self, "placeStats");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortPlaceStats:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "count"))
  {
    v44 = v18;
    v45 = a2;
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = [RTLearnedPlace alloc];
    objc_msgSend(v19, "place");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "identifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "place");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "mapItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "place");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "customLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "place");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "creationDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v19;
    objc_msgSend(v19, "place");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "expirationDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v40, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v39, 1, 1, v20, v22, v24, v26);

    if (v9)
    {
      objc_msgSend(v15, "addObject:", v9);
      v18 = v44;
      a2 = v45;
      v27 = v41;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v28 = objc_claimAutoreleasedReturnValue();
      a2 = v45;
      v27 = v41;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(v45);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v47 = v37;
        v48 = 2112;
        v49 = v38;
        v50 = 2112;
        v51 = (uint64_t)v41;
        _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "%@, %@, failed to create home from placeStats object, %@", buf, 0x20u);

      }
      v18 = v44;
    }

  }
  else
  {
    v9 = 0;
  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v18, "count");
    *(_DWORD *)buf = 138413058;
    v47 = v31;
    v48 = 2112;
    v49 = v32;
    v50 = 2048;
    v51 = v33;
    v52 = 2112;
    v53 = v9;
    _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "%@, %@, placeStats count, %lu, inferred home from fallback, %@,", buf, 0x2Au);

  }
  -[RTLearnedPlaceTypeInferenceGenerator placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "storeMetricsData:source:", v15, 4);

LABEL_20:
  return v15;
}

- (id)_getCandidatePlaceStatsFromPlaceStats:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", &__block_literal_global_321);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __78__RTLearnedPlaceTypeInferenceGenerator__getCandidatePlaceStatsFromPlaceStats___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  _BOOL8 v21;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v23 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v24 = v4;
  objc_msgSend(v4, "visitIntervals");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(v12, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "compare:", v5);

        if (v15 == -1)
        {
          objc_msgSend(v12, "startDate");
          v16 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v16;
        }
        objc_msgSend(v12, "endDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v6, "compare:", v17);

        if (v18 == -1)
        {
          objc_msgSend(v12, "endDate");
          v19 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v19;
        }
        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "timeIntervalSinceDate:", v5);
  v21 = v20 >= 1555200.0;

  return v21;
}

- (id)_getFullLocationHistoryDateInterval
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;

  -[RTLearnedPlaceTypeInferenceGenerator firstVisit](self, "firstVisit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entryDate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v14 = 0;
LABEL_9:

    return v14;
  }
  v5 = (void *)v4;
  -[RTLearnedPlaceTypeInferenceGenerator lastVisit](self, "lastVisit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exitDate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v14 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v8 = (void *)v7;
  -[RTLearnedPlaceTypeInferenceGenerator firstVisit](self, "firstVisit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entryDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlaceTypeInferenceGenerator lastVisit](self, "lastVisit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exitDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "compare:", v12);

  if (v13 == -1)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3588]);
    -[RTLearnedPlaceTypeInferenceGenerator firstVisit](self, "firstVisit");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "entryDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedPlaceTypeInferenceGenerator lastVisit](self, "lastVisit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exitDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v15, "initWithStartDate:endDate:", v5, v16);

    goto LABEL_8;
  }
  v14 = 0;
  return v14;
}

- (id)inferPlaceTypes
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  _QWORD v81[2];
  uint64_t v82;
  void *v83;
  uint8_t v84[128];
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  uint64_t v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  -[RTLearnedPlaceTypeInferenceGenerator log](self, "log");
  -[RTLearnedPlaceTypeInferenceGenerator placeStats](self, "placeStats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlaceTypeInferenceGenerator _getCandidatePlaceStatsFromPlaceStats:](self, "_getCandidatePlaceStatsFromPlaceStats:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTLearnedPlaceTypeInferenceGenerator _getFullLocationHistoryDateInterval](self, "_getFullLocationHistoryDateInterval");
  v6 = objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedPlaceTypeInferenceGenerator placeStats](self, "placeStats");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v86 = v9;
    v87 = 2112;
    v88 = v10;
    v89 = 2048;
    v90 = objc_msgSend(v11, "count");
    v91 = 2048;
    v92 = objc_msgSend(v5, "count");
    v93 = 2112;
    v94 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, placeStats count, %lu, candidate placeStats count, %lu, dateInterval, %@", buf, 0x34u);

  }
  -[RTLearnedPlaceTypeInferenceGenerator inferPlaceTypesFromRuleEngineWithPlaceStats:dateInterval:](self, "inferPlaceTypesFromRuleEngineWithPlaceStats:dateInterval:", v5, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlaceTypeInferenceGenerator inferPlaceTypesFromModelWithPlaceStats:dateInterval:](self, "inferPlaceTypesFromModelWithPlaceStats:dateInterval:", v5, v6);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") || objc_msgSend(v75, "count"))
  {
    -[RTLearnedPlaceTypeInferenceGenerator inferPlaceTypesFromFallbackWithPlaceStats:dateInterval:](self, "inferPlaceTypesFromFallbackWithPlaceStats:dateInterval:", v5, v6);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[RTLearnedPlaceTypeInferenceGenerator placeStats](self, "placeStats");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedPlaceTypeInferenceGenerator inferPlaceTypesFromFallbackWithPlaceStats:dateInterval:](self, "inferPlaceTypesFromFallbackWithPlaceStats:dateInterval:", v31, v6);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v66 = (void *)v6;
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = 0;
    v18 = *(_QWORD *)v77;
    while (1)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v77 != v18)
          objc_enumerationMutation(v13);
        v20 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "type");
        if (v21 == 1)
        {
          v22 = v17;
          v17 = v20;
        }
        else
        {
          if (v21 != 2)
            continue;
          v22 = v16;
          v16 = v20;
        }
        v23 = v20;

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
      if (!v15)
        goto LABEL_20;
    }
  }
  v16 = 0;
  v17 = 0;
LABEL_20:

  v24 = (void *)objc_opt_new();
  v25 = objc_opt_new();
  v71 = (void *)objc_opt_new();
  v70 = (void *)objc_opt_new();
  v67 = v5;
  if (v17
    && -[RTLearnedPlaceTypeInferenceGenerator supportsModel](self, "supportsModel")
    && _os_feature_enabled_impl())
  {
    v72 = (void *)v25;
    v83 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
    v26 = objc_claimAutoreleasedReturnValue();
    +[RTLearnedPlaceTypeInferenceGenerator getCandidateGenerationParameters](RTLearnedPlaceTypeInferenceGenerator, "getCandidateGenerationParameters");
    v62 = (id)objc_claimAutoreleasedReturnValue();
    v64 = (void *)v26;
    -[RTLearnedPlaceTypeInferenceGenerator placeCandidateStatsForType:placeStats:dateInterval:excludingPlaces:parameters:distanceThreshold:](self, "placeCandidateStatsForType:placeStats:dateInterval:excludingPlaces:parameters:distanceThreshold:", 2, v5, v66, v26, 200.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedPlaceTypeInferenceGenerator filterPlaceStats:referenceLearnedPlace:minDistanceThreshold:maxDistanceThreshold:](self, "filterPlaceStats:referenceLearnedPlace:minDistanceThreshold:maxDistanceThreshold:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedPlaceTypeInferenceGenerator inferPlaceTypesFromModelForModelType:placeType:placeStats:metricsData:](self, "inferPlaceTypesFromModelForModelType:placeType:placeStats:metricsData:", 1, 2, v27, v71);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (v28)
    {
      v82 = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
      v68 = objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v81[0] = v17;
        v81[1] = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
        v30 = objc_claimAutoreleasedReturnValue();

        v75 = (void *)v30;
      }
    }
    else
    {
      v68 = (uint64_t)v24;
    }
    -[RTLearnedPlaceTypeInferenceGenerator filterPlaceStats:referenceLearnedPlace:minDistanceThreshold:maxDistanceThreshold:](self, "filterPlaceStats:referenceLearnedPlace:minDistanceThreshold:maxDistanceThreshold:", v67, v17, &unk_1E932D600, &unk_1E932D610);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedPlaceTypeInferenceGenerator inferPlaceTypesFromModelForModelType:placeType:placeStats:metricsData:](self, "inferPlaceTypesFromModelForModelType:placeType:placeStats:metricsData:", 1, 2, v32, v70);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    if (v33)
    {
      v80 = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
      v35 = objc_claimAutoreleasedReturnValue();

      v72 = (void *)v35;
    }
    -[RTLearnedPlaceTypeInferenceGenerator placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "storeMetricsData:source:placeType:", v71, 6, 2);

    -[RTLearnedPlaceTypeInferenceGenerator placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "storeMetricsData:source:placeType:", v70, 7, 2);

    v25 = (uint64_t)v72;
    v24 = (void *)v68;
  }
  v38 = (void *)objc_opt_new();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v13, &unk_1E9329660);
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v75, &unk_1E9329648);
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v74, &unk_1E9329630);
  v65 = v38;
  -[RTLearnedPlaceTypeInferenceGenerator fuseInferences:](self, "fuseInferences:", v38);
  v39 = objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlaceTypeInferenceGenerator placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v24;
  objc_msgSend(v40, "storeMetricsData:source:", v24, 6);

  -[RTLearnedPlaceTypeInferenceGenerator placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)v25;
  objc_msgSend(v41, "storeMetricsData:source:", v25, 7);

  -[RTLearnedPlaceTypeInferenceGenerator placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (id)v39;
  objc_msgSend(v42, "storeMetricsData:source:", v39, 5);

  v43 = (void *)objc_opt_new();
  v44 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLearnedPlaceTypeInferenceGenerator placeStats](self, "placeStats");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "numberWithUnsignedInteger:", objc_msgSend(v45, "count"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v46, &unk_1E9329648);

  -[RTLearnedPlaceTypeInferenceGenerator firstVisit](self, "firstVisit");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "entryDate");
  v48 = objc_claimAutoreleasedReturnValue();
  if (!v48)
  {
    v52 = v67;
    goto LABEL_35;
  }
  v49 = (void *)v48;
  -[RTLearnedPlaceTypeInferenceGenerator lastVisit](self, "lastVisit");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "exitDate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = v67;
  if (v51)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedPlaceTypeInferenceGenerator firstVisit](self, "firstVisit");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "entryDate");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedPlaceTypeInferenceGenerator lastVisit](self, "lastVisit");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "exitDate");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "components:fromDate:toDate:options:", 16, v53, v55, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = v67;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v59, "day"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v56, &unk_1E9329660);

LABEL_35:
  }
  -[RTLearnedPlaceTypeInferenceGenerator placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator", v59);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "storeMetricsData:source:placeType:", v43, 0, 0);

  return v63;
}

- (void)log
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedPlaceTypeInferenceGenerator placeStats](self, "placeStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    -[RTLearnedPlaceTypeInferenceGenerator lastVisit](self, "lastVisit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "exitDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedPlaceTypeInferenceGenerator firstVisit](self, "firstVisit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "entryDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v11);
    v14 = 138412802;
    v15 = v5;
    v16 = 2048;
    v17 = v7;
    v18 = 2048;
    v19 = v12;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@, place stats, %lu, dataSetTimeInterval, %.2f", (uint8_t *)&v14, 0x20u);

  }
  -[RTLearnedPlaceTypeInferenceGenerator placeStats](self, "placeStats");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", &__block_literal_global_322);

}

void __43__RTLearnedPlaceTypeInferenceGenerator_log__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "place stat, %lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

- (id)placeCandidatesFromDailyPatternsForType:(unint64_t)a3 placeStats:(id)a4 parameters:(id)a5
{
  id v9;
  id v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
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
  NSObject *v51;
  objc_class *v52;
  void *v53;
  void *v54;
  const __CFString *v56;
  const char *aSelector;
  RTLearnedPlaceTypeInferenceGenerator *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  const __CFString *v70;
  __int16 v71;
  double v72;
  __int16 v73;
  double v74;
  __int16 v75;
  double v76;
  __int16 v77;
  double v78;
  __int16 v79;
  void *v80;
  _QWORD v81[2];
  _QWORD v82[6];

  v82[4] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (a3 == 1)
  {
    aSelector = a2;
    v58 = self;
    v59 = v9;
    v56 = CFSTR("home");
    v12 = CFSTR("sHomeTotalWeeklyVisitCountPlaceCandidates");
    v13 = CFSTR("sHomeMinWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates");
    v14 = CFSTR("sHomeMaxDaysNonZeroDwellTimePlaceCandidates");
    v15 = CFSTR("sHomeMinDaysNonZeroDwellTimePlaceCandidates");
  }
  else
  {
    if (a3 != 2)
    {
      v50 = 0;
      goto LABEL_9;
    }
    aSelector = a2;
    v58 = self;
    v59 = v9;
    v56 = CFSTR("work");
    v12 = CFSTR("sWorkTotalWeeklyVisitCountPlaceCandidates");
    v13 = CFSTR("sWorkMinWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates");
    v14 = CFSTR("sWorkMaxDaysNonZeroDwellTimePlaceCandidates");
    v15 = CFSTR("sWorkMinDaysNonZeroDwellTimePlaceCandidates");
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", v15);
  v64 = v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  objc_msgSend(v64, "objectForKeyedSubscript:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  objc_msgSend(v64, "objectForKeyedSubscript:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  v24 = v23;

  objc_msgSend(v64, "objectForKeyedSubscript:", v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValue");
  v27 = v26;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("stats"), CFSTR("weeklyDaysWithNonZeroDwellTimeAverage"));
  v28 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("stats"), CFSTR("weeklyAggregateDwellTimeBetweenDateRangeAverage"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("stats"), CFSTR("weeklyTotalDailyVisitCountAverage"));
  v29 = objc_claimAutoreleasedReturnValue();
  v60 = (void *)MEMORY[0x1E0CB3528];
  v30 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "predicateWithFormat:", CFSTR("%K >= %@"), v28, v61);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v31;
  v32 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "predicateWithFormat:", CFSTR("%K <= %@"), v28, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v34;
  v35 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "predicateWithFormat:", CFSTR("%K > %@"), v63, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v37;
  v38 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)v29;
  objc_msgSend(v38, "predicateWithFormat:", CFSTR("%K >= %@"), v29, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v82[3] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "andPredicateWithSubpredicates:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v64;
  v43 = (void *)v28;

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v28, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v44;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v63, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v81[1] = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("sWeeklyVisitThresholdPlaceCandidates"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "doubleValue");
  v9 = v59;
  -[RTLearnedPlaceTypeInferenceGenerator filteredPlaceStatsByWeeklyVisitThreshold:placeStats:](v58, "filteredPlaceStatsByWeeklyVisitThreshold:placeStats:", v59);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "filteredArrayUsingPredicate:", v42);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "sortedArrayUsingDescriptors:", v46);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    v52 = (objc_class *)objc_opt_class();
    NSStringFromClass(v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(aSelector);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414082;
    v66 = v53;
    v67 = 2112;
    v68 = v54;
    v69 = 2112;
    v70 = v56;
    v71 = 2048;
    v72 = v18;
    v73 = 2048;
    v74 = v21;
    v75 = 2048;
    v76 = v24;
    v77 = 2048;
    v78 = v27;
    v79 = 2112;
    v80 = v50;
    _os_log_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_INFO, "%@, %@, candidate %@ places from daily patterns requiring minDaysNonZeroDwellTimePlaceCandidates, %.2f, maxDaysNonZeroDwellTimePlaceCandidates, %.2f, minWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates, %.2f, totalWeeklyVisitCountPlaceCandidates, %.2f: %@", buf, 0x52u);

  }
LABEL_9:

  return v50;
}

- (id)placeCandidatesFromTopMedianDwellTimeForType:(unint64_t)a3 placeStats:(id)a4 parameters:(id)a5
{
  id v9;
  id v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  uint64_t v50;
  const __CFString *v51;
  const char *aSelector;
  RTLearnedPlaceTypeInferenceGenerator *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  const __CFString *v65;
  __int16 v66;
  double v67;
  __int16 v68;
  double v69;
  __int16 v70;
  double v71;
  __int16 v72;
  void *v73;
  void *v74;
  _QWORD v75[5];

  v75[3] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (a3 == 1)
  {
    aSelector = a2;
    v53 = self;
    v54 = v9;
    v51 = CFSTR("home");
    v12 = CFSTR("sHomeMinTopMedianDwellTimePlaceCandidates");
    v13 = CFSTR("sHomeTotalWeeklyVisitCountPlaceCandidates");
    v14 = CFSTR("sHomeMinDaysNonZeroDwellTimePlaceCandidates");
  }
  else
  {
    if (a3 != 2)
    {
      v44 = 0;
      goto LABEL_9;
    }
    aSelector = a2;
    v53 = self;
    v54 = v9;
    v51 = CFSTR("work");
    v12 = CFSTR("sWorkMinTopMedianDwellTimePlaceCandidates");
    v13 = CFSTR("sWorkTotalWeeklyVisitCountPlaceCandidates");
    v14 = CFSTR("sWorkMinDaysNonZeroDwellTimePlaceCandidates");
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  objc_msgSend(v11, "objectForKeyedSubscript:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("stats"), CFSTR("weeklyDaysWithNonZeroDwellTimeAverage"));
  v24 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("stats"), CFSTR("weeklyTotalDailyVisitCountAverage"));
  v25 = v11;
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("stats"), CFSTR("topMedianDwellTime"));
  v27 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)MEMORY[0x1E0CB3528];
  v28 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)v24;
  objc_msgSend(v28, "predicateWithFormat:", CFSTR("%K >= %@"), v24, v56);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v29;
  v30 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v26;
  v58 = (void *)v26;
  v11 = v25;
  objc_msgSend(v30, "predicateWithFormat:", CFSTR("%K >= %@"), v50, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v32;
  v33 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)v27;
  objc_msgSend(v33, "predicateWithFormat:", CFSTR("%K > %@"), v27, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v75[2] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "andPredicateWithSubpredicates:", v36);
  v37 = objc_claimAutoreleasedReturnValue();

  v38 = (void *)v37;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("stats.topMedianDwellTime"), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("sWeeklyVisitThresholdPlaceCandidates"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "doubleValue");
  v9 = v54;
  -[RTLearnedPlaceTypeInferenceGenerator filteredPlaceStatsByWeeklyVisitThreshold:placeStats:](v53, "filteredPlaceStatsByWeeklyVisitThreshold:placeStats:", v54);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "filteredArrayUsingPredicate:", v38);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "sortedArrayUsingDescriptors:", v40);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    v46 = (objc_class *)objc_opt_class();
    NSStringFromClass(v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(aSelector);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413826;
    v61 = v47;
    v62 = 2112;
    v63 = v48;
    v64 = 2112;
    v65 = v51;
    v66 = 2048;
    v67 = v17;
    v68 = 2048;
    v69 = v20;
    v70 = 2048;
    v71 = v23;
    v72 = 2112;
    v73 = v44;
    _os_log_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_INFO, "%@, %@, candidate %@ places from dwell time stats requiring minDaysNonZeroDwellTimePlaceCandidates, %.2f, totalWeeklyVisitCountPlaceCandidates, %.2f, minTopMedianDwellTimePlaceCandidates, %.2f: %@", buf, 0x48u);

  }
LABEL_9:

  return v44;
}

- (id)filterPlaceStats:(id)a3 referenceLearnedPlace:(id)a4 minDistanceThreshold:(id)a5 maxDistanceThreshold:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *aSelector;
  id v42;
  id v43;
  id v44;
  id v45;
  id obj;
  uint64_t v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v45 = a5;
  v44 = a6;
  if (v11 && v45 && v44)
  {
    aSelector = a2;
    v42 = v10;
    v43 = (id)objc_opt_new();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
    if (v13)
    {
      v14 = v13;
      obj = v12;
      v47 = *(_QWORD *)v50;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v50 != v47)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v15);
          -[RTLearnedPlaceTypeInferenceGenerator distanceCalculator](self, "distanceCalculator", aSelector);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "place");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "mapItem");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "location");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "mapItem");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "location");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "distanceFromLocation:toLocation:error:", v20, v22, 0);
          v24 = v23;

          objc_msgSend(v16, "place");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v26, "isEqual:", v27) & 1) != 0 || (objc_msgSend(v45, "doubleValue"), v24 <= v28))
          {

          }
          else
          {
            objc_msgSend(v44, "doubleValue");
            v30 = v29;

            if (v24 < v30)
              objc_msgSend(v43, "addObject:", v16);
          }
          ++v15;
        }
        while (v14 != v15);
        v12 = obj;
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
      }
      while (v14);
    }

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v12, "count");
      v36 = objc_msgSend(v43, "count");
      objc_msgSend(v45, "doubleValue");
      v38 = v37;
      objc_msgSend(v44, "doubleValue");
      *(_DWORD *)buf = 138413570;
      v54 = v33;
      v55 = 2112;
      v56 = v34;
      v57 = 2048;
      v58 = v35;
      v59 = 2048;
      v60 = v36;
      v61 = 2048;
      v62 = v38;
      v63 = 2048;
      v64 = v39;
      _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_INFO, "%@, %@, input placeStats count, %lu, filterPlaceStats count, %lu, minDistanceThreshold, %.2f, maxDistanceThreshold, %.2f", buf, 0x3Eu);

    }
    v10 = v42;
  }
  else
  {
    v43 = v10;
  }

  return v43;
}

- (id)placeCandidateStatsForType:(unint64_t)a3 placeStats:(id)a4 dateInterval:(id)a5 excludingPlaces:(id)a6 parameters:(id)a7 distanceThreshold:(double)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  objc_class *v70;
  char *v71;
  void *v72;
  unint64_t v73;
  unint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  double v97;
  double v98;
  unint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  RTLearnedPlace *v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  NSObject *v112;
  objc_class *v113;
  char *v114;
  void *v115;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  const __CFString *v121;
  NSObject *v122;
  void *v124;
  RTLearnedPlace *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  RTLearnedPlaceTypeInferenceGenerator *v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  unint64_t v136;
  void *v137;
  id obj;
  id obja;
  void *v140;
  _QWORD v141[4];
  id v142;
  id v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  uint8_t v148[128];
  uint8_t buf[4];
  const char *v150;
  __int16 v151;
  uint64_t v152;
  __int16 v153;
  const __CFString *v154;
  __int16 v155;
  void *v156;
  __int16 v157;
  uint64_t v158;
  __int16 v159;
  uint64_t v160;
  __int16 v161;
  uint64_t v162;
  __int16 v163;
  uint64_t v164;
  __int16 v165;
  void *v166;
  _QWORD v167[15];

  v167[12] = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v131 = a5;
  v15 = a6;
  v16 = a7;
  v130 = self;
  -[RTLearnedPlaceTypeInferenceGenerator _prepareMLFeaturesWithPlaceStats:](self, "_prepareMLFeaturesWithPlaceStats:", v14);
  v17 = (void *)MEMORY[0x1E0C99E60];
  v167[0] = CFSTR("sWeeklyVisitThresholdPlaceCandidates");
  v167[1] = CFSTR("sMinimumDataSetIntervalForPlaceCandidates");
  v167[2] = CFSTR("sHomeMinTopMedianDwellTimePlaceCandidates");
  v167[3] = CFSTR("sHomeTotalWeeklyVisitCountPlaceCandidates");
  v167[4] = CFSTR("sHomeMinWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates");
  v167[5] = CFSTR("sHomeMinDaysNonZeroDwellTimePlaceCandidates");
  v167[6] = CFSTR("sHomeMaxDaysNonZeroDwellTimePlaceCandidates");
  v167[7] = CFSTR("sWorkMinTopMedianDwellTimePlaceCandidates");
  v167[8] = CFSTR("sWorkTotalWeeklyVisitCountPlaceCandidates");
  v167[9] = CFSTR("sWorkMinWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates");
  v167[10] = CFSTR("sWorkMinDaysNonZeroDwellTimePlaceCandidates");
  v167[11] = CFSTR("sWorkMaxDaysNonZeroDwellTimePlaceCandidates");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v167, 12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0C99E60];
  v132 = v16;
  objc_msgSend(v16, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setWithArray:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v128 = v22;
  v129 = (void *)v19;
  if ((objc_msgSend(v22, "isEqualToSet:", v19) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v150 = "-[RTLearnedPlaceTypeInferenceGenerator placeCandidateStatsForType:placeStats:dateInterval:excludingPlaces:p"
             "arameters:distanceThreshold:]";
      v151 = 1024;
      LODWORD(v152) = 2192;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [parametersKeys isEqualToSet:expectedKeys] (in %s:%d)", buf, 0x12u);
    }

  }
  v24 = v131;
  objc_msgSend(v131, "duration");
  v26 = v25;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("sMinimumDataSetIntervalForPlaceCandidates"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  v29 = v28;

  if (v26 >= v29)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("sWeeklyVisitThresholdPlaceCandidates"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "doubleValue");
    -[RTLearnedPlaceTypeInferenceGenerator filteredPlaceStatsByWeeklyVisitThreshold:placeStats:](v130, "filteredPlaceStatsByWeeklyVisitThreshold:placeStats:", v14);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");

    if (!v37)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "cannot generate place candidates. at least 1 place is required", buf, 2u);
      }
      v34 = 0;
      v24 = v131;
      v31 = v132;
      goto LABEL_50;
    }
    if (a3 == 1)
    {
      v38 = v15;
      v121 = CFSTR("home");
      v39 = CFSTR("sHomeMinTopMedianDwellTimePlaceCandidates");
      v40 = CFSTR("sHomeTotalWeeklyVisitCountPlaceCandidates");
      v41 = CFSTR("sHomeMinWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates");
      v42 = CFSTR("sHomeMaxDaysNonZeroDwellTimePlaceCandidates");
      v43 = CFSTR("sHomeMinDaysNonZeroDwellTimePlaceCandidates");
    }
    else
    {
      if (a3 != 2)
      {
        v34 = 0;
        v24 = v131;
        v31 = v132;
        goto LABEL_51;
      }
      v38 = v15;
      v121 = CFSTR("work");
      v39 = CFSTR("sWorkMinTopMedianDwellTimePlaceCandidates");
      v40 = CFSTR("sWorkTotalWeeklyVisitCountPlaceCandidates");
      v41 = CFSTR("sWorkMinWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates");
      v42 = CFSTR("sWorkMaxDaysNonZeroDwellTimePlaceCandidates");
      v43 = CFSTR("sWorkMinDaysNonZeroDwellTimePlaceCandidates");
    }
    objc_msgSend(v132, "objectForKeyedSubscript:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "doubleValue");
    v46 = v45;

    objc_msgSend(v132, "objectForKeyedSubscript:", v42);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "doubleValue");
    v49 = v48;

    objc_msgSend(v132, "objectForKeyedSubscript:", v41);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "doubleValue");
    v52 = v51;

    objc_msgSend(v132, "objectForKeyedSubscript:", v40);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "doubleValue");
    v55 = v54;

    objc_msgSend(v132, "objectForKeyedSubscript:", v39);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "doubleValue");
    v58 = v57;

    -[RTLearnedPlaceTypeInferenceGenerator placeCandidatesFromDailyPatternsForType:placeStats:parameters:](v130, "placeCandidatesFromDailyPatternsForType:placeStats:parameters:", a3, v14, v132);
    v122 = objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      v60 = -[NSObject count](v122, "count");
      *(_DWORD *)buf = 138412546;
      v150 = (const char *)v121;
      v151 = 2048;
      v152 = v60;
      _os_log_impl(&dword_1D1A22000, v59, OS_LOG_TYPE_INFO, "number of candidate places from daily patterns for %@: %lu", buf, 0x16u);
    }

    -[RTLearnedPlaceTypeInferenceGenerator placeCandidatesFromTopMedianDwellTimeForType:placeStats:parameters:](v130, "placeCandidatesFromTopMedianDwellTimeForType:placeStats:parameters:", a3, v14, v132);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v62 = objc_claimAutoreleasedReturnValue();
    v15 = v38;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      v63 = objc_msgSend(v61, "count");
      *(_DWORD *)buf = 138412546;
      v150 = (const char *)v121;
      v151 = 2048;
      v152 = v63;
      _os_log_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_INFO, "number of candidate places from top median dwell time for %@: %lu", buf, 0x16u);
    }
    v120 = v14;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v122);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = v61;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v61);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "intersectSet:");
    v65 = (void *)MEMORY[0x1E0C99DE8];
    v118 = v64;
    objc_msgSend(v64, "allObjects");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "arrayWithArray:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "sortPlaceStats:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      v70 = (objc_class *)objc_opt_class();
      NSStringFromClass(v70);
      v71 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138414338;
      v150 = v71;
      v151 = 2112;
      v152 = (uint64_t)v72;
      v153 = 2112;
      v154 = v121;
      v155 = 2048;
      v156 = v46;
      v157 = 2048;
      v158 = v49;
      v159 = 2048;
      v160 = v52;
      v161 = 2048;
      v162 = v55;
      v163 = 2048;
      v164 = v58;
      v165 = 2112;
      v166 = v68;
      _os_log_impl(&dword_1D1A22000, v69, OS_LOG_TYPE_INFO, "%@, %@, candidate %@ places from dwell time and daily patterns before pruning requiring minDaysNonZeroDwellTimePlaceCandidates, %.2f, maxDaysNonZeroDwellTimePlaceCandidates, %.2f, minWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates, %.2f, totalWeeklyVisitCountPlaceCandidates, %.2f, minTopMedianDwellTimePlaceCandidates, %.2f: %@", buf, 0x5Cu);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = (void *)objc_opt_new();
    v135 = v68;
    if (!objc_msgSend(v68, "count"))
    {
LABEL_47:
      v108 = (void *)MEMORY[0x1E0CB3880];
      v141[0] = MEMORY[0x1E0C809B0];
      v141[1] = 3221225472;
      v141[2] = __136__RTLearnedPlaceTypeInferenceGenerator_placeCandidateStatsForType_placeStats_dateInterval_excludingPlaces_parameters_distanceThreshold___block_invoke;
      v141[3] = &unk_1E92A53A8;
      v142 = v134;
      v109 = v134;
      objc_msgSend(v108, "predicateWithBlock:", v141);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v120;
      objc_msgSend(v120, "filteredArrayUsingPredicate:", v110);
      v111 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "sortPlaceStats:", v111);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v112 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
      {
        v113 = (objc_class *)objc_opt_class();
        NSStringFromClass(v113);
        v114 = (char *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v150 = v114;
        v151 = 2112;
        v152 = (uint64_t)v115;
        v153 = 2112;
        v154 = v121;
        v155 = 2112;
        v156 = v34;
        _os_log_impl(&dword_1D1A22000, v112, OS_LOG_TYPE_INFO, "%@, %@, candidate %@ places from dwell time and daily patterns after pruning: %@", buf, 0x2Au);

      }
      v24 = v131;
      v31 = v132;
      v30 = v122;
      goto LABEL_50;
    }
    v73 = 0;
    v133 = v38;
    while (1)
    {
      v136 = v73;
      objc_msgSend(v68, "objectAtIndexedSubscript:", v73);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
      {
        v74 = 0;
        do
        {
          objc_msgSend(v15, "objectAtIndexedSubscript:", v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v140, "place");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "identifier");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "identifier");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = objc_msgSend(v77, "isEqual:", v78);

          if (v79)
            break;
          ++v74;
        }
        while (objc_msgSend(v15, "count") > v74);
      }
      else
      {
        LOBYTE(v79) = 0;
      }
      v146 = 0u;
      v147 = 0u;
      v144 = 0u;
      v145 = 0u;
      v80 = v134;
      v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v144, v148, 16);
      if (v81)
        break;
LABEL_43:

      v15 = v133;
      v99 = v136;
      if ((v79 & 1) == 0)
      {
        obja = v80;
        v125 = [RTLearnedPlace alloc];
        objc_msgSend(v140, "place");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "identifier");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "place");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "mapItem");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "place");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "customLabel");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "place");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "creationDate");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "place");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "expirationDate");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v125, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v124, 0, 0, v100, v102, v104, v106);

        objc_msgSend(obja, "addObject:", v107);
      }
LABEL_46:

      v73 = v99 + 1;
      v68 = v135;
      if (objc_msgSend(v135, "count") <= v73)
        goto LABEL_47;
    }
    v82 = v81;
    v83 = *(_QWORD *)v145;
    obj = v80;
LABEL_33:
    v84 = 0;
    while (1)
    {
      if (*(_QWORD *)v145 != v83)
        objc_enumerationMutation(obj);
      v85 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * v84);
      objc_msgSend(v85, "mapItem");
      v86 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "location");
      v87 = objc_claimAutoreleasedReturnValue();
      if (!v87)
        goto LABEL_40;
      v88 = (void *)v87;
      objc_msgSend(v140, "place");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "mapItem");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "location");
      v91 = (void *)objc_claimAutoreleasedReturnValue();

      if (v91)
        break;
LABEL_41:
      if (v82 == ++v84)
      {
        v80 = obj;
        v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v144, v148, 16);
        if (v82)
          goto LABEL_33;
        goto LABEL_43;
      }
    }
    objc_msgSend(v140, "place");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "mapItem");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "location");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "mapItem");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "location");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = 0;
    objc_msgSend(v137, "distanceFromLocation:toLocation:error:", v94, v96, &v143);
    v98 = v97;
    v86 = v143;

    if (!v86 && v98 <= a8)
    {
      v15 = v133;
      v99 = v136;

      goto LABEL_46;
    }
LABEL_40:

    goto LABEL_41;
  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = v16;
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("sMinimumDataSetIntervalForPlaceCandidates"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValue");
    *(_DWORD *)buf = 134218240;
    v150 = *(const char **)&v26;
    v151 = 2048;
    v152 = v33;
    _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "cannot generate place candidates. data set interval, %.2f, does not exceed required minimum interval, %.2f", buf, 0x16u);

    v34 = 0;
  }
  else
  {
    v34 = 0;
    v31 = v16;
  }
LABEL_50:

LABEL_51:
  return v34;
}

uint64_t __136__RTLearnedPlaceTypeInferenceGenerator_placeCandidateStatsForType_placeStats_dateInterval_excludingPlaces_parameters_distanceThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  id obj;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "mlFeatures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = *(id *)(a1 + 32);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v3, "place");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_charging_duration_bucketed"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "doubleValue");
          if (v13 > 1.0)
            goto LABEL_16;
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_screen_lock_duration_bucketed"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValue");
          if (v15 > 1.0)
          {

LABEL_16:
LABEL_17:
            v5 = 1;
            goto LABEL_18;
          }
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"));
          v25 = v9;
          v16 = v5;
          v17 = v4;
          v18 = v6;
          v19 = v3;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "doubleValue");
          v22 = v21;

          v3 = v19;
          v6 = v18;
          v4 = v17;
          v5 = v16;

          if (v22 > 1.0)
            goto LABEL_17;
        }
        else
        {

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_18:

  return v5;
}

+ (id)getCandidateGenerationParameters
{
  _QWORD v3[12];
  _QWORD v4[13];

  v4[12] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("sWeeklyVisitThresholdPlaceCandidates");
  v3[1] = CFSTR("sMinimumDataSetIntervalForPlaceCandidates");
  v4[0] = &unk_1E932D620;
  v4[1] = &unk_1E932D630;
  v3[2] = CFSTR("sHomeMinTopMedianDwellTimePlaceCandidates");
  v3[3] = CFSTR("sHomeTotalWeeklyVisitCountPlaceCandidates");
  v4[2] = &unk_1E932D640;
  v4[3] = &unk_1E9329678;
  v3[4] = CFSTR("sHomeMinWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates");
  v3[5] = CFSTR("sHomeMinDaysNonZeroDwellTimePlaceCandidates");
  v4[4] = &unk_1E932D650;
  v4[5] = &unk_1E9329678;
  v3[6] = CFSTR("sHomeMaxDaysNonZeroDwellTimePlaceCandidates");
  v3[7] = CFSTR("sWorkMinTopMedianDwellTimePlaceCandidates");
  v4[6] = &unk_1E9329690;
  v4[7] = &unk_1E932D660;
  v3[8] = CFSTR("sWorkTotalWeeklyVisitCountPlaceCandidates");
  v3[9] = CFSTR("sWorkMinWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates");
  v4[8] = &unk_1E93296A8;
  v4[9] = &unk_1E932D650;
  v3[10] = CFSTR("sWorkMinDaysNonZeroDwellTimePlaceCandidates");
  v3[11] = CFSTR("sWorkMaxDaysNonZeroDwellTimePlaceCandidates");
  v4[10] = &unk_1E93296A8;
  v4[11] = &unk_1E9329690;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 12);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_prepareMLFeaturesWithPlaceStats:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  const char *v11;
  objc_class *v12;
  objc_class *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  RTLearnedPlaceTypeInferenceGenerator *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
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
  NSObject *v52;
  void *v53;
  objc_class *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  objc_class *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  objc_class *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v83;
  id obj;
  RTLearnedPlaceTypeInferenceGenerator *v85;
  uint64_t v86;
  void *v87;
  char *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  uint64_t v104;
  __int16 v105;
  void *v106;
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[RTLearnedPlaceTypeInferenceGenerator supportsModel](self, "supportsModel"))
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      -[RTLearnedPlaceTypeInferenceGenerator placeStatsUUIDStringsToMLFeaturesMap](self, "placeStatsUUIDStringsToMLFeaturesMap");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (v6)
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = (objc_class *)objc_opt_class();
          NSStringFromClass(v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v98 = v9;
          v99 = 2112;
          v100 = v10;
          v11 = "%@, %@, mlFeatures are already set";
LABEL_10:
          _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, v11, buf, 0x16u);

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v75 = objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v98 = v16;
          v99 = 2112;
          v100 = v17;
          _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "--------->%@, %@, started, <---------", buf, 0x16u);

        }
        v85 = self;

        v87 = (void *)objc_opt_new();
        v93 = 0u;
        v94 = 0u;
        v95 = 0u;
        v96 = 0u;
        v18 = v4;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v93, v108, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v94;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v94 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
              v24 = (void *)MEMORY[0x1D8231EA8]();
              objc_msgSend(v23, "visitIntervals");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "count");

              if (v26)
              {
                objc_msgSend(v23, "visitIntervals");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "place");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "identifier");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "UUIDString");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v87, "setObject:forKeyedSubscript:", v27, v30);

              }
              objc_autoreleasePoolPop(v24);
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v93, v108, 16);
          }
          while (v20);
        }

        v31 = v87;
        if (objc_msgSend(v87, "count"))
        {
          v74 = v4;
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "dateByAddingTimeInterval:", -3628800.0);
          v33 = objc_claimAutoreleasedReturnValue();
          +[RTPlaceDataMetrics calculateMLFeatures:startDate:endDate:createBucketedFeatures:](RTPlaceDataMetrics, "calculateMLFeatures:startDate:endDate:createBucketedFeatures:", v87, v33, v32, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v85;
          -[RTLearnedPlaceTypeInferenceGenerator setPlaceStatsUUIDStringsToMLFeaturesMap:](v85, "setPlaceStatsUUIDStringsToMLFeaturesMap:", v34);

          -[RTLearnedPlaceTypeInferenceGenerator biomeManager](v85, "biomeManager");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = (void *)v33;
          v73 = v32;
          +[RTPlaceDataMetrics calculateMLFeaturesUsingBiomeManager:intervalDictionary:startDate:endDate:createBucketedFeatures:](RTPlaceDataMetrics, "calculateMLFeaturesUsingBiomeManager:intervalDictionary:startDate:endDate:createBucketedFeatures:", v36, v87, v33, v32, 1);
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          v91 = 0u;
          v92 = 0u;
          v89 = 0u;
          v90 = 0u;
          obj = v18;
          v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v107, 16);
          if (v37)
          {
            v38 = v37;
            v88 = 0;
            v86 = *(_QWORD *)v90;
            do
            {
              for (j = 0; j != v38; ++j)
              {
                if (*(_QWORD *)v90 != v86)
                  objc_enumerationMutation(obj);
                v40 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
                v41 = (void *)MEMORY[0x1D8231EA8]();
                -[RTLearnedPlaceTypeInferenceGenerator placeStatsUUIDStringsToMLFeaturesMap](v35, "placeStatsUUIDStringsToMLFeaturesMap");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "place");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "identifier");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "UUIDString");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "objectForKeyedSubscript:", v45);
                v46 = (void *)objc_claimAutoreleasedReturnValue();

                if (v46)
                {
                  -[RTLearnedPlaceTypeInferenceGenerator placeStatsUUIDStringsToMLFeaturesMap](v35, "placeStatsUUIDStringsToMLFeaturesMap");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "place");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "identifier");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "UUIDString");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "objectForKeyedSubscript:", v50);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "setMlFeatures:", v51);

                  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                  v52 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                  {
                    v54 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v54);
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(a2);
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTLearnedPlaceTypeInferenceGenerator placeStatsUUIDStringsToMLFeaturesMap](v85, "placeStatsUUIDStringsToMLFeaturesMap");
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "place");
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v81, "identifier");
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v79, "UUIDString");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v80, "objectForKeyedSubscript:", v78);
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "place");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v56, "identifier");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v57, "UUIDString");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v76, "objectForKeyedSubscript:", v58);
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138413314;
                    v98 = v83;
                    v99 = 2112;
                    v100 = v55;
                    v101 = 2112;
                    v102 = v40;
                    v103 = 2112;
                    v104 = (uint64_t)v77;
                    v105 = 2112;
                    v106 = v59;
                    _os_log_debug_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_DEBUG, "%@, %@, setting mlFeatures for placeStat, %@, mlFeatures, %@, biomeMLFeatures, %@", buf, 0x34u);

                  }
                  ++v88;
                  v35 = v85;
                }
                else
                {
                  v53 = (void *)objc_opt_new();
                  objc_msgSend(v40, "setMlFeatures:", v53);

                }
                objc_autoreleasePoolPop(v41);
              }
              v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v107, 16);
            }
            while (v38);
          }
          else
          {
            v88 = 0;
          }

          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            v61 = (objc_class *)objc_opt_class();
            NSStringFromClass(v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTLearnedPlaceTypeInferenceGenerator placeStats](v35, "placeStats");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v64, "count");
            *(_DWORD *)buf = 138413058;
            v98 = v62;
            v99 = 2112;
            v100 = v63;
            v101 = 2048;
            v102 = v88;
            v103 = 2048;
            v104 = v65;
            _os_log_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_INFO, "%@, %@, number of placeStats set with ML Features, %lu, total placeStats count, %lu", buf, 0x2Au);

          }
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v66 = objc_claimAutoreleasedReturnValue();
          v4 = v74;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
          {
            v67 = (objc_class *)objc_opt_class();
            NSStringFromClass(v67);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "timeIntervalSinceDate:", v75);
            *(_DWORD *)buf = 138412802;
            v98 = v68;
            v99 = 2112;
            v100 = v69;
            v101 = 2048;
            v102 = v71;
            _os_log_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_INFO, "--------->%@, %@, finished, latency, %.2f<---------", buf, 0x20u);

          }
          v31 = v87;
        }

        v7 = v75;
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v98 = v9;
        v99 = 2112;
        v100 = v10;
        v11 = "%@, %@, mlFeature are not set because PlaceTypeClassificationModel feature flag is not enabled";
        goto LABEL_10;
      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v98 = v9;
      v99 = 2112;
      v100 = v10;
      v11 = "%@, %@, mlFeature are not set because device is not supported";
      goto LABEL_10;
    }
  }

}

- (RTBiomeManager)biomeManager
{
  return self->_biomeManager;
}

- (void)setBiomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_biomeManager, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void)setLearnedLocationStore:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationStore, a3);
}

- (RTPlaceTypeClassifierMetricsCalculator)placeTypeClassifierMetricsCalculator
{
  return self->_placeTypeClassifierMetricsCalculator;
}

- (void)setPlaceTypeClassifierMetricsCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_placeTypeClassifierMetricsCalculator, a3);
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (NSMutableArray)placeStats
{
  return self->_placeStats;
}

- (void)setPlaceStats:(id)a3
{
  objc_storeStrong((id *)&self->_placeStats, a3);
}

- (RTLearnedVisit)firstVisit
{
  return self->_firstVisit;
}

- (void)setFirstVisit:(id)a3
{
  objc_storeStrong((id *)&self->_firstVisit, a3);
}

- (RTLearnedVisit)lastVisit
{
  return self->_lastVisit;
}

- (void)setLastVisit:(id)a3
{
  objc_storeStrong((id *)&self->_lastVisit, a3);
}

- (NSDictionary)placeStatsUUIDStringsToMLFeaturesMap
{
  return self->_placeStatsUUIDStringsToMLFeaturesMap;
}

- (void)setPlaceStatsUUIDStringsToMLFeaturesMap:(id)a3
{
  objc_storeStrong((id *)&self->_placeStatsUUIDStringsToMLFeaturesMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeStatsUUIDStringsToMLFeaturesMap, 0);
  objc_storeStrong((id *)&self->_lastVisit, 0);
  objc_storeStrong((id *)&self->_firstVisit, 0);
  objc_storeStrong((id *)&self->_placeStats, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_placeTypeClassifierMetricsCalculator, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_biomeManager, 0);
}

@end
