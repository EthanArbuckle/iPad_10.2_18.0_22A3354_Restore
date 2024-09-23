@implementation RTPointOfInterestMonitorDailyMetrics

- (RTPointOfInterestMonitorDailyMetrics)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_);
}

- (RTPointOfInterestMonitorDailyMetrics)initWithDefaultsManager:(id)a3
{
  id v5;
  RTPointOfInterestMonitorDailyMetrics *v6;
  RTPointOfInterestMonitorDailyMetrics *v7;
  uint64_t v8;
  NSMutableDictionary *metrics;
  RTPointOfInterestMonitorDailyMetrics *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)RTPointOfInterestMonitorDailyMetrics;
    v6 = -[RTPointOfInterestMonitorDailyMetrics init](&v13, sel_init);
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[RTPointOfInterestMonitorDailyMetrics metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[RTPointOfInterestMonitorDailyMetrics defaultsManager](self, "defaultsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &unk_1E93267B0, CFSTR("InstantPOIMetricsArrivalEventCount"));

  -[RTPointOfInterestMonitorDailyMetrics defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", &unk_1E93267B0, CFSTR("InstantPOIMetricsBuildingFenceSetupCount"));

  -[RTPointOfInterestMonitorDailyMetrics defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", &unk_1E93267B0, CFSTR("InstantPOIMetricsHighAccuracyLocationRequestCount"));

  -[RTPointOfInterestMonitorDailyMetrics defaultsManager](self, "defaultsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", &unk_1E93267B0, CFSTR("InstantPOIMetricsBluePOIQueryCount"));

  -[RTPointOfInterestMonitorDailyMetrics defaultsManager](self, "defaultsManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", &unk_1E93267B0, CFSTR("InstantPOIMetricsVisitCount"));

}

- (void)create
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  -[RTPointOfInterestMonitorDailyMetrics defaultsManager](self, "defaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("InstantPOIMetricsArrivalEventCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  -[RTPointOfInterestMonitorDailyMetrics defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("InstantPOIMetricsBuildingFenceSetupCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  -[RTPointOfInterestMonitorDailyMetrics defaultsManager](self, "defaultsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("InstantPOIMetricsHighAccuracyLocationRequestCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");

  -[RTPointOfInterestMonitorDailyMetrics defaultsManager](self, "defaultsManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("InstantPOIMetricsBluePOIQueryCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntValue");

  -[RTPointOfInterestMonitorDailyMetrics defaultsManager](self, "defaultsManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("InstantPOIMetricsVisitCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPointOfInterestMonitorDailyMetrics metrics](self, "metrics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("arrivalEventCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPointOfInterestMonitorDailyMetrics metrics](self, "metrics");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("buildingFenceSetupCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPointOfInterestMonitorDailyMetrics metrics](self, "metrics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("highAccuracyLocationRequestCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPointOfInterestMonitorDailyMetrics metrics](self, "metrics");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("bluePOIQueryCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  -[RTPointOfInterestMonitorDailyMetrics metrics](self, "metrics");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("visitCount"));

}

- (BOOL)shouldSubmit
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[RTPointOfInterestMonitorDailyMetrics defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("InstantPOILastDailyMetricsSubmissonAttemptDate"));
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

  if (-[RTPointOfInterestMonitorDailyMetrics shouldSubmit](self, "shouldSubmit"))
  {
    -[RTPointOfInterestMonitorDailyMetrics create](self, "create");
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    v4 = (void *)objc_msgSend(v3, "initWithCString:encoding:", RTAnalyticsEventPointOfInterestMonitorDaily, 1);
    -[RTPointOfInterestMonitorDailyMetrics metrics](self, "metrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    log_analytics_submission(v4, v5);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPointOfInterestMonitorDailyMetrics metrics](self, "metrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
  -[RTPointOfInterestMonitorDailyMetrics reset](self, "reset");
  -[RTPointOfInterestMonitorDailyMetrics defaultsManager](self, "defaultsManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("InstantPOILastDailyMetricsSubmissonAttemptDate"));

}

- (void)increaseCountForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  -[RTPointOfInterestMonitorDailyMetrics defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  -[RTPointOfInterestMonitorDailyMetrics defaultsManager](self, "defaultsManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, v4);

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
  -[RTPointOfInterestMonitorDailyMetrics metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("RTPointOfInterestMonitorDailyMetrics, %lu, "), objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTPointOfInterestMonitorDailyMetrics metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__RTPointOfInterestMonitorDailyMetrics_description__block_invoke;
  v12[3] = &unk_1E92973B8;
  v12[4] = self;
  v8 = v5;
  v13 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

void __51__RTPointOfInterestMonitorDailyMetrics_description__block_invoke(uint64_t a1, void *a2)
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

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
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
