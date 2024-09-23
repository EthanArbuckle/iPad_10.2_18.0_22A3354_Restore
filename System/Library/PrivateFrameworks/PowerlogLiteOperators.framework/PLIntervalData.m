@implementation PLIntervalData

- (NSDate)currentInterval
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)submitIntervalData
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  NSDate *currentInterval;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSDate *v28;
  NSDate *v29;
  _QWORD block[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[PLIntervalData metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[PLIntervalData metrics](self, "metrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v32 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          -[PLIntervalData metrics](self, "metrics");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "constructMetricValueForInterval:", self->_currentInterval);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "metricValue"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "metricKey");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

          v15 = objc_msgSend(v12, "getBinnedMetricValue");
          v16 = objc_msgSend(v12, "bitPosition");
          currentInterval = self->_currentInterval;
          self->_aggdValue |= v15 << v16;
          objc_msgSend(v12, "updateMetricWithTimestamp:forEvent:withValue:", currentInterval, 2, 0);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v7);
    }

    -[NSDateFormatter stringFromDate:](self->_dateFormat, "stringFromDate:", self->_currentInterval);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.power.usagebitmap.interval"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v20 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__PLIntervalData_submitIntervalData__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v20;
      if (qword_1ED8836F0 != -1)
        dispatch_once(&qword_1ED8836F0, block);
      if (byte_1ED8836C4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ : %llu"), v19, self->_aggdValue);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lastPathComponent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIntervalData submitIntervalData]");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 360);

        PLLogCommon();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v21;
          _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    ADClientSetValueForScalarKey();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v18, "intValue"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("TimeInterval"));

    -[PLIntervalData submitToCA:](self, "submitToCA:", v4);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", self->_currentInterval, (double)self->_intervalDuration);
    v28 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v29 = self->_currentInterval;
    self->_currentInterval = v28;

    self->_aggdValue = 0;
  }
}

- (void)updateMetric:(id)a3 withTimestamp:(id)a4 forEvent:(signed __int16)a5 withValue:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _QWORD block[5];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[PLIntervalData metrics](self, "metrics");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PLIntervalData metrics](self, "metrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[PLIntervalData metrics](self, "metrics");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v18 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __64__PLIntervalData_updateMetric_withTimestamp_forEvent_withValue___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v18;
        if (qword_1ED8836E8 != -1)
          dispatch_once(&qword_1ED8836E8, block);
        if (byte_1ED8836C3)
        {
          v19 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v17, "metricKey");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("Updating Metric : %@ Time : %@ Event : %d Value : %d"), v20, v11, (int)v7, v6);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "lastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIntervalData updateMetric:withTimestamp:forEvent:withValue:]");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 326);

          PLLogCommon();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v21;
            _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      objc_msgSend(v17, "updateMetricWithTimestamp:forEvent:withValue:", v11, v7, v6);

    }
  }

}

- (NSMutableDictionary)metrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

id __29__PLIntervalData_submitToCA___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("TimeInterval");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("PowerlogInit");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("LockState");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __29__PLIntervalData_submitToCA___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[8];
  _QWORD v13[9];

  v13[8] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("TimeInterval");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = CFSTR("BatteryLevel");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v12[2] = CFSTR("ConnectedState");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  v12[3] = CFSTR("ChargingState");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v5;
  v12[4] = CFSTR("AdapterType");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v6;
  v12[5] = CFSTR("BatteryTemperature");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v7;
  v12[6] = CFSTR("ChargerCurrent");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v8;
  v12[7] = CFSTR("ChargerVoltage");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __29__PLIntervalData_submitToCA___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("TimeInterval");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("ScreenOnDuration");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("WakeDuration");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("AudioOnDuration");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)submitToCA:(id)a3
{
  id v3;
  id v4;
  id v5;

  v5 = a3;
  AnalyticsSendEventLazy();
  v4 = v5;
  AnalyticsSendEventLazy();
  v3 = v4;
  AnalyticsSendEventLazy();

}

- (PLIntervalData)init
{
  PLIntervalData *v3;
  PLIntervalData *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *metrics;
  NSDateFormatter *v7;
  NSDateFormatter *dateFormat;
  void *v9;
  objc_super v11;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PLIntervalData;
    v4 = -[PLIntervalData init](&v11, sel_init);
    if (v4)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      metrics = v4->_metrics;
      v4->_metrics = v5;

      v4->_aggdValue = 0;
      v7 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
      dateFormat = v4->_dateFormat;
      v4->_dateFormat = v7;

      -[NSDateFormatter setDateFormat:](v4->_dateFormat, "setDateFormat:", CFSTR("HHmm"));
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
      -[NSDateFormatter setLocale:](v4->_dateFormat, "setLocale:", v9);

    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)addMetric:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *metrics;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    objc_msgSend(v4, "metricKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v8;
    if (v5)
    {
      metrics = self->_metrics;
      objc_msgSend(v8, "metricKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](metrics, "setObject:forKey:", v8, v7);

      v4 = v8;
    }
  }

}

uint64_t __64__PLIntervalData_updateMetric_withTimestamp_forEvent_withValue___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8836C3 = result;
  return result;
}

- (void)resetMetrics
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PLIntervalData metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[PLIntervalData metrics](self, "metrics", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
          -[PLIntervalData metrics](self, "metrics");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "resetMetric");
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
}

uint64_t __36__PLIntervalData_submitIntervalData__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8836C4 = result;
  return result;
}

- (void)setMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setCurrentInterval:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)aggdValue
{
  return self->_aggdValue;
}

- (void)setAggdValue:(unint64_t)a3
{
  self->_aggdValue = a3;
}

- (NSDateFormatter)dateFormat
{
  return (NSDateFormatter *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDateFormat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int)intervalDuration
{
  return self->_intervalDuration;
}

- (void)setIntervalDuration:(int)a3
{
  self->_intervalDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormat, 0);
  objc_storeStrong((id *)&self->_currentInterval, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
