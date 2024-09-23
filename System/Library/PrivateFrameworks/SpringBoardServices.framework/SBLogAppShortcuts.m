@implementation SBLogAppShortcuts

void __SBLogAppShortcuts_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "AppShortcuts");
  v1 = (void *)SBLogAppShortcuts___logObj;
  SBLogAppShortcuts___logObj = (uint64_t)v0;

}

@end
