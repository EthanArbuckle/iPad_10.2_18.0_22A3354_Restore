@implementation DiagnosticMonitorLog

void __DiagnosticMonitorLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.osanalytics", "DiagnosticMonitor");
  v1 = (void *)DiagnosticMonitorLog___log;
  DiagnosticMonitorLog___log = (uint64_t)v0;

}

@end
