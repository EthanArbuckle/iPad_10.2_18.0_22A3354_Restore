@implementation RTLocationAwarenessMetrics

- (AWDCoreRoutineLocationAwarenessLocationTimeHistograms)timeHistograms
{
  return self->_timeHistograms;
}

- (AWDCoreRoutineLocationAwarenessIntervalHistogram)intervalHistogram
{
  return self->_intervalHistogram;
}

- (AWDCoreRoutineLocationAwarenessStatistics)heartbeatStats
{
  return self->_heartbeatStats;
}

- (RTLocationAwarenessMetrics)initWithStartTimestamp:(id)a3 heartbeatStats:(id)a4 timeHistograms:(id)a5 intervalHistogram:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  RTLocationAwarenessMetrics *v18;
  RTLocationAwarenessMetrics *v19;
  uint64_t v20;
  NSDate *startTimestamp;
  uint64_t v22;
  AWDCoreRoutineLocationAwarenessStatistics *heartbeatStats;
  uint64_t v24;
  AWDCoreRoutineLocationAwarenessLocationTimeHistograms *timeHistograms;
  uint64_t v26;
  AWDCoreRoutineLocationAwarenessIntervalHistogram *intervalHistogram;
  objc_super v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[RTLocationAwarenessMetrics initWithStartTimestamp:heartbeatStats:timeHistograms:intervalHistogram:]";
      v32 = 1024;
      v33 = 329;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startTimestamp (in %s:%d)", buf, 0x12u);
    }

    if (v11)
    {
LABEL_3:
      if (v12)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[RTLocationAwarenessMetrics initWithStartTimestamp:heartbeatStats:timeHistograms:intervalHistogram:]";
    v32 = 1024;
    v33 = 330;
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: heartbeatStats (in %s:%d)", buf, 0x12u);
  }

  if (v12)
  {
LABEL_4:
    if (v13)
      goto LABEL_18;
    goto LABEL_15;
  }
LABEL_12:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[RTLocationAwarenessMetrics initWithStartTimestamp:heartbeatStats:timeHistograms:intervalHistogram:]";
    v32 = 1024;
    v33 = 331;
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: timeHistograms (in %s:%d)", buf, 0x12u);
  }

  if (!v13)
  {
LABEL_15:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[RTLocationAwarenessMetrics initWithStartTimestamp:heartbeatStats:timeHistograms:intervalHistogram:]";
      v32 = 1024;
      v33 = 332;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: intervalHistogram (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_18:
  v29.receiver = self;
  v29.super_class = (Class)RTLocationAwarenessMetrics;
  v18 = -[RTLocationAwarenessMetrics init](&v29, sel_init);
  v19 = v18;
  if (v13 && v12 && v11 && v10 && v18)
  {
    v20 = objc_msgSend(v10, "copy");
    startTimestamp = v19->_startTimestamp;
    v19->_startTimestamp = (NSDate *)v20;

    v22 = objc_msgSend(v11, "copy");
    heartbeatStats = v19->_heartbeatStats;
    v19->_heartbeatStats = (AWDCoreRoutineLocationAwarenessStatistics *)v22;

    v24 = objc_msgSend(v12, "copy");
    timeHistograms = v19->_timeHistograms;
    v19->_timeHistograms = (AWDCoreRoutineLocationAwarenessLocationTimeHistograms *)v24;

    v26 = objc_msgSend(v13, "copy");
    intervalHistogram = v19->_intervalHistogram;
    v19->_intervalHistogram = (AWDCoreRoutineLocationAwarenessIntervalHistogram *)v26;

  }
  return v19;
}

- (RTLocationAwarenessMetrics)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  RTLocationAwarenessMetrics *v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetricManager metricForType:](RTMetricManager, "metricForType:", 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetricManager metricForType:](RTMetricManager, "metricForType:", 15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetricManager metricForType:](RTMetricManager, "metricForType:", 14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[RTLocationAwarenessMetrics initWithStartTimestamp:heartbeatStats:timeHistograms:intervalHistogram:](self, "initWithStartTimestamp:heartbeatStats:timeHistograms:intervalHistogram:", v3, v4, v5, v6);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[RTLocationAwarenessMetrics startTimestamp](self, "startTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetrics heartbeatStats](self, "heartbeatStats");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetrics timeHistograms](self, "timeHistograms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetrics intervalHistogram](self, "intervalHistogram");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithStartTimestamp:heartbeatStats:timeHistograms:intervalHistogram:", v5, v6, v7, v8);

  return v9;
}

- (NSDate)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setHeartbeatStats:(id)a3
{
  objc_storeStrong((id *)&self->_heartbeatStats, a3);
}

- (void)setTimeHistograms:(id)a3
{
  objc_storeStrong((id *)&self->_timeHistograms, a3);
}

- (void)setIntervalHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_intervalHistogram, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervalHistogram, 0);
  objc_storeStrong((id *)&self->_timeHistograms, 0);
  objc_storeStrong((id *)&self->_heartbeatStats, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
}

@end
