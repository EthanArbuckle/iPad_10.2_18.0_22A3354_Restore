@implementation IMMetricsTimerEvent

- (id)shortDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)IMMetricsTimerEvent;
  -[AMSMetricsEvent shortDescription](&v8, sel_shortDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMetricsTimerEvent duration](self, "duration");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %f"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)duration
{
  void *v2;
  double v3;
  double v4;

  -[IMMetricsTimerEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("duration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)setDuration:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent im_setProperty:forBodyKey:](self, "im_setProperty:forBodyKey:", v4, CFSTR("duration"));

}

- (IMMetricsTimerEvent)init
{
  IMMetricsTimerEvent *v2;
  IMMetricsTimerEvent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMMetricsTimerEvent;
  v2 = -[IMAMSMetricsEvent init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IMAMSMetricsEvent setEventType:](v2, "setEventType:", CFSTR("timer"));
  return v3;
}

@end
