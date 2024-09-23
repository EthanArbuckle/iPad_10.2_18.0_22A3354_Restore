@implementation RTVisitSettledStateMetrics

- (RTVisitSettledStateMetrics)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithCountOfSettledStateTransitions_duration_isVisit_timeSettled_);
}

+ (id)createVisitSettledStateMetricsForSettledStateTransitionStore:(id)a3 startDate:(id)a4 endDate:(id)a5 isVisit:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  RTStoredSettledStateTransitionEnumerationOptions *v16;
  void *v17;
  RTStoredSettledStateTransitionEnumerationOptions *v18;
  id v19;
  void *v20;
  double v21;
  RTVisitSettledStateMetrics *v22;
  uint64_t v23;
  RTVisitSettledStateMetrics *v24;
  _QWORD v26[9];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double *v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v6 = a6;
  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[RTVisitSettledStateMetrics createVisitSettledStateMetricsForSettledStateTransitionStore:sta"
                           "rtDate:endDate:isVisit:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 39;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: settledStateTransitionStore (in %s:%d)", buf, 0x12u);
    }

  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[RTVisitSettledStateMetrics createVisitSettledStateMetricsForSettledStateTransitionStore:sta"
                           "rtDate:endDate:isVisit:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 40;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate (in %s:%d)", buf, 0x12u);
    }

  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[RTVisitSettledStateMetrics createVisitSettledStateMetricsForSettledStateTransitionStore:sta"
                           "rtDate:endDate:isVisit:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 41;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate (in %s:%d)", buf, 0x12u);
    }

  }
  v16 = [RTStoredSettledStateTransitionEnumerationOptions alloc];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v11, v12);
  v18 = -[RTStoredSettledStateTransitionEnumerationOptions initWithAscending:dateInterval:limit:batchSize:](v16, "initWithAscending:dateInterval:limit:batchSize:", 1, v17, 0, 1);

  v37 = 0;
  v38 = (double *)&v37;
  v39 = 0x2020000000;
  v40 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v42 = __Block_byref_object_copy__142;
  v43 = __Block_byref_object_dispose__142;
  v19 = v11;
  v44 = v19;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__142;
  v31 = __Block_byref_object_dispose__142;
  v32 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __117__RTVisitSettledStateMetrics_createVisitSettledStateMetricsForSettledStateTransitionStore_startDate_endDate_isVisit___block_invoke;
  v26[3] = &unk_1E92A4078;
  v26[4] = &v33;
  v26[5] = buf;
  v26[6] = &v37;
  v26[7] = &v27;
  v26[8] = a2;
  objc_msgSend(v10, "enumerateStoredSettledStateTransitionsWithOptions:enumerationBlock:", v18, v26);
  if (objc_msgSend((id)v28[5], "transitionToType") == 2)
  {
    objc_msgSend((id)v28[5], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v20);
    v38[3] = v21 + v38[3];

  }
  v22 = [RTVisitSettledStateMetrics alloc];
  v23 = v34[3];
  objc_msgSend(v12, "timeIntervalSinceDate:", v19);
  v24 = -[RTVisitSettledStateMetrics initWithCountOfSettledStateTransitions:duration:isVisit:timeSettled:](v22, "initWithCountOfSettledStateTransitions:duration:isVisit:timeSettled:", v23, v6);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v37, 8);
  return v24;
}

void __117__RTVisitSettledStateMetrics_createVisitSettledStateMetricsForSettledStateTransitionStore_startDate_endDate_isVisit___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v7, "count");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v14, "transitionToType", (_QWORD)v27) == 2)
        {
          objc_msgSend(v14, "date");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v17 = *(void **)(v16 + 40);
          *(_QWORD *)(v16 + 40) = v15;
        }
        else
        {
          if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
            continue;
          if (objc_msgSend(v14, "transitionFromType") == 2)
          {
            objc_msgSend(v14, "date");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
            *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v19
                                                                        + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)
                                                                                                + 8)
                                                                                    + 24);

          }
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v17 = *(void **)(v20 + 40);
          *(_QWORD *)(v20 + 40) = 0;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v11);
  }

  objc_msgSend(v9, "lastObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v9, "lastObject");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

  }
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v26;
      v33 = 2112;
      v34 = v8;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "%@, RTSettledStateTransitions enumeration eror: %@", buf, 0x16u);

    }
    *a4 = 1;
  }

}

