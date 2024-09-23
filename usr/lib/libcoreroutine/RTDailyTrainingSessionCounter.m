@implementation RTDailyTrainingSessionCounter

- (RTDailyTrainingSessionCounter)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_);
}

- (RTDailyTrainingSessionCounter)initWithDefaultsManager:(id)a3
{
  id v5;
  RTDailyTrainingSessionCounter *v6;
  RTDailyTrainingSessionCounter *v7;
  uint64_t v8;
  NSMutableArray *metrics;
  RTDailyTrainingSessionCounter *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)RTDailyTrainingSessionCounter;
    v6 = -[RTDailyTrainingSessionCounter init](&v13, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_defaultsManager, a3);
      v8 = objc_opt_new();
      metrics = v7->_metrics;
      v7->_metrics = (NSMutableArray *)v8;

    }
    self = v7;
    v10 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (void)reset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[RTDailyTrainingSessionCounter metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v9 = (id)objc_opt_new();
  -[RTDailyTrainingSessionCounter compoundKeyForMode:reason:](self, "compoundKeyForMode:reason:", 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", &unk_1E9329888, v4);

  -[RTDailyTrainingSessionCounter compoundKeyForMode:reason:](self, "compoundKeyForMode:reason:", 1, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", &unk_1E9329888, v5);

  -[RTDailyTrainingSessionCounter compoundKeyForMode:reason:](self, "compoundKeyForMode:reason:", 2, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", &unk_1E9329888, v6);

  -[RTDailyTrainingSessionCounter compoundKeyForMode:reason:](self, "compoundKeyForMode:reason:", 2, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", &unk_1E9329888, v7);

  -[RTDailyTrainingSessionCounter defaultsManager](self, "defaultsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("TrainDailyMetricsTrainingSessionCount"));

}

- (void)createMetrics
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[RTDailyTrainingSessionCounter defaultsManager](self, "defaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("TrainDailyMetricsTrainingSessionCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[RTDailyTrainingSessionCounter modeAndReasonFromCompoundKey:](self, "modeAndReasonFromCompoundKey:", v10, (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_opt_new();
        objc_msgSend(v11, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("trainingMode"));

        objc_msgSend(v11, "secondObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("trainingReason"));

        objc_msgSend(v13, "setObject:forKey:", v12, CFSTR("traningSessionCount"));
        -[RTDailyTrainingSessionCounter metrics](self, "metrics");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

}

- (BOOL)shouldSubmitMetrics
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[RTDailyTrainingSessionCounter defaultsManager](self, "defaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("LearnedLocationEngineTrainDailyMetricsSubmissonAttemptDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -90000.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isAfterDate:", v5);

  }
  else
  {
    v6 = 0;
  }
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "stringFromDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413314;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v13;
    v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, shouldSubmit, %@, current date, %@, last attempt date, %@", (uint8_t *)&v16, 0x34u);

  }
  return v6;
}

- (void)submitMetrics
{
  RTDailyTrainingSessionCounter *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  RTDailyTrainingSessionCounter *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v3 = self;
  v32 = *MEMORY[0x1E0C80C00];
  if (-[RTDailyTrainingSessionCounter shouldSubmitMetrics](self, "shouldSubmitMetrics"))
  {
    -[RTDailyTrainingSessionCounter createMetrics](v3, "createMetrics");
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTDailyTrainingSessionCounter metrics](v3, "metrics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v27 = v6;
      v28 = 2112;
      v29 = v7;
      v30 = 2112;
      v31 = v8;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, %@, submitting metrics, %@", buf, 0x20u);

    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = v3;
    -[RTDailyTrainingSessionCounter metrics](v3, "metrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
          v15 = objc_alloc(MEMORY[0x1E0CB3940]);
          v16 = (void *)objc_msgSend(v15, "initWithCString:encoding:", RTAnalyticsEventVisitTrainingDaily, 1);
          log_analytics_submission(v16, v14);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          AnalyticsSendEvent();

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    v3 = v20;
  }
  -[RTDailyTrainingSessionCounter reset](v3, "reset");
  -[RTDailyTrainingSessionCounter defaultsManager](v3, "defaultsManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("LearnedLocationEngineTrainDailyMetricsSubmissonAttemptDate"));

}

- (void)increaseCountForMode:(unint64_t)a3 reason:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  -[RTDailyTrainingSessionCounter defaultsManager](self, "defaultsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("TrainDailyMetricsTrainingSessionCount"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTDailyTrainingSessionCounter compoundKeyForMode:reason:](self, "compoundKeyForMode:reason:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    objc_msgSend(v8, "setObject:forKey:", &unk_1E9329888, v9);
  objc_msgSend(v8, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12 + 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v13, v9);

  -[RTDailyTrainingSessionCounter defaultsManager](self, "defaultsManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v8, CFSTR("TrainDailyMetricsTrainingSessionCount"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id obj;
  _QWORD v14[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[RTDailyTrainingSessionCounter metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("RTLearnedLocationEngineTrainDailyMetrics, %lu\n\n"), objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[RTDailyTrainingSessionCounter metrics](self, "metrics");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "allKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __44__RTDailyTrainingSessionCounter_description__block_invoke;
        v14[3] = &unk_1E92973B8;
        v14[4] = self;
        v11 = v5;
        v15 = v11;
        objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

        objc_msgSend(v11, "appendString:", CFSTR("\n\n"));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v5;
}

void __44__RTDailyTrainingSessionCounter_description__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@, "), v4, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendString:", v7);
}

- (id)compoundKeyForMode:(unint64_t)a3 reason:(unint64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu-%lu"), a3, a4);
}

- (id)modeAndReasonFromCompoundKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("-"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (int)objc_msgSend(v6, "intValue");

  objc_msgSend(v5, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (int)objc_msgSend(v8, "intValue");

  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138413058;
    v18 = v11;
    v19 = 2112;
    v20 = v4;
    v21 = 2048;
    v22 = v7;
    v23 = 2048;
    v24 = v9;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, compound key, %@, mode, %lu, reason, %lu", (uint8_t *)&v17, 0x2Au);

  }
  v12 = objc_alloc(MEMORY[0x1E0D18408]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithFirstObject:secondObject:", v13, v14);

  return v15;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (NSMutableArray)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
