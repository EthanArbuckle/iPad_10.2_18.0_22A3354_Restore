@implementation VKAnalyticsEvent

- (VKAnalyticsEvent)initWithCustomIdentifier:(id)a3
{
  id v4;
  VKAnalyticsEvent *v5;
  NSDate *v6;
  NSDate *date;
  uint64_t v8;
  NSString *bundleIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VKAnalyticsEvent;
  v5 = -[VKAnalyticsEvent init](&v11, sel_init);
  if (v5)
  {
    v6 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    date = v5->_date;
    v5->_date = v6;

    -[VKAnalyticsEvent bundleIdentifierCleansingIfNecessaryWithCustomIdentifier:](v5, "bundleIdentifierCleansingIfNecessaryWithCustomIdentifier:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    v5->_isPerformingAutomatedTest = +[VKCInternalSettings isPerformingAutomatedTest](VKCInternalSettings, "isPerformingAutomatedTest");
  }

  return v5;
}

- (BOOL)cleansesBundleID
{
  return 0;
}

- (id)bundleIdentifierCleansingIfNecessaryWithCustomIdentifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[VKAnalyticsEvent cleansesBundleID](self, "cleansesBundleID"))
    {
      if (objc_msgSend(v7, "hasPrefix:", CFSTR("com.apple.")))
        v5 = v7;
      else
        v5 = CFSTR("3rdparty");
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)eventKey
{
  return 0;
}

- (id)coreAnalyticsDictionary
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (VKAnalyticsAnalyzerEvent)analyzerEvent
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (VKAnalyticsAnalyzerEvent *)VKDynamicCast(v3, (uint64_t)self);
}

- (VKAnalyticsTextEvent)textEvent
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (VKAnalyticsTextEvent *)VKDynamicCast(v3, (uint64_t)self);
}

- (VKAnalyticsDDEvent)ddEvent
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (VKAnalyticsDDEvent *)VKDynamicCast(v3, (uint64_t)self);
}

- (VKAnalyticsMRCEvent)mrcEvent
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (VKAnalyticsMRCEvent *)VKDynamicCast(v3, (uint64_t)self);
}

- (VKAnalyticsQuickActionEvent)quickActionEvent
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (VKAnalyticsQuickActionEvent *)VKDynamicCast(v3, (uint64_t)self);
}

- (VKAnalyticsInteractionEvent)interactionEvent
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (VKAnalyticsInteractionEvent *)VKDynamicCast(v3, (uint64_t)self);
}

- (VKAnalyticsVisualSearchEvent)visualSearchEvent
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (VKAnalyticsVisualSearchEvent *)VKDynamicCast(v3, (uint64_t)self);
}

- (VKAnalyticsSubjectEvent)subjectEvent
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (VKAnalyticsSubjectEvent *)VKDynamicCast(v3, (uint64_t)self);
}

- (VKAnalyticsDataScannerEvent)dataScannerEvent
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (VKAnalyticsDataScannerEvent *)VKDynamicCast(v3, (uint64_t)self);
}

- (int64_t)type
{
  return 1;
}

- (NSString)bundleIdentifier
{
  if (self->_bundleIdentifier)
    return self->_bundleIdentifier;
  else
    return (NSString *)CFSTR("nil");
}

- (BOOL)isPerformingAutomatedTest
{
  return self->_isPerformingAutomatedTest;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
