@implementation VKAnalyticsSubjectEvent

- (VKAnalyticsSubjectEvent)initWithEventType:(int64_t)a3 interactionType:(int64_t)a4 subjectFound:(BOOL)a5 processingDuration:(double)a6 customIdentifier:(id)a7
{
  VKAnalyticsSubjectEvent *result;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VKAnalyticsSubjectEvent;
  result = -[VKAnalyticsEvent initWithCustomIdentifier:](&v12, sel_initWithCustomIdentifier_, a7);
  if (result)
  {
    result->_eventType = a3;
    result->_subjectFound = a5;
    result->_processingDuration = a6;
    result->_interactionType = a4;
  }
  return result;
}

- (BOOL)cleansesBundleID
{
  return 1;
}

- (id)eventKey
{
  return CFSTR("subjectEventOccurred");
}

- (int64_t)type
{
  return 7;
}

- (id)coreAnalyticsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("eventType");
  VKMUIStringForVKAnalyticsSubjectEventType(-[VKAnalyticsSubjectEvent eventType](self, "eventType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("interactionType");
  VKMUIStringForVKAnalyticsSubjectInteractionType(-[VKAnalyticsSubjectEvent interactionType](self, "interactionType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = CFSTR("subjectFound");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VKAnalyticsSubjectEvent subjectFound](self, "subjectFound"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v12[3] = CFSTR("processingDuration");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[VKAnalyticsSubjectEvent processingDuration](self, "processingDuration");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  v12[4] = CFSTR("automatedTest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v8;
  v12[5] = CFSTR("bundleId");
  -[VKAnalyticsEvent bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)VKAnalyticsSubjectEvent;
  -[VKAnalyticsSubjectEvent description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForVKAnalyticsSubjectEventType(-[VKAnalyticsSubjectEvent eventType](self, "eventType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForVKAnalyticsSubjectInteractionType(-[VKAnalyticsSubjectEvent interactionType](self, "interactionType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForBool(-[VKAnalyticsSubjectEvent subjectFound](self, "subjectFound"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsSubjectEvent processingDuration](self, "processingDuration");
  v9 = v8;
  VKMUIStringForBool(-[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsEvent bundleIdentifier](self, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ \n eventType: %@ \n interactionType: %@ \n subjectFound: %@ \n processingDuration: %f \n automatedTest: %@ \n bundleId: %@ "), v4, v5, v6, v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (int64_t)interactionType
{
  return self->_interactionType;
}

- (void)setInteractionType:(int64_t)a3
{
  self->_interactionType = a3;
}

- (BOOL)subjectFound
{
  return self->_subjectFound;
}

- (void)setSubjectFound:(BOOL)a3
{
  self->_subjectFound = a3;
}

- (double)processingDuration
{
  return self->_processingDuration;
}

- (void)setProcessingDuration:(double)a3
{
  self->_processingDuration = a3;
}

@end
