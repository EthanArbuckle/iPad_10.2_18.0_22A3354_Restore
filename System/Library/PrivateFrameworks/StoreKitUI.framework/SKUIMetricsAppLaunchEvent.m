@implementation SKUIMetricsAppLaunchEvent

- (SKUIMetricsAppLaunchEvent)init
{
  SKUIMetricsAppLaunchEvent *v3;
  SKUIMetricsAppLaunchEvent *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *templateMetrics;
  void *v7;
  void *v8;
  objc_super v10;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIMetricsAppLaunchEvent init].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIMetricsAppLaunchEvent;
  v3 = -[SSMetricsBaseEvent init](&v10, sel_init);
  v4 = v3;
  if (v3)
  {
    -[SSMetricsMutableEvent setEventType:](v3, "setEventType:", CFSTR("appLaunch"));
    -[SSMetricsMutableEvent setTopic:](v4, "setTopic:", CFSTR("xp_amp_clientperf"));
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    templateMetrics = v4->_templateMetrics;
    v4->_templateMetrics = v5;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIMetricsAppLaunchEvent setLaunchCorrelationKey:](v4, "setLaunchCorrelationKey:", v8);

  }
  return v4;
}

+ (void)resetPendingLaunchEventForTesting
{
  void *v2;

  _HasConsumedPendingLaunchEvent = 0;
  v2 = (void *)_PendingLaunchEvent;
  _PendingLaunchEvent = 0;

}

+ (void)createPendingLaunchEvent
{
  SKUIMetricsAppLaunchEvent *v2;
  void *v3;

  if ((_HasConsumedPendingLaunchEvent & 1) == 0 && !_PendingLaunchEvent)
  {
    v2 = objc_alloc_init(SKUIMetricsAppLaunchEvent);
    v3 = (void *)_PendingLaunchEvent;
    _PendingLaunchEvent = (uint64_t)v2;

  }
}

+ (void)withPendingLaunchEvent:(id)a3
{
  if (_PendingLaunchEvent)
    (*((void (**)(id))a3 + 2))(a3);
}

+ (id)consumePendingLaunchEvent
{
  id v2;
  void *v3;

  v2 = (id)_PendingLaunchEvent;
  _HasConsumedPendingLaunchEvent = 1;
  v3 = (void *)_PendingLaunchEvent;
  _PendingLaunchEvent = 0;

  return v2;
}

+ (double)processStartTime
{
  if (processStartTime_onceToken != -1)
    dispatch_once(&processStartTime_onceToken, &__block_literal_global_47);
  return *(double *)&_ProcessStartTime;
}

uint64_t __45__SKUIMetricsAppLaunchEvent_processStartTime__block_invoke()
{
  uint64_t result;
  double v1;
  size_t v2;
  _OWORD v3[40];
  int v4[2];
  int v5;
  pid_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v4 = 0xE00000001;
  v5 = 1;
  v6 = getpid();
  memset(v3, 0, 512);
  v2 = 648;
  result = sysctl(v4, 4u, v3, &v2, 0, 0);
  if ((_DWORD)result)
  {
    result = SSDebugLog();
    v1 = 0.0;
  }
  else
  {
    v1 = (double)SDWORD2(v3[0]) / 1000000.0 + (double)*(uint64_t *)&v3[0];
  }
  _ProcessStartTime = *(_QWORD *)&v1;
  return result;
}

- (void)setLaunchCorrelationKey:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("launchCorrelationKey"));

}

