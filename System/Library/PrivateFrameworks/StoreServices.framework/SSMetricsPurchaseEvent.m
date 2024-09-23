@implementation SSMetricsPurchaseEvent

- (SSMetricsPurchaseEvent)init
{
  SSMetricsPurchaseEvent *v2;
  SSMetricsPurchaseEvent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSMetricsPurchaseEvent;
  v2 = -[SSMetricsBaseEvent init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SSMetricsMutableEvent setEventType:](v2, "setEventType:", CFSTR("buyConfirmed"));
  return v3;
}

- (void)addFieldsFromPurchaseResponse:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "responseMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SSMetricsMutableEvent addPropertiesWithDictionary:](self, "addPropertiesWithDictionary:", v4);
  objc_msgSend(v8, "requestStartTime");
  if (v5 > 2.22044605e-16)
    -[SSMetricsPurchaseEvent setRequestStartTime:](self, "setRequestStartTime:");
  objc_msgSend(v8, "responseEndTime");
  if (v6 > 2.22044605e-16)
    -[SSMetricsPurchaseEvent setResponseEndTime:](self, "setResponseEndTime:");
  objc_msgSend(v8, "responseStartTime");
  if (v7 > 2.22044605e-16)
    -[SSMetricsPurchaseEvent setResponseStartTime:](self, "setResponseStartTime:");

}

- (double)requestStartTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("requestStartTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (double)responseEndTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("responseEndTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (double)responseStartTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("responseStartTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setRequestStartTime:(double)a3
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
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("requestStartTime"));

}

- (void)setResponseEndTime:(double)a3
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
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("responseEndTime"));

}

- (void)setResponseStartTime:(double)a3
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
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("responseStartTime"));

}

- (void)setTransactionIdentifier:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("transactionId"));
}

- (NSString)transactionIdentifier
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("transactionId"));
}

@end
