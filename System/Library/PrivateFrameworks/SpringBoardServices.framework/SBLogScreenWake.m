@implementation SBLogScreenWake

void __SBLogScreenWake_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "ScreenWake");
  v1 = (void *)SBLogScreenWake___logObj;
  SBLogScreenWake___logObj = (uint64_t)v0;

}

@end