- (NSString)launchCorrelationKey
{
  void *v2;
  void *v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("launchCorrelationKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (void)setMainTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("mainTime"));

}

- (double)mainTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("mainTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setClientConfigurationLoadTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("clientConfigurationLoadTime"));

}

- (double)clientConfigurationLoadTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("clientConfigurationLoadTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)addTemplateLoadTimingMetric:(id)a3 forURL:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_templateMetrics, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)setBootstrapStartTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("bootstrapStartTime"));

}

- (double)bootstrapStartTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("bootstrapStartTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setBootstrapEndTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("bootstrapEndTime"));

}

- (double)bootstrapEndTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("bootstrapEndTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setJsResourcesStartTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("jsResourcesStartTime"));

}

- (double)jsResourcesStartTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("jsResourcesStartTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setJsResourcesEndTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("jsResourcesEndTime"));

}

- (double)jsResourcesEndTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("jsResourcesEndTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setInitialTabRequestStartTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("initialTabRequestStartTime"));

}

- (double)initialTabRequestStartTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("initialTabRequestStartTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setInitialTabResponseStartTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("initialTabResponseStartTime"));

}

- (double)initialTabResponseStartTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("initialTabResponseStartTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setInitialTabResponseEndTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("initialTabResponseEndTime"));

}

- (double)initialTabResponseEndTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("initialTabResponseEndTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setLaunchFailureTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("launchFailureTime"));

}

- (double)launchFailureTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("launchFailureTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setLaunchEndTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("launchEndTime"));

}

- (double)launchEndTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("launchEndTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setRequiredBlockingBagLoad:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("requiredBlockingBagLoad"));

}

- (BOOL)requiredBlockingBagLoad
{
  void *v2;
  char v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("requiredBlockingBagLoad"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setUsedBootstrapFallback:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("usedBootstrapFallback"));

}

- (BOOL)usedBootstrapFallback
{
  void *v2;
  char v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("usedBootstrapFallback"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)appendPropertiesToBody:(id)a3
{
  id v4;
  id v5;
  NSMutableDictionary *templateMetrics;
  id v7;
  void *v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (-[NSMutableDictionary count](self->_templateMetrics, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    templateMetrics = self->_templateMetrics;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__SKUIMetricsAppLaunchEvent_appendPropertiesToBody___block_invoke;
    v10[3] = &unk_1E73A7C58;
    v11 = v5;
    v7 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](templateMetrics, "enumerateKeysAndObjectsUsingBlock:", v10);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("templateMetrics"));

  }
  objc_msgSend((id)objc_opt_class(), "processStartTime");
  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("processStartTime"));

  v9.receiver = self;
  v9.super_class = (Class)SKUIMetricsAppLaunchEvent;
  -[SSMetricsMutableEvent appendPropertiesToBody:](&v9, sel_appendPropertiesToBody_, v4);

}

