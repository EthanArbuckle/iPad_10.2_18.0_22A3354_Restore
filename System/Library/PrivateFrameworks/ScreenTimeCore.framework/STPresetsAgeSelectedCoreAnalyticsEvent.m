@implementation STPresetsAgeSelectedCoreAnalyticsEvent

- (STPresetsAgeSelectedCoreAnalyticsEvent)initWithSessionId:(id)a3 lowerBoundAgeRange:(int64_t)a4 upperBoundAgeRange:(int64_t)a5
{
  id v8;
  STPresetsAgeSelectedCoreAnalyticsEvent *v9;
  uint64_t v10;
  NSString *sessionId;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STPresetsAgeSelectedCoreAnalyticsEvent;
  v9 = -[STPresetsAgeSelectedCoreAnalyticsEvent init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    sessionId = v9->_sessionId;
    v9->_sessionId = (NSString *)v10;

    v9->_lowerBoundAgeRange = a4;
    v9->_upperBoundAgeRange = a5;
  }

  return v9;
}

- (NSString)name
{
  return (NSString *)CFSTR("com.apple.Family.AgePresetsAgeRangeSelected");
}

+ (id)description
{
  return CFSTR("AgePresetsAgeRangeSelected");
}

- (NSDictionary)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[STPresetsAgeSelectedCoreAnalyticsEvent sessionId](self, "sessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sessionId"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[STPresetsAgeSelectedCoreAnalyticsEvent lowerBoundAgeRange](self, "lowerBoundAgeRange"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("lowerBoundAgeRange"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[STPresetsAgeSelectedCoreAnalyticsEvent upperBoundAgeRange](self, "upperBoundAgeRange"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("upperBoundAgeRange"));

  return (NSDictionary *)v3;
}

- (NSString)sessionId
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)lowerBoundAgeRange
{
  return self->_lowerBoundAgeRange;
}

- (int64_t)upperBoundAgeRange
{
  return self->_upperBoundAgeRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
}

@end
