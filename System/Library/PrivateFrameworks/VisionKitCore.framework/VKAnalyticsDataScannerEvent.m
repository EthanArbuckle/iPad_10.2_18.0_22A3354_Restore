@implementation VKAnalyticsDataScannerEvent

- (VKAnalyticsDataScannerEvent)initWithFeedDuration:(double)a3 scannedForText:(BOOL)a4 scannedForBarcodes:(BOOL)a5 customIdentifier:(id)a6
{
  VKAnalyticsDataScannerEvent *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VKAnalyticsDataScannerEvent;
  result = -[VKAnalyticsEvent initWithCustomIdentifier:](&v10, sel_initWithCustomIdentifier_, a6);
  if (result)
  {
    result->_feedDuration = a3;
    result->_didScanForText = a4;
    result->_didScanForBarcodes = a5;
  }
  return result;
}

- (id)eventKey
{
  return CFSTR("DataScannerEventOccurred");
}

- (int64_t)type
{
  return 9;
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
  _QWORD v11[5];
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("feedDuration");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[VKAnalyticsDataScannerEvent feedDuration](self, "feedDuration");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = CFSTR("didScanForText");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VKAnalyticsDataScannerEvent didScanForText](self, "didScanForText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = CFSTR("didScanForBarcodes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VKAnalyticsDataScannerEvent didScanForBarcodes](self, "didScanForBarcodes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v11[3] = CFSTR("automatedTest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v7;
  v11[4] = CFSTR("bundleIdentifier");
  -[VKAnalyticsEvent bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VKAnalyticsDataScannerEvent;
  -[VKAnalyticsDataScannerEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsDataScannerEvent coreAnalyticsDictionary](self, "coreAnalyticsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isHealth
{
  void *v2;
  char v3;

  -[VKAnalyticsEvent bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Health"));

  return v3;
}

- (double)feedDuration
{
  return self->_feedDuration;
}

- (void)setFeedDuration:(double)a3
{
  self->_feedDuration = a3;
}

- (BOOL)didScanForText
{
  return self->_didScanForText;
}

- (void)setDidScanForText:(BOOL)a3
{
  self->_didScanForText = a3;
}

- (BOOL)didScanForBarcodes
{
  return self->_didScanForBarcodes;
}

- (void)setDidScanForBarcodes:(BOOL)a3
{
  self->_didScanForBarcodes = a3;
}

@end
