@implementation TIFeatureUsageMetricsCache

- (id)featureUsageMetricFromName:(id)a3 forContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *cachedMetrics;
  NSDictionary *defaultMetrics;
  NSMutableDictionary *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  -[TIFeatureUsageMetricsCache startOfDay](self, "startOfDay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", self->_queryEndDate) & 1) == 0)
  {
    cachedMetrics = self->_cachedMetrics;
    self->_cachedMetrics = 0;

    defaultMetrics = self->_defaultMetrics;
    self->_defaultMetrics = 0;

    self->_sufficientData = 1;
    objc_storeStrong((id *)&self->_queryEndDate, v8);
  }
  if (!self->_sufficientData)
    goto LABEL_14;
  v11 = self->_cachedMetrics;
  if (!v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
    v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("ignoreLastMigrationDate"));
    objc_msgSend(MEMORY[0x1E0DBDDC0], "sharedUserModelDataStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transientLastMigrationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate dateByAddingTimeInterval:](self->_queryEndDate, "dateByAddingTimeInterval:", -((double)(unint64_t)*MEMORY[0x1E0DBEAB8] * (double)(int)*MEMORY[0x1E0DBEB28]));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if ((v13 & 1) != 0)
    {
      self->_sufficientData = 1;
    }
    else
    {
      v18 = objc_msgSend(v16, "compare:", v15);
      self->_sufficientData = v18 != -1;
      if (v18 == -1)
        goto LABEL_9;
    }
    -[TIFeatureUsageMetricsCache loadMetricsFromUserModelDataStore:withContext:](self, "loadMetricsFromUserModelDataStore:withContext:", v14, v7);
LABEL_9:

    if (self->_sufficientData)
    {
      v11 = self->_cachedMetrics;
      goto LABEL_11;
    }
LABEL_14:
    if ((id)kFeatureStringTypingSpeed == v6)
      v21 = (void *)kFeatureStringTypingSpeedInsufficientData;
    else
      v21 = (void *)*MEMORY[0x1E0DBEAF8];
    v20 = v21;
    goto LABEL_18;
  }
LABEL_11:
  -[NSMutableDictionary objectForKey:](v11, "objectForKey:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    -[TIFeatureUsageMetricsCache defaultMetricsFromContext:](self, "defaultMetricsFromContext:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_cachedMetrics, "setObject:forKey:", v19, v7);
  }
  objc_msgSend(v19, "objectForKey:", v6);
  v20 = (id)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v20;
}

- (id)startOfDay
{
  NSDate *testingTimestamp;
  NSDate *v3;
  NSDate *v4;
  void *v5;
  void *v6;
  void *v7;

  testingTimestamp = self->_testingTimestamp;
  if (testingTimestamp)
  {
    v3 = testingTimestamp;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v6);

  objc_msgSend(v5, "startOfDayForDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (TIFeatureUsageMetricsCache)initWithInputMode:(id)a3 metricDescriptorRegistry:(id)a4
{
  id v7;
  id v8;
  TIFeatureUsageMetricsCache *v9;
  TIFeatureUsageMetricsCache *v10;
  NSDate *testingTimestamp;
  NSDate *queryEndDate;
  NSMutableDictionary *cachedMetrics;
  NSDictionary *defaultMetrics;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TIFeatureUsageMetricsCache;
  v9 = -[TIFeatureUsageMetricsCache init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inputMode, a3);
    objc_storeStrong((id *)&v10->_metricDescriptorRegistry, a4);
    testingTimestamp = v10->_testingTimestamp;
    v10->_testingTimestamp = 0;

    queryEndDate = v10->_queryEndDate;
    v10->_queryEndDate = 0;

    cachedMetrics = v10->_cachedMetrics;
    v10->_cachedMetrics = 0;

    defaultMetrics = v10->_defaultMetrics;
    v10->_defaultMetrics = 0;

    v10->_sufficientData = 1;
  }

  return v10;
}

- (void)loadMetricsFromUserModelDataStore:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *cachedMetrics;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  TIKBAnalyticsMetricsContext *v18;
  NSDictionary *v19;
  NSDictionary *defaultMetrics;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (NSMutableDictionary *)objc_opt_new();
  cachedMetrics = self->_cachedMetrics;
  self->_cachedMetrics = v8;

  +[TIKBUserModel userModelWithInputMode:userModelDataStore:metricDescriptorRegistry:fromDate:](TIKBUserModel, "userModelWithInputMode:userModelDataStore:metricDescriptorRegistry:fromDate:", self->_inputMode, v6, self->_metricDescriptorRegistry, self->_queryEndDate);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v10, "contexts", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[TIFeatureUsageMetricsCache metricsFromUserModel:withContext:](self, "metricsFromUserModel:withContext:", v10, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](self->_cachedMetrics, "setObject:forKey:", v17, v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  v18 = -[TIKBAnalyticsMetricsContext initWithInputLanguage:inputRegion:layoutName:keyboardType:userInterfaceIdiom:]([TIKBAnalyticsMetricsContext alloc], "initWithInputLanguage:inputRegion:layoutName:keyboardType:userInterfaceIdiom:", CFSTR("__fake"), CFSTR("__fake"), CFSTR("__fake"), 0, objc_msgSend(v7, "userInterfaceIdiom"));
  -[TIFeatureUsageMetricsCache metricsFromUserModel:withContext:](self, "metricsFromUserModel:withContext:", v10, v18);
  v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  defaultMetrics = self->_defaultMetrics;
  self->_defaultMetrics = v19;

}

- (id)metricsFromUserModel:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "valueForMetricWithName:withContext:", kCalcKeyboardFeatureUsage, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v8, kFeatureKeyboardUsage);

  objc_msgSend(v6, "valueForMetricWithName:withContext:", kCalcContinuousPathUsage, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v9, kFeatureContinuousPathUsage);

  objc_msgSend(v6, "valueForMetricWithName:withContext:", kCalcAutocorrectionUsage, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v10, kFeatureAutocorrectionUsage);

  objc_msgSend(v6, "valueForMetricWithName:withContext:", kCalcCandidateBarUsage, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v11, kFeatureCandidateBarUsage);

  objc_msgSend(v6, "valueForMetricWithName:withContext:", kCalcMultilingualUsage, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v12, kFeatureMultilingualUsage);

  objc_msgSend(v6, "valueForMetricWithName:withContext:", kFeatureFloatingKeyboardUsage, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v13, kFeatureFloatingKeyboardUsage);

  objc_msgSend(v6, "valueForMetricWithName:withContext:", kFeatureStringTypingSpeed, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setValue:forKey:", v14, kFeatureStringTypingSpeed);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)defaultMetricsFromContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSDictionary *v7;

  v4 = a3;
  if (objc_msgSend(v4, "userInterfaceIdiom") == 1
    && objc_msgSend(v4, "keyboardType") == 3
    && (-[NSDictionary objectForKey:](self->_defaultMetrics, "objectForKey:", kFeatureFloatingKeyboardUsage),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DBEB08]),
        v5,
        v6))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->_defaultMetrics);
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKey:](v7, "setObject:forKey:", *MEMORY[0x1E0DBEAF0], kFeatureFloatingKeyboardUsage);
  }
  else
  {
    v7 = self->_defaultMetrics;
  }

  return v7;
}

- (void)setTestingTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_testingTimestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultMetrics, 0);
  objc_storeStrong((id *)&self->_cachedMetrics, 0);
  objc_storeStrong((id *)&self->_queryEndDate, 0);
  objc_storeStrong((id *)&self->_testingTimestamp, 0);
  objc_storeStrong((id *)&self->_metricDescriptorRegistry, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

@end
