@implementation SSMetricsExitEvent

- (SSMetricsExitEvent)init
{
  SSMetricsExitEvent *v2;
  SSMetricsExitEvent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSMetricsExitEvent;
  v2 = -[SSMetricsBaseEvent init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SSMetricsMutableEvent setEventType:](v2, "setEventType:", CFSTR("exit"));
  return v3;
}

- (NSString)exitType
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("type"));
}

- (NSString)exitURL
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("destinationUrl"));
}

- (void)setExitType:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("type"));
}

- (void)setExitTypeWithSuspendReason:(int64_t)a3
{
  const __CFString *v3;

  if (a3)
  {
    if (a3 != 1)
      return;
    v3 = CFSTR("taskSwitch");
  }
  else
  {
    v3 = CFSTR("quit");
  }
  -[SSMetricsExitEvent setExitType:](self, "setExitType:", v3);
}

- (void)setExitURL:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("destinationUrl"));
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SSMetricsExitEvent;
  -[SSMetricsBaseEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsExitEvent exitType](self, "exitType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Type: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
