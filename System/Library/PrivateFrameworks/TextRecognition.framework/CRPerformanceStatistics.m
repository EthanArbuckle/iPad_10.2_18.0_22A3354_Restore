@implementation CRPerformanceStatistics

- (CRPerformanceStatistics)initWithName:(id)a3
{
  return -[CRPerformanceStatistics initWithName:measureRecentPeak:](self, "initWithName:measureRecentPeak:", a3, 0);
}

- (CRPerformanceStatistics)initWithName:(id)a3 measureRecentPeak:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  CRPerformanceStatistics *v8;
  void *v9;
  BOOL v10;
  objc_super v12;

  v4 = a4;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRPerformanceStatistics;
  v8 = -[CRPerformanceStatistics init](&v12, sel_init);
  if (v8)
  {
    v9 = (void *)objc_opt_new();
    -[CRPerformanceStatistics setMetrics:](v8, "setMetrics:", v9);

    objc_storeStrong((id *)&v8->_name, a3);
    v10 = v4
       && +[CRPerformanceStatistics _canEnableRecentPeakReset](CRPerformanceStatistics, "_canEnableRecentPeakReset");
    v8->_measureRecentPeak = v10;
    -[CRPerformanceStatistics _addMetricWithKey:name:unit:denominator:pcMetricID:](v8, "_addMetricWithKey:name:unit:denominator:pcMetricID:", CFSTR("CRPerformanceMetricExecutionTime"), CFSTR("Execution Time"), CFSTR("ms"), 0, 1.0);
    -[CRPerformanceStatistics _addMetricWithKey:name:unit:denominator:pcMetricID:](v8, "_addMetricWithKey:name:unit:denominator:pcMetricID:", CFSTR("CRPerformanceMetricCPUTime"), CFSTR("CPU Time"), CFSTR("ms"), 0x63707574696D6500, 1000000.0);
    -[CRPerformanceStatistics _addMetricWithKey:name:unit:denominator:pcMetricID:](v8, "_addMetricWithKey:name:unit:denominator:pcMetricID:", CFSTR("CRPerformanceMetricLifetimeMemPeak"), CFSTR("Lifetime Mem Peak"), CFSTR("MB"), 0x6C6966657065616BLL, 1000.0);
    -[CRPerformanceStatistics _addMetricWithKey:name:unit:denominator:pcMetricID:](v8, "_addMetricWithKey:name:unit:denominator:pcMetricID:", CFSTR("CRPerformanceMetricDeltaMem"), CFSTR("Delta Mem"), CFSTR("MB"), 0x6D656D64656C7461, 1000.0);
    if (v8->_measureRecentPeak)
    {
      -[CRPerformanceStatistics _addMetricWithKey:name:unit:denominator:pcMetricID:](v8, "_addMetricWithKey:name:unit:denominator:pcMetricID:", CFSTR("CRPerformanceMetricDeltaMemPeak"), CFSTR("Delta Mem Peak"), CFSTR("MB"), 0x7065616B646C7461, 1000.0);
      -[CRPerformanceStatistics _addMetricWithKey:name:unit:denominator:pcMetricID:](v8, "_addMetricWithKey:name:unit:denominator:pcMetricID:", CFSTR("CRPerformanceMetricRecentMemPeak"), CFSTR("Recent Mem Peak"), CFSTR("MB"), 0x72636E747065616BLL, 1000.0);
    }
  }

  return v8;
}

- (CRPerformanceStatistics)initWithStatistics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRPerformanceStatistics *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = -[CRPerformanceStatistics initWithName:measureRecentPeak:](self, "initWithName:measureRecentPeak:", v6, objc_msgSend(v4, "measureRecentPeak"));

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v4, "metrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithDictionary:copyItems:", v9, 1);
    -[CRPerformanceStatistics setMetrics:](v7, "setMetrics:", v10);

  }
  return v7;
}

- (CRPerformanceStatistics)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  CRPerformanceStatistics *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("CRPerformanceStatisticsName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("CRPerformanceMetricMeasureRecentPeak"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "BOOLValue"))
    v7 = +[CRPerformanceStatistics _canEnableRecentPeakReset](CRPerformanceStatistics, "_canEnableRecentPeakReset");
  else
    v7 = 0;

  v8 = -[CRPerformanceStatistics initWithName:measureRecentPeak:](self, "initWithName:measureRecentPeak:", v5, v7);
  if (v8)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CRPerformanceStatisticsMetrics"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__CRPerformanceStatistics_initWithDictionary___block_invoke;
    v13[3] = &unk_1E98DBBE8;
    v14 = v10;
    v11 = v10;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v13);
    -[CRPerformanceStatistics setMetrics:](v8, "setMetrics:", v11);

  }
  return v8;
}

