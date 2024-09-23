@implementation SSMetricsAccountEvent

- (SSMetricsAccountEvent)init
{
  SSMetricsAccountEvent *v2;
  SSMetricsAccountEvent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSMetricsAccountEvent;
  v2 = -[SSMetricsBaseEvent init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SSMetricsMutableEvent setEventType:](v2, "setEventType:", CFSTR("account"));
  return v3;
}

- (NSString)accountEventType
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("type"));
}

- (void)setAccountEventType:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("type"));
}

- (void)setAccountEventTypeWithEventIdentifier:(int64_t)a3
{
  const __CFString *v3;

  if (a3)
  {
    if (a3 != 1)
      return;
    v3 = CFSTR("signedOut");
  }
  else
  {
    v3 = CFSTR("signedIn");
  }
  -[SSMetricsAccountEvent setAccountEventType:](self, "setAccountEventType:", v3);
}

@end
