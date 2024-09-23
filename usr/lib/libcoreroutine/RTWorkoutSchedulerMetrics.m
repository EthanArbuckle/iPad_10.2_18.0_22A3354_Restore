@implementation RTWorkoutSchedulerMetrics

+ (id)metricsTaskTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return CFSTR("RTWorkoutSchedulerMetricsTaskTypeUnknown");
  else
    return off_1E92A06F0[a3 - 1];
}

- (RTWorkoutSchedulerMetrics)initWithDefaultsManager:(id)a3
{
  id v4;
  void *v5;
  RTWorkoutSchedulerMetrics *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[RTWorkoutSchedulerMetrics initWithDefaultsManager:managedConfiguration:](self, "initWithDefaultsManager:managedConfiguration:", v4, v5);

  return v6;
}

- (RTWorkoutSchedulerMetrics)initWithDefaultsManager:(id)a3 managedConfiguration:(id)a4
{
  id v6;
  RTWorkoutSchedulerMetrics *v7;
  RTWorkoutSchedulerMetrics *v8;
  uint64_t v9;
  RTManagedConfiguration *managedConfiguration;
  RTWorkoutSchedulerMetrics *v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[16];

  v6 = a3;
  if (v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)RTWorkoutSchedulerMetrics;
    v7 = -[RTWorkoutSchedulerMetrics init](&v14, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_defaultsManager, a3);
      v9 = objc_opt_new();
      managedConfiguration = v8->_managedConfiguration;
      v8->_managedConfiguration = (RTManagedConfiguration *)v9;

      -[RTWorkoutSchedulerMetrics setup](v8, "setup");
    }
    self = v8;
    v11 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v11 = 0;
  }

  return v11;
}

- (void)setup
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_onDailyMetricNotification_, CFSTR("RTMetricManagerDailyMetricNotification"), 0);

  v4 = (id)objc_opt_new();
  -[RTWorkoutSchedulerMetrics setMetricsDictionary:](self, "setMetricsDictionary:", v4);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("RTMetricManagerDailyMetricNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)RTWorkoutSchedulerMetrics;
  -[RTWorkoutSchedulerMetrics dealloc](&v4, sel_dealloc);
}

- (void)incrementMetricDefaultForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  -[RTWorkoutSchedulerMetrics defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  -[RTWorkoutSchedulerMetrics defaultsManager](self, "defaultsManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, v4);

}

- (void)onDailyMetricNotification:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("RTMetricManagerDailyMetricNotification"));

  if ((v6 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v14;
      v17 = 2080;
      v18 = "-[RTWorkoutSchedulerMetrics onDailyMetricNotification:]";
      v19 = 1024;
      v20 = 111;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", (uint8_t *)&v15, 0x1Cu);

    }
  }
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("RTMetricManagerDailyMetricNotification"));

  if ((v9 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v13;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "unknown notification name, %@", (uint8_t *)&v15, 0xCu);

    }
    goto LABEL_12;
  }
  -[RTWorkoutSchedulerMetrics managedConfiguration](self, "managedConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isHealthDataSubmissionAllowed");

  if ((v11 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "Health Data Submission not allowed on this device.", (uint8_t *)&v15, 2u);
    }
LABEL_12:

    goto LABEL_13;
  }
  -[RTWorkoutSchedulerMetrics collectDailyMetrics](self, "collectDailyMetrics");
LABEL_13:

}

- (id)supportedTaskKeys
{
  return &unk_1E932C7C0;
}

