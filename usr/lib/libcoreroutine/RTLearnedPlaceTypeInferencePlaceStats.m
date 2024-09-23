@implementation RTLearnedPlaceTypeInferencePlaceStats

+ (id)visitsWithDwellTimeBetweenDateRange:(id)a3 start:(id)a4 end:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = a3;
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K <= %@ and %@ <= %K"), CFSTR("entryDate"), a5, a4, CFSTR("exitDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("entryDate"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingDescriptors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (double)extractTopMedianDwellTimeFromVisits:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
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
  double v29;
  double v30;
  unint64_t v31;
  double v32;
  void *v33;
  double v34;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setWeekOfYear:", -5);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v7;
  objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v7, v6, 0);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = v6;
  v38 = v3;
  v36 = (void *)v9;
  objc_msgSend((id)objc_opt_class(), "visitsWithDwellTimeBetweenDateRange:start:end:", v3, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v40 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v18, "exitDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "entryDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceDate:", v21);
        objc_msgSend(v19, "numberWithDouble:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v22);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortUsingDescriptors:", v24);

  objc_msgSend(v13, "lastObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "exitDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "entryDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "timeIntervalSinceDate:", v28);
  v30 = v29 / 604800.0;

  v31 = vcvtmd_u64_f64(v30 * 0.5);
  v32 = 0.0;
  if (objc_msgSend(v12, "count") > v31)
  {
    if (v31 <= 1)
    {
      if ((unint64_t)objc_msgSend(v12, "count") <= 2)
      {
        if (objc_msgSend(v12, "count"))
          v31 = objc_msgSend(v12, "count") - 1;
      }
      else
      {
        v31 = 2;
      }
    }
    objc_msgSend(v12, "objectAtIndex:", v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "doubleValue");
    v32 = v34;

  }
  return v32;
}

+ (id)extractDailyStatsFromVisits:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  RTLearnedPlaceTypeInferenceDailyStats *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *context;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v3;
  objc_msgSend(v5, "startOfDayForDate:", v3);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setWeekOfYear:", -5);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v7;
  objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v7, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setDay:", 1);
  objc_msgSend(v10, "setSecond:", -1);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v10;
  objc_msgSend(v11, "dateByAddingComponents:toDate:options:", v10, v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = (void *)objc_opt_new();
  objc_msgSend(v36, "setDay:", 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v37 = (void *)v6;
  if (objc_msgSend(v12, "compare:", v6) == -1)
  {
    do
    {
      v15 = v4;
      context = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend((id)objc_opt_class(), "visitsWithDwellTimeBetweenDateRange:start:end:", v38, v9, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v41;
        v20 = 0.0;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v41 != v19)
              objc_enumerationMutation(v16);
            v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(v22, "entryDate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "laterDate:", v9);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v22, "exitDate");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "earlierDate:", v12);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v26, "timeIntervalSinceDate:", v24);
            v20 = v20 + v27;

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        }
        while (v18);
      }
      else
      {
        v20 = 0.0;
      }
      v28 = -[RTLearnedPlaceTypeInferenceDailyStats initWithStart:end:visitCount:aggregateDwellTimeBetweenDateRange:]([RTLearnedPlaceTypeInferenceDailyStats alloc], "initWithStart:end:visitCount:aggregateDwellTimeBetweenDateRange:", v9, v12, objc_msgSend(v16, "count"), v20);
      if (v28)
        objc_msgSend(v35, "addObject:", v28);
      v4 = v15;
      objc_msgSend(*(id *)(v15 + 3400), "currentCalendar");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "dateByAddingComponents:toDate:options:", v36, v9, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(v15 + 3400), "currentCalendar");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "dateByAddingComponents:toDate:options:", v36, v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(context);
      v9 = v14;
      v12 = v13;
    }
    while (objc_msgSend(v13, "compare:", v37) == -1);
  }
  else
  {
    v13 = v12;
    v14 = v9;
  }

  return v35;
}

