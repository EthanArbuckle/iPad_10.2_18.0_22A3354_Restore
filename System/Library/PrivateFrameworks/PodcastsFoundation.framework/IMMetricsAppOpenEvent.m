@implementation IMMetricsAppOpenEvent

- (IMMetricsAppOpenEvent)initWithReason:(int64_t)a3
{
  IMMetricsAppOpenEvent *v4;
  IMMetricsAppOpenEvent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMMetricsAppOpenEvent;
  v4 = -[IMAMSMetricsEvent init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[IMAMSMetricsEvent setEventType:](v4, "setEventType:", CFSTR("app_open"));
    -[IMMetricsAppOpenEvent setEnterTypeWithLaunchReason:](v5, "setEnterTypeWithLaunchReason:", a3);
  }
  return v5;
}

- (void)setEnterTypeWithLaunchReason:(int64_t)a3
{
  if ((unint64_t)a3 <= 3)
    -[AMSMetricsEvent im_setName:](self, "im_setName:", off_1E54D11B0[a3]);
}

- (void)setReferringURL:(id)a3
{
  -[IMMetricsAppOpenEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("refUrl"));
}

- (void)setReferringAppName:(id)a3
{
  -[IMMetricsAppOpenEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("refApp"));
}

- (NSString)referringAppName
{
  return (NSString *)-[IMMetricsAppOpenEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("refApp"));
}

- (NSString)referringURL
{
  return (NSString *)-[IMMetricsAppOpenEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("refUrl"));
}

@end
