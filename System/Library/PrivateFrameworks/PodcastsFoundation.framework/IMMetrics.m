@implementation IMMetrics

+ (void)recordUserAction:(id)a3 dataSource:(id)a4 withData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setPageType:", v9);

  objc_msgSend(a1, "setupEvent:forDataSource:", v10, v8);
  if (v11)
    objc_msgSend(v10, "im_addPropertiesWithDictionary:", v11);
  objc_msgSend(a1, "recordEvent:", v10);

}

+ (void)setupEvent:(id)a3 forDataSource:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_msgSend(v5, "metricsContentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "im_setContentIdentifier:", v6);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "metricsAdditionalData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v8, "im_addPropertiesWithDictionary:", v7);

  }
}

uint64_t __30__IMMetrics_recordEvent_with___block_invoke(id *a1)
{
  uint64_t result;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1[6], "canRecordEvent") & 1) != 0
    || (result = objc_msgSend(a1[4], "shouldIgnoreDNU"), (_DWORD)result))
  {
    objc_msgSend(a1[5], "im_setToken:", _token);
    v3 = _logLevel;
    _MTLogCategoryMetrics();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3 == 2)
    {
      if (v5)
      {
        v6 = a1[5];
        v8 = 138412290;
        v9 = v6;
        _os_log_impl(&dword_1A904E000, v4, OS_LOG_TYPE_DEFAULT, "Record event - %@", (uint8_t *)&v8, 0xCu);
      }
    }
    else if (v5)
    {
      objc_msgSend(a1[5], "shortDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1A904E000, v4, OS_LOG_TYPE_DEFAULT, "Record event - %@", (uint8_t *)&v8, 0xCu);

    }
    return objc_msgSend(a1[4], "recordEvent:", a1[5]);
  }
  return result;
}

+ (id)defaultMetricsController
{
  return (id)_metricsController;
}

+ (void)recordEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "defaultMetricsController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recordEvent:with:", v4, v5);

}

+ (void)recordEvent:(id)a3 with:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD aBlock[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__IMMetrics_recordEvent_with___block_invoke;
  aBlock[3] = &unk_1E54D1068;
  v13 = v6;
  v14 = a1;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  v10 = _Block_copy(aBlock);
  dispatch_async((dispatch_queue_t)_metricsQueue, v10);

}

+ (BOOL)canRecordEvent
{
  return objc_msgSend(MEMORY[0x1E0CFDC18], "onDeviceDiagnosticsAllowed");
}

+ (double)endTimer:(id)a3 dataSource:(id)a4 withData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "keyForTimerName:dataSource:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_metricsTimers, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend((id)_metricsTimers, "removeObjectForKey:", v11);
    objc_msgSend(v12, "doubleValue");
    v14 = v13;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v16 = v15 - v14;
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "im_setName:", v8);
    objc_msgSend(v17, "setDuration:", v16);
    objc_msgSend(a1, "setupEvent:forDataSource:", v17, v9);
    if (v10)
      objc_msgSend(v17, "im_addPropertiesWithDictionary:", v10);
    objc_msgSend(a1, "recordEvent:", v17);

  }
  else
  {
    v16 = 0.0;
  }

  return v16;
}

+ (void)startTimer:(id)a3 dataSource:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a1, "keyForTimerName:dataSource:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_metricsTimers, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    NSLog(CFSTR("A timer named %@ already exists!"), v8);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_metricsTimers, "setObject:forKeyedSubscript:", v7, v5);

}

+ (id)keyForTimerName:(id)a3 dataSource:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(a4, "metricsContentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@_%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (double)endTimer:(id)a3 dataSource:(id)a4
{
  double result;

  objc_msgSend(a1, "endTimer:dataSource:withData:", a3, a4, 0);
  return result;
}

+ (double)endTimer:(id)a3
{
  double result;

  objc_msgSend(a1, "endTimer:dataSource:", a3, 0);
  return result;
}

+ (void)setDefaultMetricsController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (_metricsController)
    objc_msgSend(a1, "removeMetricsController:");
  v5 = (void *)_metricsController;
  _metricsController = (uint64_t)v4;
  v6 = v4;

  objc_msgSend(a1, "addMetricsController:", v6);
}

