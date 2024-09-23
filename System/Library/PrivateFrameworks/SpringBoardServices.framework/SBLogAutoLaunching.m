@implementation SBLogAutoLaunching

void __SBLogAutoLaunching_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "AutoLaunching");
  v1 = (void *)SBLogAutoLaunching___logObj;
  SBLogAutoLaunching___logObj = (uint64_t)v0;

}

@end