void __52__SKUIMetricsAppLaunchEvent_appendPropertiesToBody___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_msgSend(a3, "dictionaryRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableDictionary *templateMetrics;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, void *, void *);
  void *v26;
  id v27;
  objc_super v28;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v28.receiver = self;
  v28.super_class = (Class)SKUIMetricsAppLaunchEvent;
  -[SSMetricsBaseEvent description](&v28, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  -[SKUIMetricsAppLaunchEvent launchCorrelationKey](self, "launchCorrelationKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nlaunchCorrelationKey = %@"), v5);

  objc_msgSend((id)objc_opt_class(), "processStartTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nprocessStartTime = %f"), v6);
  -[SKUIMetricsAppLaunchEvent mainTime](self, "mainTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nmainTime = %f"), v7);
  -[SKUIMetricsAppLaunchEvent clientConfigurationLoadTime](self, "clientConfigurationLoadTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nclientConfigurationLoadTime = %f"), v8);
  objc_msgSend(v3, "appendString:", CFSTR("\ntemplateMetrics = ("));
  templateMetrics = self->_templateMetrics;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __40__SKUIMetricsAppLaunchEvent_description__block_invoke;
  v26 = &unk_1E73A7C58;
  v10 = v3;
  v27 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](templateMetrics, "enumerateKeysAndObjectsUsingBlock:", &v23);
  objc_msgSend(v10, "appendString:", CFSTR("\n)"));
  -[SKUIMetricsAppLaunchEvent bootstrapStartTime](self, "bootstrapStartTime");
  objc_msgSend(v10, "appendFormat:", CFSTR("\nbootstrapStartTime = %f"), v11, v23, v24, v25, v26);
  -[SKUIMetricsAppLaunchEvent bootstrapEndTime](self, "bootstrapEndTime");
  objc_msgSend(v10, "appendFormat:", CFSTR("\nbootstrapEndTime = %f"), v12);
  -[SKUIMetricsAppLaunchEvent jsResourcesStartTime](self, "jsResourcesStartTime");
  objc_msgSend(v10, "appendFormat:", CFSTR("\njsResourcesStartTime = %f"), v13);
  -[SKUIMetricsAppLaunchEvent jsResourcesEndTime](self, "jsResourcesEndTime");
  objc_msgSend(v10, "appendFormat:", CFSTR("\njsResourcesEndTime = %f"), v14);
  -[SKUIMetricsAppLaunchEvent initialTabRequestStartTime](self, "initialTabRequestStartTime");
  objc_msgSend(v10, "appendFormat:", CFSTR("\ninitialTabRequestStartTime = %f"), v15);
  -[SKUIMetricsAppLaunchEvent initialTabResponseStartTime](self, "initialTabResponseStartTime");
  objc_msgSend(v10, "appendFormat:", CFSTR("\ninitialTabResponseStartTime = %f"), v16);
  -[SKUIMetricsAppLaunchEvent initialTabResponseEndTime](self, "initialTabResponseEndTime");
  objc_msgSend(v10, "appendFormat:", CFSTR("\ninitialTabResponseEndTime = %f"), v17);
  -[SKUIMetricsAppLaunchEvent launchFailureTime](self, "launchFailureTime");
  objc_msgSend(v10, "appendFormat:", CFSTR("\nlaunchFailureTime = %f"), v18);
  -[SKUIMetricsAppLaunchEvent launchEndTime](self, "launchEndTime");
  objc_msgSend(v10, "appendFormat:", CFSTR("\nlaunchEndTime = %f"), v19);
  if (-[SKUIMetricsAppLaunchEvent requiredBlockingBagLoad](self, "requiredBlockingBagLoad"))
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  objc_msgSend(v10, "appendFormat:", CFSTR("\nrequiredBlockingBagLoad = %@"), v20);
  if (-[SKUIMetricsAppLaunchEvent usedBootstrapFallback](self, "usedBootstrapFallback"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  objc_msgSend(v10, "appendFormat:", CFSTR("\nusedBootstrapFallback = %@"), v21);

  return (NSString *)v10;
}

uint64_t __40__SKUIMetricsAppLaunchEvent_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "appendString:", CFSTR("\n\t{"));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\n\t\ttemplateURL = %@"), v7);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v6, "requestStartTime");
  objc_msgSend(v8, "appendFormat:", CFSTR("\n\t\trequestStartTime = %f"), v9);
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v6, "responseStartTime");
  objc_msgSend(v10, "appendFormat:", CFSTR("\n\t\tresponseStartTime = %f"), v11);
  v12 = *(void **)(a1 + 32);
  objc_msgSend(v6, "responseEndTime");
  objc_msgSend(v12, "appendFormat:", CFSTR("\n\t\tresponseEndTime = %f"), v13);
  v14 = *(void **)(a1 + 32);
  LODWORD(v5) = objc_msgSend(v6, "responseWasCached");

  v15 = CFSTR("NO");
  if ((_DWORD)v5)
    v15 = CFSTR("YES");
  objc_msgSend(v14, "appendFormat:", CFSTR("\n\t\tresponseWasCached = %@"), v15);
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n\t},"));
}

