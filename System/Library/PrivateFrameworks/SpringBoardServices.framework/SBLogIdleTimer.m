@implementation SBLogIdleTimer

void __SBLogIdleTimer_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "IdleTimer");
  v1 = (void *)SBLogIdleTimer___logObj;
  SBLogIdleTimer___logObj = (uint64_t)v0;

}

@end
