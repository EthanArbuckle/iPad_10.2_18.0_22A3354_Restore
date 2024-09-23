@implementation RTSettledStateMetrics

- (RTSettledStateMetrics)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithCurrentSettledStateTransition_nextSettledStateTransition_distanceTraveled_);
}

- (RTSettledStateMetrics)initWithCurrentSettledStateTransition:(id)a3 nextSettledStateTransition:(id)a4 distanceTraveled:(unint64_t)a5
{
  id v8;
  id v9;
  RTSettledStateMetrics *v10;
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
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)RTSettledStateMetrics;
  v10 = -[RTMetric init](&v22, sel_init);
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = (void *)objc_opt_class();
    objc_msgSend(v9, "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", v14);
    objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "bucketForDurationLength:"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v10, "metrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("DurationLength"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "transitionToType") == 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v10, "metrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("IsSettledState"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "bucketForDistanceTraveled:", (double)a5));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v10, "metrics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("DistanceTraveledAfterEnteringState"));

  }
  return v10;
}

+ (id)supportedMetricKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("DurationLength"), CFSTR("IsSettledState"), CFSTR("DistanceTraveledAfterEnteringState"), 0);
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)RTAnalyticsEventSettledStateMetrics;
}

+ (id)binsForDistanceTraveled
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)binsForDistanceTraveled_binsForDistanceTraveled;
  if (!binsForDistanceTraveled_binsForDistanceTraveled)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E932C0E8);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)binsForDistanceTraveled_binsForDistanceTraveled;
    binsForDistanceTraveled_binsForDistanceTraveled = v3;

    v2 = (void *)binsForDistanceTraveled_binsForDistanceTraveled;
  }
  return v2;
}

+ (unint64_t)bucketForDistanceTraveled:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTSettledStateMetrics binsForDistanceTraveled](RTSettledStateMetrics, "binsForDistanceTraveled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "binForNumber:bins:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
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

  v2 = (void *)binsForDuration_binsForDuration;
  if (!binsForDuration_binsForDuration)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E932C100);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)binsForDuration_binsForDuration;
    binsForDuration_binsForDuration = v3;

    v5 = 23;
    v6 = 3600;
    do
    {
      v7 = (void *)binsForDuration_binsForDuration;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

      v6 += 3600;
      --v5;
    }
    while (v5);
    v9 = 4;
    v10 = 86400;
    do
    {
      v11 = (void *)binsForDuration_binsForDuration;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

      v10 += 86400;
      --v9;
    }
    while (v9);
    v2 = (void *)binsForDuration_binsForDuration;
  }
  return v2;
}

