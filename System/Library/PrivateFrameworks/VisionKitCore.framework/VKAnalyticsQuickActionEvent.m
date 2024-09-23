@implementation VKAnalyticsQuickActionEvent

- (VKAnalyticsQuickActionEvent)initWithQuickActionType:(id)a3 quickActionsCount:(int64_t)a4 textLength:(int64_t)a5 eventType:(int64_t)a6 customIdentifier:(id)a7
{
  id v13;
  VKAnalyticsQuickActionEvent *v14;
  VKAnalyticsQuickActionEvent *v15;
  objc_super v17;

  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VKAnalyticsQuickActionEvent;
  v14 = -[VKAnalyticsEvent initWithCustomIdentifier:](&v17, sel_initWithCustomIdentifier_, a7);
  v15 = v14;
  if (v14)
  {
    v14->_eventType = a6;
    v14->_quickActionsCount = a4;
    objc_storeStrong((id *)&v14->_quickActionType, a3);
    v15->_textLength = a5;
  }

  return v15;
}

- (id)eventKey
{
  return CFSTR("quickActionEventOccurred");
}

- (int64_t)type
{
  return 5;
}

- (id)coreAnalyticsDictionary
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("eventType");
  VKMUIStringForVKAnalyticsQAEventType(-[VKAnalyticsQuickActionEvent eventType](self, "eventType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("types");
  -[VKAnalyticsQuickActionEvent quickActionType](self, "quickActionType");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E94661A8;
  if (v4)
    v6 = (const __CFString *)v4;
  v14[1] = v6;
  v13[2] = CFSTR("textLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VKAnalyticsQuickActionEvent textLength](self, "textLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  v13[3] = CFSTR("numberOfQuickActions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VKAnalyticsQuickActionEvent quickActionsCount](self, "quickActionsCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v8;
  v13[4] = CFSTR("automatedTest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v9;
  v13[5] = CFSTR("bundleIdentifier");
  -[VKAnalyticsEvent bundleIdentifier](self, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)VKAnalyticsQuickActionEvent;
  -[VKAnalyticsQuickActionEvent description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForVKAnalyticsQAEventType(-[VKAnalyticsQuickActionEvent eventType](self, "eventType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsQuickActionEvent quickActionType](self, "quickActionType");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_1E94661A8;
  v9 = -[VKAnalyticsQuickActionEvent textLength](self, "textLength");
  v10 = -[VKAnalyticsQuickActionEvent quickActionsCount](self, "quickActionsCount");
  VKMUIStringForBool(-[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsEvent bundleIdentifier](self, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ \n eventType: %@ \n types: %@ \n textLength: %lu \n numberOfQuickActions: %lu \n automatedTest: %@ \n bundleIdentifier: %@ "), v4, v5, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (int64_t)quickActionsCount
{
  return self->_quickActionsCount;
}

- (void)setQuickActionsCount:(int64_t)a3
{
  self->_quickActionsCount = a3;
}

- (NSString)quickActionType
{
  return self->_quickActionType;
}

- (void)setQuickActionType:(id)a3
{
  objc_storeStrong((id *)&self->_quickActionType, a3);
}

- (int64_t)textLength
{
  return self->_textLength;
}

- (void)setTextLength:(int64_t)a3
{
  self->_textLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickActionType, 0);
}

@end
