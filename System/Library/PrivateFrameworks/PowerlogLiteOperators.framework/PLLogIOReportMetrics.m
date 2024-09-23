@implementation PLLogIOReportMetrics

void __PLLogIOReportMetrics_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PerfPowerServicesAgent", "ioreportmetrics");
  v1 = (void *)_MergedGlobals_1_32;
  _MergedGlobals_1_32 = (uint64_t)v0;

}

@end
