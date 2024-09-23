@implementation PLLogPowerSignpost

void __PLLogPowerSignpost_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PerfPowerMetricMonitor", "Power");
  v1 = (void *)PLLogPowerSignpost_log;
  PLLogPowerSignpost_log = (uint64_t)v0;

}

@end
