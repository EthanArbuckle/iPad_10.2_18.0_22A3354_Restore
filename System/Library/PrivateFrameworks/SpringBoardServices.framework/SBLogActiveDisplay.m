@implementation SBLogActiveDisplay

void __SBLogActiveDisplay_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "ActiveDisplay");
  v1 = (void *)SBLogActiveDisplay___logObj;
  SBLogActiveDisplay___logObj = (uint64_t)v0;

}

@end
