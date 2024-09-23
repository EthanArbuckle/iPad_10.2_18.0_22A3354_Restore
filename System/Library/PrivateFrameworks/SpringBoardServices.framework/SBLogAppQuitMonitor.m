@implementation SBLogAppQuitMonitor

void __SBLogAppQuitMonitor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "AppQuitMonitor");
  v1 = (void *)SBLogAppQuitMonitor___logObj;
  SBLogAppQuitMonitor___logObj = (uint64_t)v0;

}

@end