void __46__CRPerformanceStatistics_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CRPerformanceMetric *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[CRPerformanceMetric initWithDictionary:key:]([CRPerformanceMetric alloc], "initWithDictionary:key:", v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__21;
  v16 = __Block_byref_object_dispose__21;
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CRPerformanceStatistics name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRPerformanceStatistics metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n===========%@ (# Samples = %ld)===========\n"), v4, objc_msgSend(v7, "numSamples"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[CRPerformanceStatistics metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__CRPerformanceStatistics_description__block_invoke;
  v11[3] = &unk_1E98DBC10;
  v11[4] = &v12;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __38__CRPerformanceStatistics_description__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  if (objc_msgSend(v19, "numSamples") >= 1)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v19, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "unit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" (%@)"), v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "cStringUsingEncoding:", 4);
    objc_msgSend(v19, "mean");
    v10 = v9;
    objc_msgSend(v19, "stdDev");
    v12 = v11;
    objc_msgSend(v19, "first");
    v14 = v13;
    objc_msgSend(v19, "max");
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("%*s: %.3f (σ = %.3f | first = %.3f | max = %.3f)\n"), 22, v8, v10, v12, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
}

- (void)measureBlock:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void (**)(_QWORD))a3;
  v5 = pc_session_create();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processIdentifier");
  pc_session_set_procpid();

  if (self->_measureRecentPeak)
  {
    pc_session_add_metric();
    pc_session_add_metric();
  }
  v8 = (id)objc_opt_new();
  pc_session_begin();
  v4[2](v4);

  pc_session_end();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  -[CRPerformanceStatistics _evaluateEndedSession:duration:](self, "_evaluateEndedSession:duration:", v5);

  pc_session_destroy();
}

- (void)addStatistics:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__CRPerformanceStatistics_addStatistics___block_invoke;
  v5[3] = &unk_1E98DBC38;
  v5[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __41__CRPerformanceStatistics_addStatistics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mergeMetric:", v5);

  }
}

- (id)dictionary
{
  void *v3;
  void *v4;
  NSString *name;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("CRPerformanceStatisticsName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_measureRecentPeak);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("CRPerformanceMetricMeasureRecentPeak"));

  v7 = (void *)objc_opt_new();
  -[CRPerformanceStatistics metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__CRPerformanceStatistics_dictionary__block_invoke;
  v12[3] = &unk_1E98DBC38;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("CRPerformanceStatisticsMetrics"));
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __37__CRPerformanceStatistics_dictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "dictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (void)_addMetricWithKey:(id)a3 name:(id)a4 unit:(id)a5 denominator:(double)a6 pcMetricID:(unint64_t)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v12 = (void *)MEMORY[0x1E0C99E08];
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[CRPerformanceStatistics metrics](self, "metrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithDictionary:", v16);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (a7)
    +[CRPerformanceMetric pcMetricWithDisplayName:pcMetricID:unit:denominator:serializationKey:](CRPerformanceMetric, "pcMetricWithDisplayName:pcMetricID:unit:denominator:serializationKey:", v14, a7, v13, v15, a6);
  else
    +[CRPerformanceMetric metricWithDisplayName:unit:denominator:serializationKey:](CRPerformanceMetric, "metricWithDisplayName:unit:denominator:serializationKey:", v14, v13, v15, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, v15);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRPerformanceStatistics setMetrics:](self, "setMetrics:", v18);

}

- (void)_evaluateEndedSession:(pc_session *)a3 duration:(double)a4
{
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  -[CRPerformanceStatistics metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CRPerformanceMetricExecutionTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSample:", a4 * 1000.0);

  -[CRPerformanceStatistics metrics](self, "metrics");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__CRPerformanceStatistics__evaluateEndedSession_duration___block_invoke;
  v10[3] = &__block_descriptor_40_e46_v32__0__NSString_8__CRPerformanceMetric_16_B24l;
  v10[4] = a3;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v10);

}

void __58__CRPerformanceStatistics__evaluateEndedSession_duration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  double v4;

  v3 = a3;
  if (objc_msgSend(v3, "pcMetricID"))
  {
    objc_msgSend(v3, "pcMetricID");
    pc_session_get_value();
    objc_msgSend(v3, "denominator");
    objc_msgSend(v3, "addSample:", 0.0 / v4);
  }

}

+ (BOOL)_canEnableRecentPeakReset
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("com.apple.CoreRecognition.enable_recent_peak_reset"));

  return v3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)measureRecentPeak
{
  return self->_measureRecentPeak;
}

- (NSDictionary)metrics
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
