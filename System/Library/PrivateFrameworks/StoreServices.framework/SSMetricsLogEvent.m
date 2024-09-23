@implementation SSMetricsLogEvent

- (SSMetricsLogEvent)init
{
  SSMetricsLogEvent *v2;
  SSMetricsLogEvent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSMetricsLogEvent;
  v2 = -[SSMetricsMutableEvent init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SSMetricsMutableEvent setEventType:](v2, "setEventType:", CFSTR("log"));
    -[SSMetricsLogEvent setLogLevel:](v3, "setLogLevel:", 2);
    -[SSMetricsMutableEvent setTopic:](v3, "setTopic:", CFSTR("xp_amp_appstore_log"));
  }
  return v3;
}

- (unint64_t)logLevel
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_opt_class();
  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("level"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_logLevelFromString:", v4);

  return v5;
}

- (NSString)logSubsystem
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("loggerName"));
}

- (NSString)message
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("message"));
}

- (void)setLogLevel:(unint64_t)a3
{
  id v4;

  objc_msgSend((id)objc_opt_class(), "_stringFromLogLevel:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("level"));

}

- (void)setLogSubsystem:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("loggerName"));
}

- (void)setMessage:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("message"));
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v9.receiver = self;
  v9.super_class = (Class)SSMetricsLogEvent;
  -[SSMetricsLogEvent description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend((id)objc_opt_class(), "_stringFromLogLevel:", -[SSMetricsLogEvent logLevel](self, "logLevel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nlogLevel = %@"), v5);

  -[SSMetricsLogEvent logSubsystem](self, "logSubsystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nlogSubsystem = %@"), v6);

  -[SSMetricsLogEvent message](self, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nmessage = %@"), v7);

  return v3;
}

+ (unint64_t)_logLevelFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("debug")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("error")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("warn")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

+ (id)_stringFromLogLevel:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("info");
  else
    return off_1E47C0748[a3];
}

@end
