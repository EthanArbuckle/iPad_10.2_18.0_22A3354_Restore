@implementation SBLogDockRecents

void __SBLogDockRecents_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "DockRecents");
  v1 = (void *)SBLogDockRecents___logObj;
  SBLogDockRecents___logObj = (uint64_t)v0;

}

@end
