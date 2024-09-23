@implementation STPresetsValueChangedCoreAnalyticsEvent

- (STPresetsValueChangedCoreAnalyticsEvent)initWithSessionId:(id)a3 recommendedPresetId:(id)a4 fieldName:(id)a5 recommendedValue:(id)a6 selectedValue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  STPresetsValueChangedCoreAnalyticsEvent *v17;
  uint64_t v18;
  NSString *sessionId;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)STPresetsValueChangedCoreAnalyticsEvent;
  v17 = -[STPresetsValueChangedCoreAnalyticsEvent init](&v21, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    sessionId = v17->_sessionId;
    v17->_sessionId = (NSString *)v18;

    objc_storeStrong((id *)&v17->_recommendedPresetId, a4);
    objc_storeStrong((id *)&v17->_fieldName, a5);
    objc_storeStrong(&v17->_recommendedValue, a6);
    objc_storeStrong(&v17->_selectedValue, a7);
  }

  return v17;
}

- (NSString)name
{
  return (NSString *)CFSTR("com.apple.Family.PresetsValueChanged");
}

+ (id)description
{
  return CFSTR("PresetsValueChanged");
}

- (NSDictionary)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[STPresetsValueChangedCoreAnalyticsEvent fieldName](self, "fieldName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("fieldName"));

  -[STPresetsValueChangedCoreAnalyticsEvent recommendedPresetId](self, "recommendedPresetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("recommendedPresetId"));

  -[STPresetsValueChangedCoreAnalyticsEvent recommendedValue](self, "recommendedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("recommendedValue"));

  -[STPresetsValueChangedCoreAnalyticsEvent selectedValue](self, "selectedValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("selectedValue"));

  return (NSDictionary *)v3;
}

- (NSString)sessionId
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)fieldName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)recommendedPresetId
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (id)recommendedValue
{
  return objc_getProperty(self, a2, 32, 1);
}

- (id)selectedValue
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectedValue, 0);
  objc_storeStrong(&self->_recommendedValue, 0);
  objc_storeStrong((id *)&self->_recommendedPresetId, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
}

@end
