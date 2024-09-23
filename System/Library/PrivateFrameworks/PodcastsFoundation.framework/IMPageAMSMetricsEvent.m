@implementation IMPageAMSMetricsEvent

- (IMPageAMSMetricsEvent)init
{
  IMPageAMSMetricsEvent *v2;
  IMPageAMSMetricsEvent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMPageAMSMetricsEvent;
  v2 = -[IMAMSMetricsEvent init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IMAMSMetricsEvent setEventType:](v2, "setEventType:", CFSTR("page"));
  return v3;
}

@end
