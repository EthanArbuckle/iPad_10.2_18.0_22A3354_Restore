@implementation VKAnalyticsMRCEvent

- (VKAnalyticsMRCEvent)initWithElement:(id)a3 eventType:(int64_t)a4 customIdentifier:(id)a5
{
  id v8;
  VKAnalyticsMRCEvent *v9;
  VKAnalyticsMRCEvent *v10;
  void *v11;
  uint64_t v12;
  NSString *barcodeSymbology;
  void *v14;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VKAnalyticsMRCEvent;
  v9 = -[VKAnalyticsEvent initWithCustomIdentifier:](&v16, sel_initWithCustomIdentifier_, a5);
  v10 = v9;
  if (v9)
  {
    v9->_eventType = a4;
    objc_msgSend(v8, "barcodeObservation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "symbology");
    v12 = objc_claimAutoreleasedReturnValue();
    barcodeSymbology = v10->_barcodeSymbology;
    v10->_barcodeSymbology = (NSString *)v12;

    objc_msgSend(v8, "barcodeAction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10->__dataType = objc_msgSend(v14, "payloadDataType");

  }
  return v10;
}

- (int64_t)type
{
  return 4;
}

- (id)eventKey
{
  return CFSTR("MRCEventOccured");
}

- (id)coreAnalyticsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("dataTypes");
  VKMUIStringForBCSParsedDataType(-[VKAnalyticsMRCEvent dataType](self, "dataType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("symbology");
  -[VKAnalyticsMRCEvent barcodeSymbology](self, "barcodeSymbology");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("eventType");
  VKMUIStringForVKAnalyticsDDEventType(-[VKAnalyticsMRCEvent eventType](self, "eventType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("automatedTest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("bundleIdentifier");
  -[VKAnalyticsEvent bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)VKAnalyticsMRCEvent;
  -[VKAnalyticsMRCEvent description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForVKAnalyticsDDEventType(-[VKAnalyticsMRCEvent eventType](self, "eventType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForBCSParsedDataType(-[VKAnalyticsMRCEvent dataType](self, "dataType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsMRCEvent barcodeSymbology](self, "barcodeSymbology");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForBool(-[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsEvent bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ \n ddEventType: %@ \n bcsTypes: %@ \n symbology: %@ \n automatedTest: %@ \n bundleIdentifier: %@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (NSString)barcodeSymbology
{
  return self->_barcodeSymbology;
}

- (void)setBarcodeSymbology:(id)a3
{
  objc_storeStrong((id *)&self->_barcodeSymbology, a3);
}

- (int64_t)_dataType
{
  return self->__dataType;
}

- (void)set_dataType:(int64_t)a3
{
  self->__dataType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barcodeSymbology, 0);
}

@end
