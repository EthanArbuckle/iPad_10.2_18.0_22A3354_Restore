@implementation RTWiFiManagerNotificationScanResults

- (RTWiFiManagerNotificationScanResults)initWithScanResults:(id)a3
{
  id v4;
  RTWiFiManagerNotificationScanResults *v5;
  uint64_t v6;
  NSArray *scanResults;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTWiFiManagerNotificationScanResults;
  v5 = -[RTNotification init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    scanResults = v5->_scanResults;
    v5->_scanResults = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)scanResults
{
  return self->_scanResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanResults, 0);
}

@end
