@implementation MOPerformanceMeasurement

- (MOPerformanceMeasurement)initWithName:(id)a3 measureRecentPeak:(BOOL)a4
{
  id v7;
  MOPerformanceMeasurement *v8;
  MOPerformanceMeasurement *v9;
  void *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MOPerformanceMeasurement;
  v8 = -[MOPerformanceMeasurement init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_session = 0;
    v10 = (void *)objc_opt_new();
    -[MOPerformanceMeasurement setMetrics:](v9, "setMetrics:", v10);

    objc_storeStrong((id *)&v9->_name, a3);
    v9->_measureRecentPeak = a4;
    -[MOPerformanceMeasurement _addMetricWithKey:name:unit:denominator:pcMetricID:](v9, "_addMetricWithKey:name:unit:denominator:pcMetricID:", CFSTR("MOPerformanceMetricExecutionTime"), CFSTR("Execution Time"), CFSTR("ms"), 0, 1.0);
    -[MOPerformanceMeasurement _addMetricWithKey:name:unit:denominator:pcMetricID:](v9, "_addMetricWithKey:name:unit:denominator:pcMetricID:", CFSTR("MOPerformanceMetricCPUTime"), CFSTR("CPU Time"), CFSTR("ms"), 0x63707574696D6500, 1000000.0);
    -[MOPerformanceMeasurement _addMetricWithKey:name:unit:denominator:pcMetricID:](v9, "_addMetricWithKey:name:unit:denominator:pcMetricID:", CFSTR("MOPerformanceMetricLifetimeMemPeak"), CFSTR("Lifetime Peak"), CFSTR("MB"), 0x6C6966657065616BLL, 1000.0);
    -[MOPerformanceMeasurement _addMetricWithKey:name:unit:denominator:pcMetricID:](v9, "_addMetricWithKey:name:unit:denominator:pcMetricID:", CFSTR("MOPerformanceMetricDeltaMem"), CFSTR("Mem Delta"), CFSTR("MB"), 0x6D656D64656C7461, 1000.0);
    if (v9->_measureRecentPeak)
    {
      -[MOPerformanceMeasurement _addMetricWithKey:name:unit:denominator:pcMetricID:](v9, "_addMetricWithKey:name:unit:denominator:pcMetricID:", CFSTR("MOPerformanceMetricDeltaMemPeak"), CFSTR("Peak Delta"), CFSTR("MB"), 0x7065616B646C7461, 1000.0);
      -[MOPerformanceMeasurement _addMetricWithKey:name:unit:denominator:pcMetricID:](v9, "_addMetricWithKey:name:unit:denominator:pcMetricID:", CFSTR("MOPerformanceMetricRecentMemPeak"), CFSTR("Recent Peak"), CFSTR("MB"), 0x72636E747065616BLL, 1000.0);
    }
  }

  return v9;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MOPerformanceMeasurement name](self, "name");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n=========== %s ===========\n"), objc_msgSend(v4, "UTF8String"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[MOPerformanceMeasurement metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__MOPerformanceMeasurement_description__block_invoke;
  v8[3] = &unk_251442A60;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __39__MOPerformanceMeasurement_description__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v10 = v4;
  objc_msgSend(v4, "description");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("%s\n"), objc_msgSend(v6, "UTF8String"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)measureBlock:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  -[MOPerformanceMeasurement startSession](self, "startSession");
  v4[2]();
  -[MOPerformanceMeasurement endSession](self, "endSession");

}

- (void)startSession
{
  NSDate *startDate;
  uint64_t v4;
  pc_session *v5;
  void *v6;
  NSDate *v7;
  NSDate *v8;

  if (+[MOPerformanceMeasurement isEnabled](MOPerformanceMeasurement, "isEnabled"))
  {
    if (self->_session)
    {
      pc_session_end();
      pc_session_destroy();
      startDate = self->_startDate;
      self->_startDate = 0;
      self->_session = 0;

    }
    v4 = pc_session_create();
    if (v4)
    {
      v5 = (pc_session *)v4;
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "processIdentifier");
      pc_session_set_procpid();

      if (self->_measureRecentPeak)
      {
        pc_session_add_metric();
        pc_session_add_metric();
      }
      v7 = (NSDate *)objc_opt_new();
      v8 = self->_startDate;
      self->_startDate = v7;

      self->_session = v5;
      pc_session_begin();
    }
  }
}

- (void)endSession
{
  pc_session *session;
  void *v4;
  NSDate *startDate;
  NSObject *v6;
  id v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_session)
  {
    pc_session_end();
    session = self->_session;
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "timeIntervalSinceDate:", self->_startDate);
    -[MOPerformanceMeasurement _evaluateEndedSession:duration:](self, "_evaluateEndedSession:duration:", session);

    pc_session_destroy();
    startDate = self->_startDate;
    self->_startDate = 0;
    self->_session = 0;

    _mo_log_facility_get_os_log(MOLogFacilityPerformance);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[MOPerformanceMeasurement description](self, "description");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = 136315138;
      v9 = objc_msgSend(v7, "UTF8String");
      _os_log_debug_impl(&dword_243AAA000, v6, OS_LOG_TYPE_DEBUG, "METRICS: %s", (uint8_t *)&v8, 0xCu);

    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[MOPerformanceMeasurement endSession](self, "endSession");
  v3.receiver = self;
  v3.super_class = (Class)MOPerformanceMeasurement;
  -[MOPerformanceMeasurement dealloc](&v3, sel_dealloc);
}

+ (BOOL)isEnabled
{
  return 1;
}

- (void)_addMetricWithKey:(id)a3 name:(id)a4 unit:(id)a5 denominator:(double)a6 pcMetricID:(unint64_t)a7
{
  id v12;
  id v13;
  MOPerformanceMetric *v14;
  void *v15;
  id v16;

  v16 = a3;
  v12 = a4;
  v13 = a5;
  v14 = -[MOPerformanceMetric initWithDisplayName:pcMetricID:unit:denominator:]([MOPerformanceMetric alloc], "initWithDisplayName:pcMetricID:unit:denominator:", v12, a7, v13, a6);
  -[MOPerformanceMeasurement metrics](self, "metrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

}

- (void)_evaluateEndedSession:(pc_session *)a3 duration:(double)a4
{
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];

  -[MOPerformanceMeasurement metrics](self, "metrics");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MOPerformanceMetricExecutionTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRawValue:", a4 * 1000.0);

  -[MOPerformanceMeasurement metrics](self, "metrics");
  v10[1] = 3221225472;
  v10[2] = __59__MOPerformanceMeasurement__evaluateEndedSession_duration___block_invoke;
  v10[3] = &__block_descriptor_40_e46_v32__0__NSString_8__MOPerformanceMetric_16_B24l;
  v10[4] = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v10);

}

void __59__MOPerformanceMeasurement__evaluateEndedSession_duration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "pcMetricID"))
  {
    objc_msgSend(v3, "pcMetricID");
    if (!pc_session_get_value())
      objc_msgSend(v3, "setRawValue:", 0.0);
  }

}

- (NSMutableDictionary)metrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)measureRecentPeak
{
  return self->_measureRecentPeak;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