- (void)collectDailyMetrics
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerMetricsIsDeviceEligibleKey"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isDeviceEligible"));

  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerMetricsIsDeviceEligibleKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "BOOLValue");

  if ((v4 & 1) != 0)
  {
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerMetricsMemoryFootprintDeferralDailyCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("memoryFootprintDeferralDailyCount"));

    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerMetricsBackoffTimerDeferralDailyCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("backoffTimerDeferralDailyCount"));

    -[RTWorkoutSchedulerMetrics supportedTaskKeys](self, "supportedTaskKeys");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          +[RTWorkoutSchedulerMetrics metricsTaskTypeToString:](RTWorkoutSchedulerMetrics, "metricsTaskTypeToString:", +[RTWorkoutSchedulerMetricsTask taskTypeForDefaultsKey:](RTWorkoutSchedulerMetricsTask, "taskTypeForDefaultsKey:", v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("taskType"));

          -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerMetricsIsDeviceEligibleKey"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isDeviceEligible"));

          -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("taskRunDailyCount"));

          }
          else
          {
            objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E9328520, CFSTR("taskRunDailyCount"));
          }
          -[RTWorkoutSchedulerMetrics submitDailyMetricsToCoreAnalytics:](self, "submitDailyMetricsToCoreAnalytics:", v3);
          -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", &unk_1E9328520, v12);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }
    v17 = (void *)objc_opt_new();
    -[RTWorkoutSchedulerMetrics setMetricsDictionary:](self, "setMetricsDictionary:", v17);

    -[RTWorkoutSchedulerMetrics defaultsManager](self, "defaultsManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", &unk_1E9328520, CFSTR("RTDefaultsWorkoutSchedulerMetricsBackoffTimerDeferralDailyCount"));

    -[RTWorkoutSchedulerMetrics defaultsManager](self, "defaultsManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", &unk_1E9328520, CFSTR("RTDefaultsWorkoutSchedulerMetricsMemoryFootprintDeferralDailyCount"));

  }
  else
  {
    -[RTWorkoutSchedulerMetrics submitDailyMetricsToCoreAnalytics:](self, "submitDailyMetricsToCoreAnalytics:", v3);
  }

}

- (void)startCollectMetricsTaskType:(unint64_t)a3 totalNAtStart:(int64_t)a4
{
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  RTWorkoutSchedulerMetricsTask *v16;
  RTWorkoutSchedulerMetricsTask *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  NSObject *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[RTWorkoutSchedulerMetrics managedConfiguration](self, "managedConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isHealthDataSubmissionAllowed");

  if ((v9 & 1) != 0)
  {
    +[RTWorkoutSchedulerMetrics metricsTaskTypeToString:](RTWorkoutSchedulerMetrics, "metricsTaskTypeToString:", a3);
    v10 = objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412802;
      v25 = v13;
      v26 = 2112;
      v27 = v14;
      v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, %@, %@", (uint8_t *)&v24, 0x20u);

    }
    -[RTWorkoutSchedulerMetrics metricsDictionary](self, "metricsDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v10);
    v16 = (RTWorkoutSchedulerMetricsTask *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v17 = [RTWorkoutSchedulerMetricsTask alloc];
      -[RTWorkoutSchedulerMetrics defaultsManager](self, "defaultsManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[RTWorkoutSchedulerMetricsTask initWithTaskType:defaultsManager:](v17, "initWithTaskType:defaultsManager:", a3, v18);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutSchedulerMetricsTask setTaskStart:](v16, "setTaskStart:", v19);

    +[RTRuntime footprint](RTRuntime, "footprint");
    -[RTWorkoutSchedulerMetricsTask setMemoryFootprintAtStart:](v16, "setMemoryFootprintAtStart:", (unint64_t)v20);
    -[RTWorkoutSchedulerMetrics defaultsManager](self, "defaultsManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerTopNWorkoutsKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutSchedulerMetricsTask setCurrentNAtStart:](v16, "setCurrentNAtStart:", objc_msgSend(v22, "unsignedIntegerValue"));

    -[RTWorkoutSchedulerMetricsTask setTotalNAtStart:](v16, "setTotalNAtStart:", a4);
    -[RTWorkoutSchedulerMetrics metricsDictionary](self, "metricsDictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", v16, v10);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "Health Data Submission not allowed on this device.", (uint8_t *)&v24, 2u);
    }
  }

}

- (void)stopCollectMetricsTaskType:(unint64_t)a3
{
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[RTWorkoutSchedulerMetrics managedConfiguration](self, "managedConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isHealthDataSubmissionAllowed");

  if ((v7 & 1) != 0)
  {
    +[RTWorkoutSchedulerMetrics metricsTaskTypeToString:](RTWorkoutSchedulerMetrics, "metricsTaskTypeToString:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, %@, %@", (uint8_t *)&v18, 0x20u);

    }
    -[RTWorkoutSchedulerMetrics metricsDictionary](self, "metricsDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTaskFinish:", v15);

    +[RTRuntime footprint](RTRuntime, "footprint");
    objc_msgSend(v14, "setMemoryFootprintAtFinish:", (unint64_t)v16);
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerTopNWorkoutsKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCurrentNAtFinish:", objc_msgSend(v17, "unsignedIntegerValue"));

    -[RTWorkoutSchedulerMetrics createTaskMetricsDictionary:](self, "createTaskMetricsDictionary:", v14);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "Health Data Submission not allowed on this device.", (uint8_t *)&v18, 2u);
    }
  }

}

