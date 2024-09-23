@implementation SSMetricsMutableEvent

- (void)setProperty:(id)a3 forBodyKey:(id)a4
{
  id v6;
  NSMutableDictionary *mutableBody;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    mutableBody = self->_mutableBody;
    if (v8)
      -[NSMutableDictionary setObject:forKey:](mutableBody, "setObject:forKey:", v8, v6);
    else
      -[NSMutableDictionary removeObjectForKey:](mutableBody, "removeObjectForKey:", v6);
  }

}

- (void)setTopic:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("topic"));
}

void __48__SSMetricsMutableEvent_initWithBodyDictionary___block_invoke()
{
  __CFBundle *MainBundle;
  const __CFDictionary *InfoDictionary;
  const void *Value;
  uint64_t v3;
  void *v4;
  id v5;

  MainBundle = CFBundleGetMainBundle();
  InfoDictionary = CFBundleGetInfoDictionary(MainBundle);
  if (InfoDictionary && (Value = CFDictionaryGetValue(InfoDictionary, (const void *)*MEMORY[0x1E0C9AE90])) != 0)
  {
    initWithBodyDictionary____bundleVersion = (uint64_t)CFRetain(Value);
    if (!initWithBodyDictionary____bundleVersion)
      goto LABEL_6;
  }
  else if (!initWithBodyDictionary____bundleVersion)
  {
LABEL_6:
    initWithBodyDictionary____bundleVersion = (uint64_t)CFSTR("1.0");
    CFRetain(CFSTR("1.0"));
  }
  +[SSDevice currentDevice](SSDevice, "currentDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "productVersion");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)initWithBodyDictionary____osVersion;
  initWithBodyDictionary____osVersion = v3;

}

- (SSMetricsMutableEvent)initWithBodyDictionary:(id)a3
{
  id v4;
  SSMetricsMutableEvent *v5;
  uint64_t v6;
  NSMutableDictionary *mutableBody;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SSMetricsMutableEvent;
  v5 = -[SSMetricsMutableEvent init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    mutableBody = v5->_mutableBody;
    v5->_mutableBody = (NSMutableDictionary *)v6;

    if (initWithBodyDictionary__onceToken != -1)
      dispatch_once(&initWithBodyDictionary__onceToken, &__block_literal_global_42);
    -[SSMetricsMutableEvent setProperty:forBodyKey:](v5, "setProperty:forBodyKey:", initWithBodyDictionary____bundleVersion, CFSTR("appVersion"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMetricsMutableEvent setProperty:forBodyKey:](v5, "setProperty:forBodyKey:", v8, CFSTR("baseVersion"));

    -[SSMetricsMutableEvent setProperty:forBodyKey:](v5, "setProperty:forBodyKey:", initWithBodyDictionary____osVersion, CFSTR("osVersion"));
    objc_msgSend((id)objc_opt_class(), "globalEventCanary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "globalEventCanary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[SSMetricsMutableEvent setProperty:forBodyKey:](v5, "setProperty:forBodyKey:", v9, CFSTR("canary"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMetricsMutableEvent setProperty:forBodyKey:](v5, "setProperty:forBodyKey:", v11, CFSTR("eventVersion"));

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMetricsMutableEvent setOriginalTimeUsingDate:](v5, "setOriginalTimeUsingDate:", v12);

  }
  return v5;
}

- (void)setOriginalTimeUsingDate:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0C99E80];
  v5 = a3;
  objc_msgSend(v4, "localTimeZone");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v12, "secondsFromGMTForDate:", v5);
  v7 = ((unsigned __int128)(v6 * (__int128)0x7777777777777777) >> 64) - v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v7 >> 5) + (v7 >> 63));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v8, CFSTR("timezoneOffset"));

  objc_msgSend(v5, "timeIntervalSince1970");
  v10 = v9;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v11, CFSTR("eventTime"));

}

- (SSMetricsMutableEvent)init
{
  return -[SSMetricsMutableEvent initWithBodyDictionary:](self, "initWithBodyDictionary:", MEMORY[0x1E0C9AA70]);
}

- (NSString)topic
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("topic"));
}

- (BOOL)shouldSuppressUserInfo
{
  return self->_shouldSuppressUserInfo;
}

- (void)setUserAgent:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("userAgent"));
}

- (void)setEventType:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("eventType"));
}

- (void)setConnection:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("connection"));
}

- (void)setApplicationIdentifier:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("app"));
}

- (void)setAccountIdentifier:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("dsId"));
}

- (id)propertyForBodyKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_mutableBody, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)eventType
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("eventType"));
}

- (id)decorateReportingURL:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[SSMetricsMutableEvent topic](self, "topic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[SSMetricsMutableEvent topic](self, "topic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/2/%@"), v4, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

- (NSDictionary)bodyDictionary
{
  return &self->_mutableBody->super;
}

- (void)appendPropertiesToBody:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SSMetricsMutableEvent;
  -[SSMetricsEvent appendPropertiesToBody:](&v5, sel_appendPropertiesToBody_, v4);
  if (-[NSMutableDictionary count](self->_mutableBody, "count"))
    objc_msgSend(v4, "addEntriesFromDictionary:", self->_mutableBody);

}

- (void)addPropertiesWithDictionary:(id)a3
{
  -[NSMutableDictionary addEntriesFromDictionary:](self->_mutableBody, "addEntriesFromDictionary:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableBody, 0);
}

- (NSNumber)accountIdentifier
{
  return (NSNumber *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("dsId"));
}

- (NSString)connection
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connection"));
}

- (double)originalTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("eventTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setOriginalTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("eventTime"));

}

- (NSNumber)baseVersion
{
  return (NSNumber *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("baseVersion"));
}

- (NSNumber)eventVersion
{
  return (NSNumber *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("eventVersion"));
}

- (void)setBaseVersion:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("baseVersion"));
}

- (void)setEventVersion:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("eventVersion"));
}

- (NSString)applicationIdentifier
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("app"));
}

- (NSNumber)clientVersion
{
  return (NSNumber *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("clientVersion"));
}

- (NSString)hostApplicationIdentifier
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("hostApp"));
}

- (NSNumber)previousClientVersion
{
  return (NSNumber *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pClientVersion"));
}

- (void)setClientVersion:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("clientVersion"));
}

- (void)setHostApplicationIdentifier:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("hostApp"));
}

- (void)setPreviousClientVersion:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("pClientVersion"));
}

- (NSString)userAgent
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("userAgent"));
}

- (NSString)canaryIdentifier
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("canary"));
}

- (void)setCanaryIdentifier:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("canary"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBodyDictionary:", self->_mutableBody);
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ : %p -- [%d properties] %@"), objc_opt_class(), self, -[NSMutableDictionary count](self->_mutableBody, "count"), self->_mutableBody);
}

- (void)setShouldSuppressUserInfo:(BOOL)a3
{
  self->_shouldSuppressUserInfo = a3;
}

- (BOOL)shouldSuppressDSIDHeader
{
  return self->_shouldSuppressDSIDHeader;
}

- (void)setShouldSuppressDSIDHeader:(BOOL)a3
{
  self->_shouldSuppressDSIDHeader = a3;
}

@end
