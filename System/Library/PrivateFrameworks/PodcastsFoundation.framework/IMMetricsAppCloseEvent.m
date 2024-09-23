@implementation IMMetricsAppCloseEvent

- (IMMetricsAppCloseEvent)initWithReason:(int64_t)a3
{
  IMMetricsAppCloseEvent *v4;
  IMMetricsAppCloseEvent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMMetricsAppCloseEvent;
  v4 = -[IMAMSMetricsEvent init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[IMAMSMetricsEvent setEventType:](v4, "setEventType:", CFSTR("app_close"));
    -[IMMetricsAppCloseEvent setExitTypeWithSuspendReason:](v5, "setExitTypeWithSuspendReason:", a3);
  }
  return v5;
}

- (NSString)exitURL
{
  return (NSString *)-[IMMetricsAppCloseEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("destinationUrl"));
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
  -[AMSMetricsEvent im_setName:](self, "im_setName:", v3);
}

- (void)setExitURL:(id)a3
{
  -[AMSMetricsEvent im_setProperty:forBodyKey:](self, "im_setProperty:forBodyKey:", a3, CFSTR("destinationUrl"));
}

@end
