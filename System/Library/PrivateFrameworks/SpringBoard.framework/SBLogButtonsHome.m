@implementation SBLogButtonsHome

void __SBLogButtonsHome_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBButtonLoggingSubsystem, "Home");
  v1 = (void *)SBLogButtonsHome___logObj;
  SBLogButtonsHome___logObj = (uint64_t)v0;

}

@end
