@implementation VKAnalyticsTextEvent

- (VKAnalyticsTextEvent)initWithSelectionLength:(unint64_t)a3 totalLength:(unint64_t)a4 selectionWordCount:(unint64_t)a5 macOSSelector:(SEL)a6 includesRichPasteBoardContent:(BOOL)a7 eventType:(int64_t)a8 source:(int64_t)a9 customIdentifier:(id)a10
{
  VKAnalyticsTextEvent *result;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VKAnalyticsTextEvent;
  result = -[VKAnalyticsEvent initWithCustomIdentifier:](&v17, sel_initWithCustomIdentifier_, a10);
  if (result)
  {
    result->_selectionLength = a3;
    result->_totalLength = a4;
    result->_selectionWordCount = a5;
    result->_eventType = a8;
    result->_macOSKBNavigationSelector = a6;
    result->_includesRichPasteboardContent = a7;
    result->_source = a9;
  }
  return result;
}

- (id)eventKey
{
  return CFSTR("textEventOccured");
}

- (int64_t)type
{
  return 2;
}

- (id)coreAnalyticsDictionary
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[8];
  _QWORD v14[9];

  v14[8] = *MEMORY[0x1E0C80C00];
  if (-[VKAnalyticsTextEvent macOSKBNavigationSelector](self, "macOSKBNavigationSelector"))
  {
    NSStringFromSelector(-[VKAnalyticsTextEvent macOSKBNavigationSelector](self, "macOSKBNavigationSelector"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E94661A8;
  }
  v13[0] = CFSTR("eventType");
  VKMUIStringForVKAnalyticsTextEventType(-[VKAnalyticsTextEvent eventType](self, "eventType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v13[1] = CFSTR("eventSource");
  VKMUIStringForVKAnalyticsEventSource(-[VKAnalyticsTextEvent source](self, "source"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = CFSTR("selectionLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VKAnalyticsTextEvent selectionLength](self, "selectionLength"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  v13[3] = CFSTR("selectionLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VKAnalyticsTextEvent selectionWordCount](self, "selectionWordCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v7;
  v13[4] = CFSTR("selectionLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VKAnalyticsTextEvent totalLength](self, "totalLength"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v8;
  v14[5] = v3;
  v13[5] = CFSTR("macOSKBNavigationSelector");
  v13[6] = CFSTR("automatedTest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v9;
  v13[7] = CFSTR("bundleIdentifier");
  -[VKAnalyticsEvent bundleIdentifier](self, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_super v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v16.receiver = self;
  v16.super_class = (Class)VKAnalyticsTextEvent;
  -[VKAnalyticsTextEvent description](&v16, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForVKAnalyticsTextEventType(-[VKAnalyticsTextEvent textEventType](self, "textEventType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForVKAnalyticsEventSource(-[VKAnalyticsTextEvent source](self, "source"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VKAnalyticsTextEvent selectionLength](self, "selectionLength");
  v8 = -[VKAnalyticsTextEvent selectionWordCount](self, "selectionWordCount");
  v9 = -[VKAnalyticsTextEvent totalLength](self, "totalLength");
  VKMUIStringForBool(-[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsEvent bundleIdentifier](self, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ \n textEventType: %@ \n source: %@ \n selectionLength: %lu \n selectionWordCount: %lu \n totalLength: %lu \n automatedTest: %@ \n bundleIdentifier: %@ "), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[VKAnalyticsTextEvent macOSKBNavigationSelector](self, "macOSKBNavigationSelector"))
  {
    NSStringFromSelector(-[VKAnalyticsTextEvent macOSKBNavigationSelector](self, "macOSKBNavigationSelector"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("\n macOSSelector: %@"), v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  return v12;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (unint64_t)selectionLength
{
  return self->_selectionLength;
}

- (void)setSelectionLength:(unint64_t)a3
{
  self->_selectionLength = a3;
}

- (unint64_t)selectionWordCount
{
  return self->_selectionWordCount;
}

- (void)setSelectionWordCount:(unint64_t)a3
{
  self->_selectionWordCount = a3;
}

- (unint64_t)totalLength
{
  return self->_totalLength;
}

- (void)setTotalLength:(unint64_t)a3
{
  self->_totalLength = a3;
}

- (SEL)macOSKBNavigationSelector
{
  return self->_macOSKBNavigationSelector;
}

- (void)setMacOSKBNavigationSelector:(SEL)a3
{
  self->_macOSKBNavigationSelector = a3;
}

- (int64_t)textEventType
{
  return self->_textEventType;
}

- (void)setTextEventType:(int64_t)a3
{
  self->_textEventType = a3;
}

- (BOOL)includesRichPasteboardContent
{
  return self->_includesRichPasteboardContent;
}

- (void)setIncludesRichPasteboardContent:(BOOL)a3
{
  self->_includesRichPasteboardContent = a3;
}

@end
