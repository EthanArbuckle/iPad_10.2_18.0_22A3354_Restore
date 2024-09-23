@implementation STPresetsEnableRestrictionsCoreAnalyticsEvent

- (STPresetsEnableRestrictionsCoreAnalyticsEvent)initWithSessionId:(id)a3 selectionType:(int64_t)a4 lowerBoundAgeRange:(id)a5 upperBoundAgeRange:(id)a6
{
  id v10;
  id v11;
  id v12;
  STPresetsEnableRestrictionsCoreAnalyticsEvent *v13;
  uint64_t v14;
  NSString *sessionId;
  objc_super v17;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)STPresetsEnableRestrictionsCoreAnalyticsEvent;
  v13 = -[STPresetsEnableRestrictionsCoreAnalyticsEvent init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    sessionId = v13->_sessionId;
    v13->_sessionId = (NSString *)v14;

    v13->_selectionType = a4;
    objc_storeStrong((id *)&v13->_lowerBoundAgeRange, a5);
    objc_storeStrong((id *)&v13->_upperBoundAgeRange, a6);
  }

  return v13;
}

- (NSString)name
{
  return (NSString *)CFSTR("com.apple.Family.EnablePresetsSelected");
}

+ (id)description
{
  return CFSTR("EnablePresetsSelected");
}

- (NSDictionary)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[STPresetsEnableRestrictionsCoreAnalyticsEvent sessionId](self, "sessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sessionId"));

  -[STPresetsEnableRestrictionsCoreAnalyticsEvent _stringDescriptionForSelectionType:](self, "_stringDescriptionForSelectionType:", -[STPresetsEnableRestrictionsCoreAnalyticsEvent selectionType](self, "selectionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("selectionType"));

  -[STPresetsEnableRestrictionsCoreAnalyticsEvent lowerBoundAgeRange](self, "lowerBoundAgeRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("lowerBoundAgeRange"));

  -[STPresetsEnableRestrictionsCoreAnalyticsEvent upperBoundAgeRange](self, "upperBoundAgeRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("upperBoundAgeRange"));

  return (NSDictionary *)v3;
}

- (id)_stringDescriptionForSelectionType:(int64_t)a3
{
  if (a3)
    return CFSTR("recommended");
  else
    return CFSTR("custom");
}

- (NSString)sessionId
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)selectionType
{
  return self->_selectionType;
}

- (NSNumber)lowerBoundAgeRange
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)upperBoundAgeRange
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upperBoundAgeRange, 0);
  objc_storeStrong((id *)&self->_lowerBoundAgeRange, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
}

@end