+ (void)submitVisitSettledStateMetricsForStartDate:(id)a3 endDate:(id)a4 isVisit:(BOOL)a5 settledStateTransitionStore:(id)a6
{
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[RTVisitSettledStateMetrics createVisitSettledStateMetricsForSettledStateTransitionStore:startDate:endDate:isVisit:](RTVisitSettledStateMetrics, "createVisitSettledStateMetricsForSettledStateTransitionStore:startDate:endDate:isVisit:", a6, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    objc_msgSend(v6, "submitMetricsWithError:", &v10);
    v8 = v10;
    if (v8)
    {
      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v8;
        _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Error submitting RTVisitSettledStateMetrics: %@", buf, 0xCu);
      }

    }
  }

}

+ (unint64_t)boundedIntegerMetricForCountOfSettledStateTransitions:(unint64_t)a3
{
  if (a3 >= 0x12C)
    return 300;
  else
    return a3;
}

+ (id)binsForDuration
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v2 = (void *)_binsForDuration;
  if (!_binsForDuration)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E932CAA8);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_binsForDuration;
    _binsForDuration = v3;

    v5 = 23;
    v6 = 3600;
    do
    {
      v7 = (void *)_binsForDuration;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

      v6 += 3600;
      --v5;
    }
    while (v5);
    v9 = 5;
    v10 = 86400;
    do
    {
      v11 = (void *)_binsForDuration;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

      v10 += 86400;
      --v9;
    }
    while (v9);
    v2 = (void *)_binsForDuration;
  }
  return v2;
}

+ (unint64_t)bucketForDuration:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTVisitSettledStateMetrics binsForDuration](RTVisitSettledStateMetrics, "binsForDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "binForNumber:bins:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

+ (unint64_t)boundedIntegerMetricPercentageOfTimeSettledForTimeSettled:(double)a3 overDuration:(double)a4
{
  NSObject *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a4 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "+[RTVisitSettledStateMetrics boundedIntegerMetricPercentageOfTimeSettledForTimeSettled:overDuration:]";
      v11 = 1024;
      v12 = 138;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: duration > 0 (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }

  }
  if (a3 < 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "+[RTVisitSettledStateMetrics boundedIntegerMetricPercentageOfTimeSettledForTimeSettled:overDuration:]";
      v11 = 1024;
      v12 = 139;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: timeSettled >= 0 (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }

  }
  return objc_msgSend((id)objc_opt_class(), "boundedIntegerMetricForPercentageOfTimeSettled:", vcvtad_u64_f64(a3 / a4 * 100.0));
}

+ (unint64_t)boundedIntegerMetricForPercentageOfTimeSettled:(unint64_t)a3
{
  if (a3 % 5 >= 3)
    return 5 * (a3 / 5) + 5;
  else
    return 5 * (a3 / 5);
}

- (RTVisitSettledStateMetrics)initWithCountOfSettledStateTransitions:(unint64_t)a3 duration:(double)a4 isVisit:(BOOL)a5 timeSettled:(double)a6
{
  _BOOL8 v7;
  RTVisitSettledStateMetrics *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v7 = a5;
  v20.receiver = self;
  v20.super_class = (Class)RTVisitSettledStateMetrics;
  v10 = -[RTMetric init](&v20, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "boundedIntegerMetricForCountOfSettledStateTransitions:", a3));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v10, "metrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("CountOfSettledStateChanges"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "bucketForDuration:", a4));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v10, "metrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("Duration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v10, "metrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("IsVisit"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "boundedIntegerMetricPercentageOfTimeSettledForTimeSettled:overDuration:", a6, a4));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v10, "metrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("PercentageOfTimeSettled"));

  }
  return v10;
}

+ (id)supportedMetricKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("CountOfSettledStateChanges"), CFSTR("Duration"), CFSTR("IsVisit"), CFSTR("PercentageOfTimeSettled"), 0);
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)RTAnalyticsEventVisitSettledStateMetrics;
}

@end