- (void)createTaskMetricsDictionary:(id)a3
{
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
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
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
  id v32;

  v32 = a3;
  v4 = (void *)objc_opt_new();
  +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9328520, &unk_1E9328538, &unk_1E9328550);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9328520, &unk_1E9328568, &unk_1E9328550);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v32, "currentNAtStart"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("currentNAtStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v32, "currentNAtFinish"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("currentNAtFinish"));

  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerWorldBuildStartTimeKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerWorldBuildFinishTimeKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    && (objc_msgSend(MEMORY[0x1E0C99D68], "distantPast"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v12, "isEqualToDate:", v13),
        v13,
        (v14 & 1) == 0))
  {
    objc_msgSend(v12, "timeIntervalSinceDate:", v11);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v16, v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("worldBuildDuration"));

    v15 = MEMORY[0x1E0C9AAB0];
  }
  else
  {
    v15 = MEMORY[0x1E0C9AAA0];
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("worldBuildIsFinished"));
  objc_msgSend(v32, "taskFinish");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "taskStart");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceDate:", v19);
  v21 = v20;

  +[RTWorkoutSchedulerMetrics metricsTaskTypeToString:](RTWorkoutSchedulerMetrics, "metricsTaskTypeToString:", objc_msgSend(v32, "taskType"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("taskType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v23, v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("taskDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v32, "memoryFootprintAtStart"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v25, v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("memoryFootprintAtStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v32, "memoryFootprintAtFinish"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v27, v6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("memoryFootprintAtFinish"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v32, "totalNAtStart"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("totalNAtStart"));

  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerMetricsIsDeviceEligibleKey"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("isDeviceEligible"));

  objc_msgSend(v32, "setTaskRunDailyCount:", objc_msgSend(v32, "taskRunDailyCount") + 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v32, "taskRunDailyCount"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, CFSTR("taskRunDailyCount"));

  objc_msgSend(v32, "resetTaskState");
  -[RTWorkoutSchedulerMetrics submitTaskMetricsToCoreAnalytics:](self, "submitTaskMetricsToCoreAnalytics:", v4);

}

- (void)submitDailyMetricsToCoreAnalytics:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = [v3 alloc];
  v7 = (id)objc_msgSend(v5, "initWithCString:encoding:", RTAnalyticsEventWorkoutSchedulerDaily, 1);
  log_analytics_submission(v7, v4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)submitTaskMetricsToCoreAnalytics:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = [v3 alloc];
  v7 = (id)objc_msgSend(v5, "initWithCString:encoding:", RTAnalyticsEventWorkoutScheduler, 1);
  log_analytics_submission(v7, v4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (NSMutableDictionary)metricsDictionary
{
  return self->_metricsDictionary;
}

- (void)setMetricsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_metricsDictionary, a3);
}

- (unsigned)isDeviceEligible
{
  return self->_isDeviceEligible;
}

- (void)setIsDeviceEligible:(unsigned __int8)a3
{
  self->_isDeviceEligible = a3;
}

- (unint64_t)memoryFootprintDeferredSchedulerDailyCount
{
  return self->_memoryFootprintDeferredSchedulerDailyCount;
}

- (void)setMemoryFootprintDeferredSchedulerDailyCount:(unint64_t)a3
{
  self->_memoryFootprintDeferredSchedulerDailyCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsDictionary, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
