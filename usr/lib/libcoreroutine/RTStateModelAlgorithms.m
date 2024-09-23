@implementation RTStateModelAlgorithms

+ (id)bucketizeDates:(id)a3 bucketInterval:(double)a4 latestDate:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "+[RTStateModelAlgorithms bucketizeDates:bucketInterval:latestDate:]";
      v46 = 1024;
      v47 = 30;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dates (in %s:%d)", buf, 0x12u);
    }

  }
  if (objc_msgSend(v7, "count"))
  {
    if (!v8)
    {
      objc_msgSend(v7, "valueForKeyPath:", CFSTR("@max.self"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v33 = v7;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v39;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v39 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v8, "timeIntervalSinceDate:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v15));
          v17 = v16;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)(v16 / a4));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            v19 = (void *)objc_opt_new();
            objc_msgSend(v10, "setObject:forKey:", v19, v18);
          }
          objc_msgSend(v19, "timeIntervalToLatestDateSum");
          objc_msgSend(v19, "setTimeIntervalToLatestDateSum:", v17 + v20);
          objc_msgSend(v19, "timeIntervalToLatestDateSum2");
          objc_msgSend(v19, "setTimeIntervalToLatestDateSum2:", v21 + v17 * v17);
          objc_msgSend(v19, "setNumOfDates:", objc_msgSend(v19, "numOfDates") + 1);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v13);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v22 = v10;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v35;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(v22, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v26));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "timeIntervalToLatestDateSum");
          v29 = v28 / (double)(int)objc_msgSend(v27, "numOfDates");
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v8, -v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setAverageDate:", v30);

          objc_msgSend(v27, "timeIntervalToLatestDateSum2");
          objc_msgSend(v27, "setStdDeviation:", sqrt(v31 / (double)(int)objc_msgSend(v27, "numOfDates") - v29 * v29));

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v24);
    }

    v7 = v33;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)adjustedDate:(id)a3 betweenMinDate:(id)a4 maxDate:(id)a5 strideDays:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "adjustedDate:betweenMinDate:maxDate:strideDays:outDeltaDays:", v11, v10, v9, a6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)adjustedDate:(id)a3 betweenMinDate:(id)a4 maxDate:(id)a5 strideDays:(unint64_t)a6 outDeltaDays:(int64_t *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  int v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v28 = 136315394;
      v29 = "+[RTStateModelAlgorithms adjustedDate:betweenMinDate:maxDate:strideDays:outDeltaDays:]";
      v30 = 1024;
      v31 = 88;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", (uint8_t *)&v28, 0x12u);
    }

    if (v12)
    {
LABEL_3:
      if (v13)
        goto LABEL_4;
LABEL_21:
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v28 = 136315394;
        v29 = "+[RTStateModelAlgorithms adjustedDate:betweenMinDate:maxDate:strideDays:outDeltaDays:]";
        v30 = 1024;
        v31 = 90;
        _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: maxDate (in %s:%d)", (uint8_t *)&v28, 0x12u);
      }
      v14 = 0;
      goto LABEL_30;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v28 = 136315394;
    v29 = "+[RTStateModelAlgorithms adjustedDate:betweenMinDate:maxDate:strideDays:outDeltaDays:]";
    v30 = 1024;
    v31 = 89;
    _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: minDate (in %s:%d)", (uint8_t *)&v28, 0x12u);
  }

  if (!v13)
    goto LABEL_21;
LABEL_4:
  v14 = 0;
  if (v11 && v12)
  {
    if (a6 <= 1)
      v15 = 1;
    else
      v15 = a6;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startOfDay");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startOfDay");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject components:fromDate:toDate:options:](v16, "components:fromDate:toDate:options:", 16, v17, v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "day");

    v21 = (v15 + v20 - 1) / v15 * v15;
    objc_msgSend(v11, "dateByAddingUnit:value:", 16, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isBeforeDate:", v12))
    {
      objc_msgSend(v22, "dateByAddingUnit:value:", 16, v15);
      v23 = objc_claimAutoreleasedReturnValue();

      v21 += v15;
      v22 = (void *)v23;
    }
    if (objc_msgSend(v22, "isBeforeDate:", v12))
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v28 = 136315394;
        v29 = "+[RTStateModelAlgorithms adjustedDate:betweenMinDate:maxDate:strideDays:outDeltaDays:]";
        v30 = 1024;
        v31 = 133;
        _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "How did this happen? (in %s:%d)", (uint8_t *)&v28, 0x12u);
      }

    }
    else if (objc_msgSend(v22, "isOnOrBefore:", v13))
    {
      if (a7)
        *a7 = v21;
      v14 = v22;
      goto LABEL_29;
    }
    v14 = 0;
LABEL_29:

LABEL_30:
  }

  return v14;
}

+ (id)adjustedDateInterval:(id)a3 betweenMinDate:(id)a4 maxDate:(id)a5 strideDays:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;

  v9 = a3;
  v21 = 0;
  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_opt_class();
  objc_msgSend(v9, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "adjustedDate:betweenMinDate:maxDate:strideDays:outDeltaDays:", v13, v11, v10, a6, &v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setDay:", v21);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dateByAddingComponents:toDate:options:", v15, v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    if ((objc_msgSend(v14, "isAfterDate:", v18) & 1) == 0)
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v14, v18);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (double)timeByAddingUnit:(unint64_t)a3 value:(int64_t)a4 toTime:(double)a5
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", a3, a4, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = v10;

  return v11;
}

@end
