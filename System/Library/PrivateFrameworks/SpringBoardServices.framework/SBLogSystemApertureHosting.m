@implementation SBLogSystemApertureHosting

void __SBLogSystemApertureHosting_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "SystemApertureHosting");
  v1 = (void *)SBLogSystemApertureHosting___logObj;
  SBLogSystemApertureHosting___logObj = (uint64_t)v0;

}

@end