+ (id)extractWeeklyStatsFromDailyStats:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  RTLearnedPlaceTypeInferenceWeeklyStats *v8;
  void *v9;
  RTLearnedPlaceTypeInferenceWeeklyStats *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") >= 7)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = (void *)MEMORY[0x1D8231EA8]();
      v8 = [RTLearnedPlaceTypeInferenceWeeklyStats alloc];
      objc_msgSend(v3, "subarrayWithRange:", v5, 7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[RTLearnedPlaceTypeInferenceWeeklyStats initWithDailyStats:](v8, "initWithDailyStats:", v9);

      if (v10)
        objc_msgSend(v4, "addObject:", v10);

      objc_autoreleasePoolPop(v7);
      ++v6;
      v5 += 7;
    }
    while (v6 < objc_msgSend(v3, "count") / 7uLL);
  }

  return v4;
}

- (id)localDeviceVisitsForVisits:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  dispatch_semaphore_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  dispatch_time_t v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id obj;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *context;
  RTLearnedPlaceTypeInferencePlaceStats *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  NSObject *v56;
  uint64_t *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  _QWORD v68[3];
  _BYTE v69[128];
  uint64_t v70;
  uint8_t buf[16];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v52 = self;
  -[RTLearnedPlaceTypeInferencePlaceStats learnedLocationStore](self, "learnedLocationStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForObjectsFromCurrentDevice");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__160;
  v66 = __Block_byref_object_dispose__160;
  v67 = (id)objc_opt_new();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
  if (v6)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v48 = *(_QWORD *)v59;
    v46 = *MEMORY[0x1E0D18598];
    v47 = *MEMORY[0x1E0CB2D50];
    do
    {
      v50 = v6;
      v10 = 0;
      v11 = v7;
      v12 = v8;
      v13 = v9;
      do
      {
        if (*(_QWORD *)v59 != v48)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v10);
        context = (void *)MEMORY[0x1D8231EA8]();
        -[RTLearnedPlaceTypeInferencePlaceStats learnedLocationStore](v52, "learnedLocationStore");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "location");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "location");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "predicateForVisitsWithinDistance:location:", v17, 500.0);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        -[RTLearnedPlaceTypeInferencePlaceStats learnedLocationStore](v52, "learnedLocationStore");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "entryDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "dateByAddingTimeInterval:", -1800.0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "exitDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "dateByAddingTimeInterval:", 1800.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "predicateForVisitsFromEntryDate:exitDate:", v20, v22);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = (void *)MEMORY[0x1E0CB3528];
        v68[0] = v49;
        v68[1] = v54;
        v68[2] = v53;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "andPredicateWithSubpredicates:", v24);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = dispatch_semaphore_create(0);
        -[RTLearnedPlaceTypeInferencePlaceStats learnedLocationStore](v52, "learnedLocationStore");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __68__RTLearnedPlaceTypeInferencePlaceStats_localDeviceVisitsForVisits___block_invoke;
        v55[3] = &unk_1E9297010;
        v57 = &v62;
        v27 = v25;
        v56 = v27;
        objc_msgSend(v26, "fetchVisitsWithPredicate:handler:", v7, v55);

        v28 = v27;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = dispatch_time(0, 3600000000000);
        if (dispatch_semaphore_wait(v28, v30))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "timeIntervalSinceDate:", v29);
          v33 = v32;
          v34 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_431);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "filteredArrayUsingPredicate:", v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "firstObject");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v34, "submitToCoreAnalytics:type:duration:", v38, 1, v33);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
          }

          v40 = (void *)MEMORY[0x1E0CB35C8];
          v70 = v47;
          *(_QWORD *)buf = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v70, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "errorWithDomain:code:userInfo:", v46, 15, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
        }

        objc_autoreleasePoolPop(context);
        ++v10;
        v11 = v7;
        v8 = v53;
        v9 = v54;
        v12 = v53;
        v13 = v54;
      }
      while (v50 != v10);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
    }
    while (v6);

  }
  else
  {
    v53 = 0;
    v54 = 0;
  }

  v43 = (id)v63[5];
  _Block_object_dispose(&v62, 8);

  return v43;
}

