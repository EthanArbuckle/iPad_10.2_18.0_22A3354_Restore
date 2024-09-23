@implementation PPSMetricMonitorLogHandleForCategory

void __PPSMetricMonitorLogHandleForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;

  v0 = os_log_create("com.apple.PerfPowerMetricMonitor", "unspecified");
  v1 = (void *)PPSMetricMonitorLogHandleForCategory_logHandles[0];
  PPSMetricMonitorLogHandleForCategory_logHandles[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.PerfPowerMetricMonitor", "client");
  v3 = (void *)qword_2543CAD98;
  qword_2543CAD98 = (uint64_t)v2;

  v4 = os_log_create("com.apple.PerfPowerMetricMonitor", "service");
  v5 = (void *)qword_2543CADA0;
  qword_2543CADA0 = (uint64_t)v4;

  v6 = os_log_create("com.apple.PerfPowerMetricMonitor", "xpc");
  v7 = (void *)qword_2543CADA8;
  qword_2543CADA8 = (uint64_t)v6;

}

@end