- (void)populateObjectInspector:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void (**v27)(_QWORD);
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _QWORD aBlock[5];

  v4 = a3;
  objc_msgSend(v4, "setFriendlyName:", CFSTR("App Launch Times"));
  objc_msgSend(v4, "setInformation:", CFSTR("All times relative to process start time"));
  objc_msgSend((id)objc_opt_class(), "processStartTime");
  v6 = v5;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__SKUIMetricsAppLaunchEvent_populateObjectInspector___block_invoke;
  aBlock[3] = &__block_descriptor_40_e18___NSString_16__0d8l;
  *(double *)&aBlock[4] = v5;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v4, "beginSectionWithFriendlyName:", CFSTR("Process Stats"));
  v9 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringFromDate:dateStyle:timeStyle:", v10, 0, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Process Start Time"), v11);
  -[SKUIMetricsAppLaunchEvent mainTime](self, "mainTime");
  v8[2](v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Main Time"), v12);

  -[SKUIMetricsAppLaunchEvent clientConfigurationLoadTime](self, "clientConfigurationLoadTime");
  v8[2](v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Client Configuration Load Time"), v13);

  -[SKUIMetricsAppLaunchEvent launchFailureTime](self, "launchFailureTime");
  v8[2](v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Launch Failure Time"), v14);

  -[SKUIMetricsAppLaunchEvent launchEndTime](self, "launchEndTime");
  v8[2](v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Launch End Time"), v15);

  if (-[SKUIMetricsAppLaunchEvent requiredBlockingBagLoad](self, "requiredBlockingBagLoad"))
    v16 = CFSTR("Yes");
  else
    v16 = CFSTR("No");
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Required Blocking Bag Load"), v16);
  if (-[SKUIMetricsAppLaunchEvent usedBootstrapFallback](self, "usedBootstrapFallback"))
    v17 = CFSTR("Yes");
  else
    v17 = CFSTR("No");
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Used Bootstrap Fallback"), v17);
  objc_msgSend(v4, "endSection");
  objc_msgSend(v4, "beginSectionWithFriendlyName:", CFSTR("App Resource Times"));
  -[SKUIMetricsAppLaunchEvent bootstrapStartTime](self, "bootstrapStartTime");
  v8[2](v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Bootstrap Start Time"), v18);

  -[SKUIMetricsAppLaunchEvent bootstrapEndTime](self, "bootstrapEndTime");
  v8[2](v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Bootstrap End Time"), v19);

  -[SKUIMetricsAppLaunchEvent jsResourcesEndTime](self, "jsResourcesEndTime");
  v8[2](v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("JS Resources Start Time"), v20);

  -[SKUIMetricsAppLaunchEvent jsResourcesEndTime](self, "jsResourcesEndTime");
  v8[2](v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("JS Resources End Time"), v21);

  -[SKUIMetricsAppLaunchEvent initialTabRequestStartTime](self, "initialTabRequestStartTime");
  v8[2](v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Initial Tab Request Start Time"), v22);

  -[SKUIMetricsAppLaunchEvent initialTabResponseStartTime](self, "initialTabResponseStartTime");
  v8[2](v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Initial Tab Response Start Time"), v23);

  -[SKUIMetricsAppLaunchEvent initialTabResponseEndTime](self, "initialTabResponseEndTime");
  v8[2](v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Initial Tab Response End Time"), v24);

  objc_msgSend(v4, "endSection");
  -[SKUIMetricsAppLaunchEvent templateMetrics](self, "templateMetrics");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v7;
  v28[1] = 3221225472;
  v28[2] = __53__SKUIMetricsAppLaunchEvent_populateObjectInspector___block_invoke_3;
  v28[3] = &unk_1E73A7CA0;
  v29 = v4;
  v30 = v8;
  v31 = &__block_literal_global_114;
  v26 = v4;
  v27 = v8;
  objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v28);

}

__CFString *__53__SKUIMetricsAppLaunchEvent_populateObjectInspector___block_invoke(uint64_t a1, double a2)
{
  __CFString *v2;
  void *v3;
  void *v4;

  if (a2 >= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2 - *(double *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+%@s"), v4);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = CFSTR("--");
  }
  return v2;
}

__CFString *__53__SKUIMetricsAppLaunchEvent_populateObjectInspector___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
    return CFSTR("Yes");
  else
    return CFSTR("No");
}

uint64_t __53__SKUIMetricsAppLaunchEvent_populateObjectInspector___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginSectionWithFriendlyName:", v7);

  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "requestStartTime");
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exposePropertyWithFriendlyName:value:", CFSTR("Request Start Time"), v10);

  v11 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "responseStartTime");
  (*(void (**)(uint64_t))(v12 + 16))(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exposePropertyWithFriendlyName:value:", CFSTR("Response Start Time"), v13);

  v14 = *(void **)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "responseEndTime");
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "exposePropertyWithFriendlyName:value:", CFSTR("Response End Time"), v16);

  v17 = *(void **)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = objc_msgSend(v6, "responseWasCached");

  (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "exposePropertyWithFriendlyName:value:", CFSTR("Response Was Cached"), v20);

  return objc_msgSend(*(id *)(a1 + 32), "endSection");
}

- (NSDictionary)templateMetrics
{
  return &self->_templateMetrics->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateMetrics, 0);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMetricsAppLaunchEvent init]";
}

@end