+ (void)addMetricsController:(id)a3
{
  void *v3;
  id v4;
  id v5;

  if (a3)
  {
    v3 = (void *)_metricsControllersByTopic;
    v4 = a3;
    objc_msgSend(v4, "topic");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, v5);

  }
}

+ (void)startTimer:(id)a3
{
  objc_msgSend(a1, "startTimer:dataSource:", a3, 0);
}

+ (void)initialize
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  objc_super v15;

  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___IMMetrics;
  objc_msgSendSuper2(&v15, sel_initialize);
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)_metricsTimers;
  _metricsTimers = (uint64_t)v2;

  _logLevel = 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("IMMetricsDeviceToken"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_token;
  _token = v5;

  if (!_token)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)_token;
    _token = v8;

    objc_msgSend(v4, "setObject:forKey:", _token, CFSTR("IMMetricsDeviceToken"));
    objc_msgSend(v4, "synchronize");
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_metricsControllersByTopic;
  _metricsControllersByTopic = v10;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_queue_create("com.apple.podcasts.IMMetrics.metricsQueue", v12);
  v14 = (void *)_metricsQueue;
  _metricsQueue = (uint64_t)v13;

}

+ (id)flushImmediately
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  _MTLogCategoryMetrics();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A904E000, v2, OS_LOG_TYPE_DEFAULT, "Flush immediately", v7, 2u);
  }

  objc_msgSend((id)_metricsControllersByTopic, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
    objc_msgSend(MEMORY[0x1E0CFDBD8], "promiseWithFlattenedPromises:", v4);
  else
    objc_msgSend(MEMORY[0x1E0CFDBD8], "promiseWithResult:", &unk_1E5539660);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __29__IMMetrics_flushImmediately__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "flushImmediately");
}

+ (void)cancelFlush
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  _MTLogCategoryMetrics();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A904E000, v2, OS_LOG_TYPE_DEFAULT, "Cancel flush", v4, 2u);
  }

  objc_msgSend((id)_metricsControllersByTopic, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_cancel);

}

+ (void)removeMetricsController:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    v3 = (void *)_metricsControllersByTopic;
    objc_msgSend(a3, "topic");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectForKey:", v4);

  }
}

+ (id)metricsControllerForTopic:(id)a3
{
  if (a3)
    objc_msgSend((id)_metricsControllersByTopic, "objectForKeyedSubscript:");
  else
    objc_msgSend(a1, "defaultMetricsController");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)setLogLevel:(int)a3
{
  _logLevel = a3;
}

+ (void)recordUserAction:(id)a3
{
  objc_msgSend(a1, "recordUserAction:dataSource:", a3, 0);
}

+ (void)recordUserAction:(id)a3 dataSource:(id)a4
{
  objc_msgSend(a1, "recordUserAction:dataSource:withData:", a3, a4, 0);
}

+ (void)recordMemory:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "im_setName:", v4);

  objc_msgSend(a1, "recordEvent:", v5);
}

+ (void)recordEvent:(id)a3 topic:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(a1, "metricsControllerForTopic:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 && _logLevel)
    NSLog(CFSTR("recoding an event into a topic that does not exist: %@"), v6);
  if (objc_msgSend(v7, "shouldSuppressUserInfo"))
    objc_msgSend(v8, "setAccount:", 0);
  objc_msgSend(a1, "recordEvent:with:", v8, v7);

}

+ (void)recordEvent:(id)a3 dataSource:(id)a4 data:(id)a5
{
  objc_msgSend(a1, "recordEvent:dataSource:data:topic:", a3, a4, a5, 0);
}

+ (void)recordEvent:(id)a3 dataSource:(id)a4 data:(id)a5 topic:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setProperty:forBodyKey:", v12, CFSTR("eventType"));

  objc_msgSend(a1, "setupEvent:forDataSource:", v13, v11);
  if (v14)
    objc_msgSend(v13, "im_addPropertiesWithDictionary:", v14);
  objc_msgSend(a1, "recordEvent:topic:", v13, v10);

}

@end
