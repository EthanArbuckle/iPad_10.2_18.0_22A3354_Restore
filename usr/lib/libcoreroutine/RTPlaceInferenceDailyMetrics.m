@implementation RTPlaceInferenceDailyMetrics

- (void)increaseCountForClientMappingIndex:(int)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[RTPlaceInferenceDailyMetrics getClientKeyForDefaultManager:](self, "getClientKeyForDefaultManager:", *(_QWORD *)&a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceDailyMetrics defaultsManager](self, "defaultsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  -[RTPlaceInferenceDailyMetrics defaultsManager](self, "defaultsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6 + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v9);

}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (id)getClientKeyForDefaultManager:(int)a3
{
  return (id)objc_msgSend(CFSTR("PlaceInferenceMetricsClientQueryCount"), "stringByAppendingFormat:", CFSTR("%d"), *(_QWORD *)&a3);
}

- (RTPlaceInferenceDailyMetrics)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_);
}

- (RTPlaceInferenceDailyMetrics)initWithDefaultsManager:(id)a3
{
  id v5;
  RTPlaceInferenceDailyMetrics *v6;
  RTPlaceInferenceDailyMetrics *v7;
  uint64_t v8;
  NSMutableDictionary *metrics;
  RTPlaceInferenceDailyMetrics *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)RTPlaceInferenceDailyMetrics;
    v6 = -[RTPlaceInferenceDailyMetrics init](&v13, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_defaultsManager, a3);
      v8 = objc_opt_new();
      metrics = v7->_metrics;
      v7->_metrics = (NSMutableDictionary *)v8;

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
  uint64_t v4;
  void *v5;
  void *v6;

  -[RTPlaceInferenceDailyMetrics metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v4 = 0;
  do
  {
    -[RTPlaceInferenceDailyMetrics defaultsManager](self, "defaultsManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceInferenceDailyMetrics getClientKeyForDefaultManager:](self, "getClientKeyForDefaultManager:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", &unk_1E9328988, v6);

    v4 = (v4 + 1);
  }
  while ((_DWORD)v4 != 20);
}

- (void)create
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = 0;
  do
  {
    -[RTPlaceInferenceDailyMetrics defaultsManager](self, "defaultsManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceInferenceDailyMetrics getClientKeyForDefaultManager:](self, "getClientKeyForDefaultManager:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceInferenceDailyMetrics metrics](self, "metrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceInferenceDailyMetrics getClientKeyForDailyMetrics:](self, "getClientKeyForDailyMetrics:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

    v3 = (v3 + 1);
  }
  while ((_DWORD)v3 != 20);
}

- (BOOL)shouldSubmit
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[RTPlaceInferenceDailyMetrics defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PlaceInferenceLastDailyMetricsSubmissionAttemptDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -90000.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isAfterDate:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)submit
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (-[RTPlaceInferenceDailyMetrics shouldSubmit](self, "shouldSubmit"))
  {
    -[RTPlaceInferenceDailyMetrics create](self, "create");
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    v4 = (void *)objc_msgSend(v3, "initWithCString:encoding:", RTAnalyticsEventPlaceInferenceQueryDaily, 1);
    -[RTPlaceInferenceDailyMetrics metrics](self, "metrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    log_analytics_submission(v4, v5);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceInferenceDailyMetrics metrics](self, "metrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
  -[RTPlaceInferenceDailyMetrics reset](self, "reset");
  -[RTPlaceInferenceDailyMetrics defaultsManager](self, "defaultsManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("PlaceInferenceLastDailyMetricsSubmissionAttemptDate"));

}

- (id)getClientKeyForDailyMetrics:(int)a3
{
  return (id)objc_msgSend(CFSTR("clientQueryCount"), "stringByAppendingFormat:", CFSTR("%d"), *(_QWORD *)&a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[RTPlaceInferenceDailyMetrics metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("RTPlaceInferenceDailyMetrics count, %lu"), objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTPlaceInferenceDailyMetrics metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__RTPlaceInferenceDailyMetrics_description__block_invoke;
  v12[3] = &unk_1E92973B8;
  v12[4] = self;
  v8 = v5;
  v13 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

void __43__RTPlaceInferenceDailyMetrics_description__block_invoke(uint64_t a1, void *a2)
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

- (NSMutableDictionary)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