void __68__RTLearnedPlaceTypeInferencePlaceStats_localDeviceVisitsForVisits___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", a2);
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "Error was issued during fetching visits from store. Error: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (RTLearnedPlaceTypeInferencePlaceStats)initWithLearnedLocationStore:(id)a3 place:(id)a4 visits:(id)a5
{
  id v9;
  id v10;
  id v11;
  RTLearnedPlaceTypeInferencePlaceStats *v12;
  RTLearnedPlaceTypeInferencePlaceStats *v13;
  NSDictionary *mlFeatures;
  uint64_t v15;
  double v16;
  RTLearnedPlaceTypeInferenceStats *v17;
  RTLearnedPlaceTypeInferenceStats *stats;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  NSObject *v38;
  char *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  const char *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  RTLearnedPlaceTypeInferencePlaceStats *v54;
  NSArray *visitIntervals;
  NSArray *v56;
  void *v58;
  void *v59;
  RTLearnedPlaceTypeInferencePlaceStats *v60;
  id v61;
  id v62;
  NSArray *v63;
  void *v64;
  id obj;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *context;
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  objc_super v77;
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  double v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  id v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v79 = "-[RTLearnedPlaceTypeInferencePlaceStats initWithLearnedLocationStore:place:visits:]";
      v80 = 1024;
      LODWORD(v81) = 415;
      _os_log_error_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place (in %s:%d)", buf, 0x12u);
    }

    v54 = 0;
    goto LABEL_30;
  }
  v77.receiver = self;
  v77.super_class = (Class)RTLearnedPlaceTypeInferencePlaceStats;
  v12 = -[RTLearnedPlaceTypeInferencePlaceStats init](&v77, sel_init);
  v13 = v12;
  if (!v12)
    goto LABEL_29;
  objc_storeStrong((id *)&v12->_learnedLocationStore, a3);
  objc_storeStrong((id *)&v13->_place, a4);
  v13->_visitsCount = objc_msgSend(v11, "count");
  mlFeatures = v13->_mlFeatures;
  v13->_mlFeatures = 0;

  objc_msgSend((id)objc_opt_class(), "extractDailyStatsFromVisits:", v11);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "extractWeeklyStatsFromDailyStats:", v59);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "extractTopMedianDwellTimeFromVisits:", v11);
  v58 = (void *)v15;
  v17 = -[RTLearnedPlaceTypeInferenceStats initWithWeeklyStats:topMedianDwellTime:]([RTLearnedPlaceTypeInferenceStats alloc], "initWithWeeklyStats:topMedianDwellTime:", v15, v16);
  stats = v13->_stats;
  v13->_stats = v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v63 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "dateByAddingTimeInterval:", -3628800.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_opt_new();
  -[RTLearnedPlaceTypeInferencePlaceStats localDeviceVisitsForVisits:](v13, "localDeviceVisitsForVisits:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = objc_msgSend(v11, "count");
    v23 = objc_msgSend(v20, "count");
    *(_DWORD *)buf = 134218240;
    v79 = (const char *)v22;
    v80 = 2048;
    v81 = v23;
    _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "visits count, %lu, local device visits count, %lu", buf, 0x16u);
  }
  v60 = v13;
  v61 = v11;

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v20;
  v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
  v62 = v9;
  if (!v69)
  {
    v71 = 0;
    v24 = 0;
    goto LABEL_28;
  }
  v71 = 0;
  v24 = 0;
  v67 = *(_QWORD *)v74;
  do
  {
    for (i = 0; i != v69; ++i)
    {
      v26 = v24;
      v27 = v71;
      if (*(_QWORD *)v74 != v67)
        objc_enumerationMutation(obj);
      v28 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
      context = (void *)MEMORY[0x1D8231EA8]();
      v29 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v28, "entryDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "exitDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v29, "initWithStartDate:endDate:", v30, v31);

      objc_msgSend(v28, "location");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "location");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mapItem");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "location");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v71;
      objc_msgSend(v19, "distanceFromLocation:toLocation:error:", v33, v35, &v72);
      v37 = v36;
      v71 = v72;

      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "mapItem");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "location");
        v39 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "location");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "location");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "startDate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "endDate");
        v43 = v24;
        v44 = v19;
        v45 = v10;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138414082;
        v79 = v39;
        v80 = 2112;
        v81 = (uint64_t)v41;
        v82 = 2048;
        v83 = v37;
        v84 = 2112;
        v85 = v42;
        v86 = 2112;
        v87 = v46;
        v88 = 2112;
        v89 = v68;
        v90 = 2112;
        v91 = v64;
        v92 = 2112;
        v93 = v71;
        _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_INFO, "place location, %@, visit location, %@, distance from place to visit location, %.3f, visit interval start date, %@, visit interval end date, %@, earliestStartDate, %@, latestEndDate, %@, error, %@", buf, 0x52u);

        v10 = v45;
        v19 = v44;
        v24 = v43;

      }
      if (v37 <= 200.0)
      {
        objc_msgSend(v24, "endDate");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "compare:", v68);

        if (v52 != -1)
        {
          -[NSArray addObject:](v63, "addObject:", v24);
          v48 = context;
          goto LABEL_21;
        }
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = context;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v49 = v47;
          v50 = "Visit interval end date exceeded earliest start date. Skipping visit interval.";
          goto LABEL_19;
        }
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = context;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v49 = v47;
          v50 = "Distance from place to visit location exceeded threshold. Skipping visit interval.";
