@implementation PPSMetricLog

void __PPSMetricLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PerfPowerServicesMetadata", "MetricConstruction");
  v1 = (void *)PPSMetricLog___logObj;
  PPSMetricLog___logObj = (uint64_t)v0;

}

@end
