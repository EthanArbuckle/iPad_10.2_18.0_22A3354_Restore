@implementation SBLogButtonsLock

void __SBLogButtonsLock_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBButtonLoggingSubsystem, "Lock");
  v1 = (void *)SBLogButtonsLock___logObj;
  SBLogButtonsLock___logObj = (uint64_t)v0;

}

@end
