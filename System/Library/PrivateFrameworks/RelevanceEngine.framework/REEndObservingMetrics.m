@implementation REEndObservingMetrics

void __REEndObservingMetrics_block_invoke()
{
  if (REMetricsEnabled == 1)
  {
    notify_cancel(_RECoreAnalyticsNotifyToken);
    REMetricsEnabled = 0;
    REClearMetrics();
  }
}

@end