LABEL_19:
          _os_log_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_INFO, v50, buf, 2u);
        }
      }

LABEL_21:
      objc_autoreleasePoolPop(v48);
    }
    v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
  }
  while (v69);
LABEL_28:

  v13 = v60;
  visitIntervals = v60->_visitIntervals;
  v60->_visitIntervals = v63;
  v56 = v63;

  v11 = v61;
  v9 = v62;
LABEL_29:
  self = v13;
  v54 = self;
LABEL_30:

  return v54;
}

- (id)getMlFeatures
{
  NSDictionary *mlFeatures;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  mlFeatures = self->_mlFeatures;
  if (!mlFeatures)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[RTLearnedPlaceTypeInferencePlaceStats getMlFeatures]";
      v8 = 1024;
      v9 = 490;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "accessing mlFeatures before being set (in %s:%d)", (uint8_t *)&v6, 0x12u);
    }

    mlFeatures = self->_mlFeatures;
  }
  return mlFeatures;
}

- (void)log
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  RTLearnedPlaceTypeInferencePlaceStats *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v6, 0xCu);
  }

  -[RTLearnedPlaceTypeInferencePlaceStats stats](self, "stats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "weeklyStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_118);

}

void __44__RTLearnedPlaceTypeInferencePlaceStats_log__block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "weekly stat %lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTLearnedPlaceTypeInferencePlaceStats place](self, "place");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RTLearnedPlaceTypeInferencePlaceStats visitsCount](self, "visitsCount");
  -[RTLearnedPlaceTypeInferencePlaceStats stats](self, "stats");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("place, %@, visits, %lu, stats, %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (RTLearnedPlaceTypeInferenceStats)stats
{
  return self->_stats;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void)setLearnedLocationStore:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationStore, a3);
}

- (RTLearnedPlace)place
{
  return self->_place;
}

- (void)setPlace:(id)a3
{
  objc_storeStrong((id *)&self->_place, a3);
}

- (unint64_t)visitsCount
{
  return self->_visitsCount;
}

- (void)setVisitsCount:(unint64_t)a3
{
  self->_visitsCount = a3;
}

- (NSArray)visitIntervals
{
  return self->_visitIntervals;
}

- (void)setVisitIntervals:(id)a3
{
  objc_storeStrong((id *)&self->_visitIntervals, a3);
}

- (NSDictionary)mlFeatures
{
  return self->_mlFeatures;
}

- (void)setMlFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_mlFeatures, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mlFeatures, 0);
  objc_storeStrong((id *)&self->_visitIntervals, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_stats, 0);
}

@end