+ (unint64_t)bucketForDurationLength:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTSettledStateMetrics binsForDuration](RTSettledStateMetrics, "binsForDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "binForNumber:bins:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

+ (id)createSettledStateMetricsForNewSettledStateTransition:(id)a3 settledStateTransitionStore:(id)a4 locationStore:(id)a5
{
  id v7;
  id v8;
  id v9;
  RTStoredSettledStateTransitionEnumerationOptions *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  RTStoredSettledStateTransitionEnumerationOptions *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  RTSettledStateMetrics *v19;
  void *v21;
  uint64_t v22;
  RTLocationStoreMetricOptions *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  RTSettledStateMetrics *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  _QWORD v33[5];
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  __int128 buf;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = [RTStoredSettledStateTransitionEnumerationOptions alloc];
  v11 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v12, v13);
  v15 = -[RTStoredSettledStateTransitionEnumerationOptions initWithAscending:dateInterval:limit:batchSize:](v10, "initWithAscending:dateInterval:limit:batchSize:", 0, v14, &unk_1E9326B40, 1);

  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__21;
  v48 = __Block_byref_object_dispose__21;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__21;
  v42 = __Block_byref_object_dispose__21;
  v16 = MEMORY[0x1E0C809B0];
  v43 = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __121__RTSettledStateMetrics_createSettledStateMetricsForNewSettledStateTransition_settledStateTransitionStore_locationStore___block_invoke;
  v34[3] = &unk_1E9299670;
  v36 = &v44;
  v17 = v7;
  v35 = v17;
  v37 = &v38;
  objc_msgSend(v8, "enumerateStoredSettledStateTransitionsWithOptions:enumerationBlock:", v15, v34);
  if (v45[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    v32 = v45[5];
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v32;
    v29 = "Error fetching settledStateTransitions: %@";
    v30 = v18;
    v31 = 12;
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, v29, (uint8_t *)&buf, v31);
    goto LABEL_3;
  }
  v21 = (void *)v39[5];
  if (!v21)
  {
    v19 = 0;
    goto LABEL_5;
  }
  v22 = objc_msgSend(v21, "transitionToType");
  if (v22 == objc_msgSend(v17, "transitionFromType"))
  {
    v23 = [RTLocationStoreMetricOptions alloc];
    v24 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend((id)v39[5], "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v24, "initWithStartDate:endDate:", v25, v26);
    v18 = -[RTLocationStoreMetricOptions initWithDateInterval:uncertaintyThreshold:](v23, "initWithDateInterval:uncertaintyThreshold:", v27, 2500.0);

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v51 = 0x2020000000;
    v52 = 0;
    v33[0] = v16;
    v33[1] = 3221225472;
    v33[2] = __121__RTSettledStateMetrics_createSettledStateMetricsForNewSettledStateTransition_settledStateTransitionStore_locationStore___block_invoke_31;
    v33[3] = &unk_1E9299698;
    v33[4] = &buf;
    objc_msgSend(v9, "fetchMetricsWithOptions:handler:", v18, v33);
    v28 = [RTSettledStateMetrics alloc];
    v19 = -[RTSettledStateMetrics initWithCurrentSettledStateTransition:nextSettledStateTransition:distanceTraveled:](v28, "initWithCurrentSettledStateTransition:nextSettledStateTransition:distanceTraveled:", v39[5], v17, *(_QWORD *)(*((_QWORD *)&buf + 1) + 24));
    _Block_object_dispose(&buf, 8);
    goto LABEL_4;
  }
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    v29 = "latestStoredSettledStateTransition.transitionToType and newSettledStateTransition.transitionFromType are of di"
          "fferent type, something was missed!";
    v30 = v18;
    v31 = 2;
    goto LABEL_13;
  }
LABEL_3:
  v19 = 0;
LABEL_4:

LABEL_5:
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v19;
}

void __121__RTSettledStateMetrics_createSettledStateMetricsForNewSettledStateTransition_settledStateTransitionStore_locationStore___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  objc_msgSend(v7, "firstObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_3;
  v10 = (void *)v9;
  objc_msgSend(v7, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isBeforeDate:", v13);

  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412546;
      v23 = v19;
      v24 = 2112;
      v25 = v21;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "New settledStateTransition: %@ isOnOrBefore a stored settledStateTransition: %@", (uint8_t *)&v22, 0x16u);

    }
  }
  else
  {
LABEL_3:
    objc_msgSend(v7, "firstObject");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
  *a4 = 1;

}

uint64_t __121__RTSettledStateMetrics_createSettledStateMetricsForNewSettledStateTransition_settledStateTransitionStore_locationStore___block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t result;
  double v4;

  result = objc_msgSend(a2, "distanceTraveled");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (unint64_t)v4;
  return result;
}

+ (void)submitSettledStateMetricsForSettledStateTransition:(id)a3 settledStateTransitionStore:(id)a4 locationStore:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "createSettledStateMetricsForNewSettledStateTransition:settledStateTransitionStore:locationStore:", v9, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = 0;
    objc_msgSend(v10, "submitMetricsWithError:", &v11);
  }

}

- (double)distancetraveledAfterEnteringState
{
  return self->_distancetraveledAfterEnteringState;
}

- (void)setDistancetraveledAfterEnteringState:(double)a3
{
  self->_distancetraveledAfterEnteringState = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)isSettledState
{
  return self->_isSettledState;
}

- (void)setIsSettledState:(BOOL)a3
{
  self->_isSettledState = a3;
}

@end
