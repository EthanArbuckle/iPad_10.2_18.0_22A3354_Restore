@implementation SBLogStatusBarish

void __SBLogStatusBarish_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "StatusBarish");
  v1 = (void *)SBLogStatusBarish___logObj;
  SBLogStatusBarish___logObj = (uint64_t)v0;

}

@end
