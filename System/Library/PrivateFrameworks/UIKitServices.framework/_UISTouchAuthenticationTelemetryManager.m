@implementation _UISTouchAuthenticationTelemetryManager

- (_UISTouchAuthenticationTelemetryManager)initWithQueue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UISTouchAuthenticationTelemetryManager;
  return -[_UISTouchAuthenticationTelemetryManager init](&v4, sel_init, a3);
}

- (void)enqueueRecordForAnalytics:(id)a3
{
  _UISTouchAuthenticationTelemetryReportRecordWithDuration(a3, 0);
}

@end
