@implementation SSMetricsImpressionsEvent

- (SSMetricsImpressionsEvent)init
{
  SSMetricsImpressionsEvent *v2;
  SSMetricsImpressionsEvent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSMetricsImpressionsEvent;
  v2 = -[SSMetricsBaseEvent init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SSMetricsMutableEvent setEventType:](v2, "setEventType:", CFSTR("impressions"));
  return v3;
}

- (NSArray)impressionIdentifiers
{
  return (NSArray *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("impressions"));
}

- (void)setImpressionIdentifiers:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("impressions"));
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
  v8.super_class = (Class)SSMetricsImpressionsEvent;
  -[SSMetricsBaseEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsImpressionsEvent impressionIdentifiers](self, "impressionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Count: %ld"), v4, objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
