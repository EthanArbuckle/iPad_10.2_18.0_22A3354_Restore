@implementation RTSensitiveDateClassifierMetrics

- (RTSensitiveDateClassifierMetrics)init
{
  RTSensitiveDateClassifierMetrics *v2;
  RTSensitiveDateClassifierMetrics *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTSensitiveDateClassifierMetrics;
  v2 = -[RTSensitiveDateClassifierMetrics init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[RTSensitiveDateClassifierMetrics setup](v2, "setup");
  return v3;
}

- (void)setup
{
  NSDate *v3;
  NSDate *startDate;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startDate = self->_startDate;
  self->_startDate = v3;

  self->_currentLocationSignalEnvironmentType = 0;
  *(_OWORD *)&self->_lookbackWindowCategory = xmmword_1D1EED330;
  *(_OWORD *)&self->_parkedCarSignalAvailability = xmmword_1D1EED340;
}

- (void)processSignal:(int64_t)a3 date:(id)a4
{
  NSDate *gatingSignalDate;
  id v8;

  v8 = a4;
  if (a3 == 4)
    -[RTSensitiveDateClassifierMetrics setParkedCarSignalAvailability:](self, "setParkedCarSignalAvailability:", 1);
  gatingSignalDate = self->_gatingSignalDate;
  if (!gatingSignalDate || -[NSDate compare:](gatingSignalDate, "compare:", v8) == NSOrderedAscending)
  {
    objc_storeStrong((id *)&self->_gatingSignalDate, a4);
    self->_lookbackWindowCategory = a3;
  }

}

- (void)addCurrentLocation:(id)a3 fromSource:(int64_t)a4
{
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v6 = a3;
  if (v6)
  {
    -[RTSensitiveDateClassifierMetrics setCurrentLocationAvailability:](self, "setCurrentLocationAvailability:", a4);
    -[RTSensitiveDateClassifierMetrics setCurrentLocationSignalEnvironmentType:](self, "setCurrentLocationSignalEnvironmentType:", objc_msgSend(v6, "signalEnvironmentType"));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", v8, 2u);
    }

  }
}

- (void)updateWifiAccessPointCount:(unint64_t)a3
{
  -[RTSensitiveDateClassifierMetrics setWifiAPCount:](self, "setWifiAPCount:", -[RTSensitiveDateClassifierMetrics wifiAPCount](self, "wifiAPCount") + a3);
}

- (id)collectMetricsWithLookbackWindowDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", self->_startDate);
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v5);
  v11 = v10;

  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[RTSensitiveDateClassifierMetrics lookbackWindowCategory](self, "lookbackWindowCategory"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("_category"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[RTSensitiveDateClassifierMetrics currentLocationAvailability](self, "currentLocationAvailability"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("_currentLocationAvailability"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[RTSensitiveDateClassifierMetrics currentLocationSignalEnvironmentType](self, "currentLocationSignalEnvironmentType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("_currentLocationSignalEnvironment"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("_latency"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[RTSensitiveDateClassifierMetrics parkedCarSignalAvailability](self, "parkedCarSignalAvailability"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("_parkedCarAvailability"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTSensitiveDateClassifierMetrics wifiAPCount](self, "wifiAPCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("_numWifiAccessPoints"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("_lookbackWindowDuration"));

  return v12;
}

- (void)submitMetricsWithLookbackWindowDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  -[RTSensitiveDateClassifierMetrics collectMetricsWithLookbackWindowDate:](self, "collectMetricsWithLookbackWindowDate:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)objc_msgSend(v3, "initWithCString:encoding:", RTAnalyticsEventSensitiveDateClassifierMetrics, 1);
  log_analytics_submission(v4, v6);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)gatingSignalDate
{
  return self->_gatingSignalDate;
}

- (void)setGatingSignalDate:(id)a3
{
  objc_storeStrong((id *)&self->_gatingSignalDate, a3);
}

- (int64_t)lookbackWindowCategory
{
  return self->_lookbackWindowCategory;
}

- (void)setLookbackWindowCategory:(int64_t)a3
{
  self->_lookbackWindowCategory = a3;
}

- (int64_t)currentLocationAvailability
{
  return self->_currentLocationAvailability;
}

- (void)setCurrentLocationAvailability:(int64_t)a3
{
  self->_currentLocationAvailability = a3;
}

- (int64_t)parkedCarSignalAvailability
{
  return self->_parkedCarSignalAvailability;
}

- (void)setParkedCarSignalAvailability:(int64_t)a3
{
  self->_parkedCarSignalAvailability = a3;
}

- (int)currentLocationSignalEnvironmentType
{
  return self->_currentLocationSignalEnvironmentType;
}

- (void)setCurrentLocationSignalEnvironmentType:(int)a3
{
  self->_currentLocationSignalEnvironmentType = a3;
}

- (unint64_t)wifiAPCount
{
  return self->_wifiAPCount;
}

- (void)setWifiAPCount:(unint64_t)a3
{
  self->_wifiAPCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatingSignalDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
