@implementation SBLogHomeScreenConfiguration

void __SBLogHomeScreenConfiguration_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "HomeScreenConfiguration");
  v1 = (void *)SBLogHomeScreenConfiguration___logObj;
  SBLogHomeScreenConfiguration___logObj = (uint64_t)v0;

}

@end
