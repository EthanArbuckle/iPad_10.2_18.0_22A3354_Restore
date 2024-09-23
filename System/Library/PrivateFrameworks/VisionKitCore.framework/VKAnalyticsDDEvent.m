@implementation VKAnalyticsDDEvent

- (VKAnalyticsDDEvent)initWithElement:(id)a3 eventType:(int64_t)a4 customIdentifier:(id)a5
{
  id v8;
  VKAnalyticsDDEvent *v9;
  VKAnalyticsDDEvent *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VKAnalyticsDDEvent;
  v9 = -[VKAnalyticsEvent initWithCustomIdentifier:](&v12, sel_initWithCustomIdentifier_, a5);
  v10 = v9;
  if (v9)
  {
    v9->_eventType = a4;
    v9->_dataDetectorTypes = objc_msgSend(v8, "dataDetectorTypes");
  }

  return v10;
}

- (id)eventKey
{
  return CFSTR("DataDetectorEventOccured");
}

- (int64_t)type
{
  return 3;
}

- (id)coreAnalyticsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("types");
  VKMUIStringForDDTypes(-[VKAnalyticsDDEvent dataDetectorTypes](self, "dataDetectorTypes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("eventType");
  VKMUIStringForVKAnalyticsDDEventType(-[VKAnalyticsDDEvent eventType](self, "eventType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("automatedTest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("bundleIdentifier");
  -[VKAnalyticsEvent bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)VKAnalyticsDDEvent;
  -[VKAnalyticsDDEvent description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForVKAnalyticsDDEventType(-[VKAnalyticsDDEvent eventType](self, "eventType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForDDTypes(-[VKAnalyticsDDEvent dataDetectorTypes](self, "dataDetectorTypes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForBool(-[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsEvent bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ \n ddEventType: %@ \n ddTypes: %@ \n automatedTest: %@ \n bundleIdentifier %@ "), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  self->_dataDetectorTypes = a3;
}

@end
