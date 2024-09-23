@implementation VKAnalyticsInteractionEvent

- (VKAnalyticsInteractionEvent)initWithEventType:(int64_t)a3 analysis:(id)a4 source:(int64_t)a5 interactionTypes:(unint64_t)a6 buttonActive:(BOOL)a7 customIdentifier:(id)a8
{
  id v14;
  VKAnalyticsInteractionEvent *v15;
  VKAnalyticsInteractionEvent *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v14 = a4;
  v23.receiver = self;
  v23.super_class = (Class)VKAnalyticsInteractionEvent;
  v15 = -[VKAnalyticsEvent initWithCustomIdentifier:](&v23, sel_initWithCustomIdentifier_, a8);
  v16 = v15;
  if (v15)
  {
    v15->_eventType = a3;
    v15->_analysisButtonActive = a7;
    v15->_source = a5;
    v15->_activeInteractionTypes = a6;
    objc_msgSend(v14, "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16->_textLength = objc_msgSend(v17, "length");

    objc_msgSend(v14, "textDataDetectorElements");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16->_ddCount = objc_msgSend(v18, "count");

    objc_msgSend(v14, "mrcDataDetectorElements");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16->_mrcCount = objc_msgSend(v19, "count");

    objc_msgSend(v14, "visualSearchResult");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "resultItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16->_vsCount = objc_msgSend(v21, "count");

  }
  return v16;
}

- (id)eventKey
{
  return CFSTR("InteractionEventOccured");
}

- (int64_t)type
{
  return 8;
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
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[10];
  _QWORD v16[12];

  v16[10] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("eventSource");
  VKMUIStringForVKAnalyticsEventSource(-[VKAnalyticsInteractionEvent source](self, "source"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  v15[1] = CFSTR("analysisButtonActive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VKAnalyticsInteractionEvent analysisButtonActive](self, "analysisButtonActive"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v3;
  v15[2] = CFSTR("activeInteractionTypes");
  VKMUIStringForAnalysisInteractionTypes(-[VKAnalyticsInteractionEvent activeInteractionTypes](self, "activeInteractionTypes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v4;
  v15[3] = CFSTR("eventType");
  VKMUIStringForVKAnalyticsInteractionEventType(-[VKAnalyticsInteractionEvent eventType](self, "eventType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v5;
  v15[4] = CFSTR("textLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VKAnalyticsInteractionEvent textLength](self, "textLength"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v6;
  v15[5] = CFSTR("ddCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VKAnalyticsInteractionEvent ddCount](self, "ddCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v7;
  v15[6] = CFSTR("mrcCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VKAnalyticsInteractionEvent mrcCount](self, "mrcCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v8;
  v15[7] = CFSTR("vsCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VKAnalyticsInteractionEvent vsCount](self, "vsCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v9;
  v15[8] = CFSTR("automatedTest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v10;
  v15[9] = CFSTR("bundleIdentifier");
  -[VKAnalyticsEvent bundleIdentifier](self, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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
  void *v10;
  void *v11;
  void *v13;
  id v14;
  id v15;
  void *v16;
  objc_super v17;

  v14 = (id)MEMORY[0x1E0CB3940];
  v17.receiver = self;
  v17.super_class = (Class)VKAnalyticsInteractionEvent;
  -[VKAnalyticsInteractionEvent description](&v17, sel_description);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForVKAnalyticsInteractionEventType(-[VKAnalyticsInteractionEvent eventType](self, "eventType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForAnalysisInteractionTypes(-[VKAnalyticsInteractionEvent activeInteractionTypes](self, "activeInteractionTypes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForVKAnalyticsEventSource(-[VKAnalyticsInteractionEvent source](self, "source"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForBool(-[VKAnalyticsInteractionEvent analysisButtonActive](self, "analysisButtonActive"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VKAnalyticsInteractionEvent textLength](self, "textLength"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VKAnalyticsInteractionEvent ddCount](self, "ddCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VKAnalyticsInteractionEvent mrcCount](self, "mrcCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VKAnalyticsInteractionEvent vsCount](self, "vsCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForBool(-[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsEvent bundleIdentifier](self, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ \n eventType: %@ \n activeInteractionTypes: %@ \n source: %@ \n analysisButtonActive: %@ \n textLength: %@ \n ddCount: %@ \n mrcCount: %@ \n vsCount: %@ \n automatedTest: %@ \n bundleIdentifier: %@"), v16, v3, v4, v5, v13, v6, v7, v8, v9, v10, v11);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (BOOL)analysisButtonActive
{
  return self->_analysisButtonActive;
}

- (void)setAnalysisButtonActive:(BOOL)a3
{
  self->_analysisButtonActive = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (unint64_t)activeInteractionTypes
{
  return self->_activeInteractionTypes;
}

- (void)setActiveInteractionTypes:(unint64_t)a3
{
  self->_activeInteractionTypes = a3;
}

- (int64_t)textLength
{
  return self->_textLength;
}

- (void)setTextLength:(int64_t)a3
{
  self->_textLength = a3;
}

- (int64_t)ddCount
{
  return self->_ddCount;
}

- (void)setDdCount:(int64_t)a3
{
  self->_ddCount = a3;
}

- (int64_t)mrcCount
{
  return self->_mrcCount;
}

- (void)setMrcCount:(int64_t)a3
{
  self->_mrcCount = a3;
}

- (int64_t)vsCount
{
  return self->_vsCount;
}

- (void)setVsCount:(int64_t)a3
{
  self->_vsCount = a3;
}

@end
