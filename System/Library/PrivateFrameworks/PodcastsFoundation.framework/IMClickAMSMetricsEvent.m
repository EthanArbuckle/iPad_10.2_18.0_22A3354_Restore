@implementation IMClickAMSMetricsEvent

- (IMClickAMSMetricsEvent)init
{
  IMClickAMSMetricsEvent *v2;
  IMClickAMSMetricsEvent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMClickAMSMetricsEvent;
  v2 = -[IMAMSMetricsEvent init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IMAMSMetricsEvent setEventType:](v2, "setEventType:", CFSTR("click"));
  return v3;
}

- (void)setPositionX:(id)a3
{
  -[IMClickAMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("positionX"));
}

- (void)setPositionY:(id)a3
{
  -[IMClickAMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("positionY"));
}

@end
